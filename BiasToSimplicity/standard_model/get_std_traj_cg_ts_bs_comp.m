% % Obtain the k complexity of standard trajectory time series binary strings

function standard_net_ts_bin_comp = get_std_traj_cg_ts_bs_comp(standard_net_ts_bin,sdata)

for i = 1:size(sdata,2)
   net_i_bin_comp = kolmogorov(standard_net_ts_bin(:,i));
   standard_net_ts_bin_comp(:,i) = net_i_bin_comp;
end