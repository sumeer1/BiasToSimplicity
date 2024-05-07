% % Obtain binary strings of standard trajectory coarse grained time series
function standard_net_ts_bin = get_std_traj_cg_ts_bs(coarse_grained_ts_store,sdata)

for i = 1:size(sdata,2)
         net_i_ts = coarse_grained_ts_store(:,i);
         
              net_i_ts_diff = diff(net_i_ts);
             
                   for l = 1:length(net_i_ts_diff)
                       if   net_i_ts_diff(l)>= 0
                            net_i_ts_bin(l) = 1;
                       else net_i_ts_bin(l)= 0;
                       end
                   end
          standard_net_ts_bin(:,i) = net_i_ts_bin;
end