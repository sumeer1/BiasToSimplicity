% Obtain k. complexity & frequency of unique binary strings   
function unique_bs_comp_freq_reshape = get_unique_bs_comp_freq(all_net_ts_bin_comp)
unique_bs_comp = unique(all_net_ts_bin_comp);
unique_bs_comp_freq = [unique_bs_comp,histc(all_net_ts_bin_comp,unique_bs_comp)];
unique_bs_comp_freq_reshape= reshape(unique_bs_comp_freq,[],2);