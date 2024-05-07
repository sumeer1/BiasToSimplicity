% Obtain the phenotype of the standard model
function [std_pheno ai ci] = get_std_pheno(phenos, standard_net_ts_bin,s)

[std_pheno ai ci] =  intersect(phenos, standard_net_ts_bin(:,s)','rows');
