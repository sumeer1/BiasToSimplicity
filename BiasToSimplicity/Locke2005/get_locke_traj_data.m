Model_name = "Locke-2005";
load k_locke;
vec_sample_space = 0.25:0.25:2;
[sdata, pdata, rand_vecs] = locke_std_ptbd_traj(k, vec_sample_space);