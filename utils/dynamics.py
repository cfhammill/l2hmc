# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
Dyanmics object
"""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import tensorflow as tf
import numpy as np


def safe_exp(x, name=None):
  return tf.exp(x)
  return tf.check_numerics(tf.exp(x), message='%s is NaN' % name)

class Dynamics(object):
  def __init__(self,
               x_dim,
               energy_function,
               T=25,
               eps=0.1,
               hmc=False,
               net_factory=None,
               eps_trainable=True,
               use_temperature=False):

    self.x_dim = x_dim
    self.use_temperature = use_temperature
    self.temperature = tf.placeholder(tf.float32, shape=())

    alpha = tf.get_variable(
        'alpha',
        initializer=tf.log(tf.constant(eps)),
        trainable=eps_trainable,
    )

    self.eps = safe_exp(alpha, name='alpha')
    self._fn = energy_function

    # if HMC we just return all zeros
    if hmc:
      z = lambda x, *args, **kwargs: tf.zeros_like(x)
      self.Sv, self.Tv, self.Sx, self.Tx = z, z, z, z
      self.Fv, self.Fx = z, z
    else:
      self.XNet = net_factory(x_dim, scope='XNet', factor=2.0)
      self.VNet = net_factory(x_dim, scope='VNet', factor=1.0)
      self.Sv, self.Tv, self.Fv = self.VNet.S, self.VNet.T, self.VNet.F
      self.Sx, self.Tx, self.Fx = self.XNet.S, self.XNet.T, self.XNet.F

    self.T = T

  def _format_time(self, t, tile=1):
    trig_t = tf.squeeze([
        tf.cos(2 * np.pi * t / self.T),
        tf.sin(2 * np.pi * t / self.T),
    ])

    return tf.tile(tf.expand_dims(trig_t, 0), (tile, 1))

  def kinetic(self, v):
    return 0.5 * tf.diag_part(tf.matmul(v, tf.transpose(v)))

  def clip_with_grad(self, u, min_u=-32., max_u=32.):
    u = u - tf.stop_gradient(tf.nn.relu(u - max_u))
    u = u + tf.stop_gradient(tf.nn.relu(min_u - u))
    return u

  def _forward_step(self, x, v, step, aux=None):
    t = self._format_time(step, tile=tf.shape(x)[0])

    sv1 = 0.5 * self.eps * self.Sv(x, self.grad_energy(x, aux=aux), t, aux=aux)
    tv1 = self.Tv(x, self.grad_energy(x, aux=aux), t, aux=aux)
    fv1 = self.eps * self.Fv(x, self.grad_energy(x, aux=aux), t, aux=aux)

    v_h = tf.multiply(v, safe_exp(sv1, name='sv1F')) + 0.5 * self.eps * (-tf.multiply(safe_exp(fv1, name='fv1F'), self.grad_energy(x, aux=aux)) + tv1)

    m, mb = self._gen_mask(x)

    sx1 = (self.eps * self.Sx(v_h, m * x, t, aux=aux))
    tx1 = self.Tx(v_h, m * x, t, aux=aux)
    fx1 = self.eps * self.Fx(v_h, m * x, t, aux=aux)

    y = m * x + mb * (tf.multiply(x, safe_exp(sx1, name='sx1F')) + self.eps * (tf.multiply(safe_exp(fx1, name='fx1F'), v_h) + tx1))

    sx2 = (self.eps * self.Sx(v_h, mb * y, t, aux=aux))
    tx2 = self.Tx(v_h, mb * y, t, aux=aux)
    fx2 = self.eps * self.Fx(v_h, mb * y, t, aux=aux)

    x_o = mb * y + m * (tf.multiply(y, safe_exp(sx2, name='sx2F')) + self.eps * (tf.multiply(safe_exp(fx2, name='fx2F'), v_h) + tx2))

    sv2 = (0.5 * self.eps * self.Sv(x_o, self.grad_energy(x_o, aux=aux), t, aux=aux))
    tv2 = self.Tv(x_o, self.grad_energy(x_o, aux=aux), t, aux=aux)
    fv2 = self.eps * self.Fv(x_o, self.grad_energy(x_o, aux=aux), t, aux=aux)

    v_o = tf.multiply(v_h, safe_exp(sv2, name='sv2F')) + 0.5 * self.eps * (-tf.multiply(safe_exp(fv2, name='fv2F'), self.grad_energy(x_o, aux=aux)) + tv2)

    log_jac_contrib = tf.reduce_sum(sv1 + sv2 + mb * sx1 + m * sx2, axis=1)

    tf.add_to_collection('sv1', sv1)
    tf.add_to_collection('sv2', sv2)
    tf.add_to_collection('sx1', sx1)
    tf.add_to_collection('sx2', sx2)

    tf.add_to_collection('tv1', self.eps * tv1)
    tf.add_to_collection('tv2', self.eps * tv2)
    tf.add_to_collection('tx1', self.eps * tx1)
    tf.add_to_collection('tx2', self.eps * tx2)

    tf.add_to_collection('fv1', fv1)
    tf.add_to_collection('fv2', fv2)
    tf.add_to_collection('fx1', fx1)
    tf.add_to_collection('fx2', fx2)

    return x_o, v_o, log_jac_contrib

  def _backward_step(self, x_o, v_o, step, aux=None):
    t = self._format_time(step, tile=tf.shape(x_o)[0])

    sv2 = (-0.5 * self.eps * self.Sv(x_o, self.grad_energy(x_o, aux=aux), t, aux=aux))
    tv2 = self.Tv(x_o, self.grad_energy(x_o, aux=aux), t, aux=aux)
    fv2 = self.eps * self.Fv(x_o, self.grad_energy(x_o, aux=aux), t, aux=aux)

    v_h = tf.multiply((v_o - 0.5 * self.eps * (-tf.multiply(safe_exp(fv2, name='fv2B'), self.grad_energy(x_o, aux=aux)) + tv2)), safe_exp(sv2, name='sv2B'))

    m, mb = self._gen_mask(x_o)

    sx2 = (-self.eps * self.Sx(v_h, mb * x_o, t, aux=aux))
    tx2 = self.Tx(v_h, mb * x_o, t, aux=aux)
    fx2 = self.eps * self.Fx(v_h, mb * x_o, t, aux=aux)

    y = mb * x_o + m * tf.multiply(safe_exp(sx2, name='sx2B'), (x_o - self.eps * (tf.multiply(safe_exp(fx2, name='fx2B'), v_h) + tx2)))

    sx1 = (-self.eps * self.Sx(v_h, m * y, t, aux=aux))
    tx1 = self.Tx(v_h, m * y, t, aux=aux)
    fx1 = self.eps * self.Fx(v_h, m * y, t, aux=aux)

    x = m * y + mb * tf.multiply(safe_exp(sx1, name='sx1B'), (y - self.eps * (tf.multiply(safe_exp(fx1, name='fx1B'), v_h) + tx1)))

    sv1 = (-0.5 * self.eps * self.Sv(x, self.grad_energy(x, aux=aux), t, aux=aux))
    tv1 = self.Tv(x, self.grad_energy(x, aux=aux), t, aux=aux)
    fv1 = self.eps * self.Fv(x, self.grad_energy(x, aux=aux), t, aux=aux)

    v = tf.multiply(safe_exp(sv1, name='sv1B'), (v_h - 0.5 * self.eps * (-tf.multiply(safe_exp(fv1, name='fv1B'), self.grad_energy(x, aux=aux)) + tv1)))

    return x, v, tf.reduce_sum(sv1 + sv2 + mb * sx1 + m * sx2, axis=1)

  def energy(self, x, aux=None):
    if self.use_temperature:
      T = self.temperature
    else:
      T = tf.constant(1.0)

    if aux is not None:
      print('aux there')
      return self._fn(x, aux=aux) / T
    else:
      print('no aux')
      return self._fn(x) / T

  def hamiltonian(self, x, v, aux=None):
    return self.energy(x, aux=aux) + self.kinetic(v)

  def grad_energy(self, x, aux=None):
    return tf.gradients(self.energy(x, aux=aux), x)[0]

  def _gen_mask(self, x):
    dX = x.get_shape().as_list()[1]
    b = np.zeros(self.x_dim)
    for i in range(self.x_dim):
      if i % 2 == 0:
        b[i] = 1
    b = b.astype('bool')
    nb = np.logical_not(b)

    return b, nb
#
#   def forward(self, x, init_v=None):
#     if init_v is None:
#       v = tf.random_normal(tf.shape(x))
#     else:
#       v = init_v
#
#     dN = tf.shape(x)[0]
#     j = tf.zeros((dN,))
#     curr_x, curr_v = x, v
#     for t in range(self.T):
#       curr_x, curr_v, log_j = self._forward_step(curr_x, curr_v, t)
#       j += log_j
#
#     return curr_x, curr_v, self.p_accept(x, v, curr_x, curr_v, j)

  def forward(self, x, init_v=None, aux=None, log_path=False):
    if init_v is None:
      v = tf.random_normal(tf.shape(x))
    else:
      v = init_v

    dN = tf.shape(x)[0]
    t = tf.constant(0.)
    j = tf.zeros((dN,))

    def body(x, v, t, j):
      #array = array.write(tf.cast(t, tf.int32), x)
      new_x, new_v, log_j = self._forward_step(x, v, t, aux=aux)
      return new_x, new_v, t+1, j+log_j

    def cond(x, v, t, j):
      return tf.less(t, self.T)

    # X, V, t, log_jac, array = tf.while_loop(cond=cond, body=body, loop_vars=[x, v, t, j, tf.TensorArray(tf.float32, size=self.T)])
    X, V, t, log_jac = tf.while_loop(
        cond=cond,
        body=body,
        loop_vars=[x, v, t, j]
    )

    # tf.add_to_collection('forward', array.stack())
    return tf.check_numerics(X, message='forward X'), V, self.p_accept(x, v, X, V, log_jac, aux=aux)

  def backward(self, x, init_v=None, aux=None):
    if init_v is None:
      v = tf.random_normal(tf.shape(x))
    else:
      v = init_v

    dN = tf.shape(x)[0]
    t = tf.constant(0., name='step_backward')
    j = tf.zeros((dN,), name='acc_jac_backward')

    def body(x, v, t, j):
      # array = array.write(tf.cast(t, tf.int32), x)
      new_x, new_v, log_j = self._backward_step(x, v, self.T - t - 1, aux=aux)
      return new_x, new_v, t+1, j+log_j

    def cond(x, v, t, j):
      return tf.less(t, self.T)

    X, V, t, log_jac = tf.while_loop(
        cond=cond,
        body=body,
        loop_vars=[x, v, t, j]
    )
    # tf.add_to_collection('backward', array.stack())
    return tf.check_numerics(X, message='backward X'), V, self.p_accept(x, v, X, V, log_jac, aux=aux)

  def p_accept(self, x0, v0, x1, v1, log_jac, aux=None):
    e_new = self.hamiltonian(x1, v1, aux=aux)
    e_old = self.hamiltonian(x0, v0, aux=aux)

    tf.add_to_collection('old_energy', e_old)
    tf.add_to_collection('new_energy', e_new)
    tf.add_to_collection('log_jac', log_jac)

    return tf.exp(tf.minimum(e_old - e_new + log_jac, 0.0))

  #  return safe_exp(tf.minimum(tf.check_numerics(e_old - e_new + log_jac, message='inside safe exp is NaN'), 0.0), name='acceptance log prob')

#   def _gen_mask(self, x):
#     dX = x.get_shape().as_list()[1]
#     b = np.zeros(dX,)
#     s = np.random.permutation(dX,)
#     b[s[:dX/2]] = 1
#     b = b.astype('bool')
#     nb = np.logical_not(b)
#
#     return b, nb