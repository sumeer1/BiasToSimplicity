Model_name = "Vilar-2002";
load k_vilar;
vec_sample_space = 0.25:0.25:2;
[sdata, pdata, rand_vecs] = vilar_std_ptbd_traj(k, vec_sample_space);