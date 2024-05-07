% Obtain unique phenotypes in binary strings
function [phenos ia ic] = get_unique_phenos(all_net_ts_bin)

      all_net_ts_bin_tr = all_net_ts_bin';

[phenos ia ic] = unique(all_net_ts_bin_tr,"rows",'stable');