Model_name = "Lee-2003";
load k_lee;
vec_sample_space = 0.25:0.25:2;
[sdata, pdata, rand_vecs] = lee_std_ptbd_traj(k, vec_sample_space);