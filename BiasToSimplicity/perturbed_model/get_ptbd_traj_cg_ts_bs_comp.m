% Obtain k complexity of coarse grained time series binaries of perturbed
% trajectories
function all_net_ts_bin_comp = get_ptbd_traj_cg_ts_bs_comp(all_net_ts_bin,pdata)
for i = 1:size(pdata,2)
   net_i_bin_comp = kolmogorov(all_net_ts_bin(:,i));
   all_net_ts_bin_comp(:,i) = net_i_bin_comp;
end