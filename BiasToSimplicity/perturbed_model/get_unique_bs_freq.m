% Obtain frequency of each unique binary string
function unique_bs_idx_freq_reshape = get_unique_bs_freq(ic)
    unique_bs_idx = unique(ic);
    unique_bs_idx_freq = [unique_bs_idx, histc(ic,unique_bs_idx)];
    unique_bs_idx_freq_reshape = reshape(unique_bs_idx_freq,[],2);