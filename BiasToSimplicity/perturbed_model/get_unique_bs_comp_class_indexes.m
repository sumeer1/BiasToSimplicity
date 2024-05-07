% Get indicies of unique binary strings complexity values

function comp_class_indexes = get_unique_bs_comp_class_indexes(all_net_ts_bin_comp,unique_bs_comp_freq_reshape)
for i = 1:size(unique_bs_comp_freq_reshape,1)
    comp_class_i_indexes = find(all_net_ts_bin_comp == unique_bs_comp_freq_reshape(i,1));
    comp_class_indexes{i} = comp_class_i_indexes;
end