% Obtain perturbed trajectories coarse grained time series binary strings
function all_net_ts_bin = get_ptbd_traj_cg_ts_bs(coarse_grained_ts_store,pdata)
for i = 1:size(pdata,2)
         net_i_ts = coarse_grained_ts_store(:,i);
         
              net_i_ts_diff = diff(net_i_ts);
             
                   for l = 1:length(net_i_ts_diff)
                       if   net_i_ts_diff(l)>= 0
                            net_i_ts_bin(l) = 1;
                       else net_i_ts_bin(l)= 0;
                       end
                   end
          all_net_ts_bin(:,i) = net_i_ts_bin;
end