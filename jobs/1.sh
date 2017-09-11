#!/bin/bash
blaze build -c opt --copt=-mavx \
  learning/brain/public/tensorflow_std_server{,_gpu} \
  experimental/users/danilevy/l2hmc/run.par

/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-05,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-04,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-03,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=1.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=adam,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_no_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=false'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=2.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=4.00'" experimental/users/danilevy/l2hmc/launch.borg reload
/google/data/ro/teams/traino/borgcfg --skip_confirmation --vars "exp_id=1_with_temp_mog,cell=is,hparams='learning_rate=5.0e-02,optimizer=rmsprop,loss=inv_minus_std,task=mog,use_temperature=true,start_temperature=8.00'" experimental/users/danilevy/l2hmc/launch.borg reload
