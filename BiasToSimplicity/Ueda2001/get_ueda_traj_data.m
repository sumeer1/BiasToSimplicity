Model_name = "Ueda-2001";
load k_ueda;
vec_sample_space = 0.25:0.25:2;
[sdata, pdata, rand_vecs] = ueda_std_ptbd_traj(k, vec_sample_space);