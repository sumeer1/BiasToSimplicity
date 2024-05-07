Model_name = "Tyson-1991";
load k_tyson;
vec_sample_space = 0.25:0.25:2;
[sdata, pdata, rand_vecs] = tyson_std_ptbd_traj(k, vec_sample_space);