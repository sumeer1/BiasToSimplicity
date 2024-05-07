Model_name = "Leloup-2003";
load k_leloup;
vec_sample_space = 0.25:0.25:2;
[sdata, pdata, rand_vecs] = leloup_std_ptbd_traj(k, vec_sample_space);