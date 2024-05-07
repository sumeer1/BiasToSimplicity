dt = 1;
tspan = 0:dt:1000;
cut_off_period = 20; 

Periods = get_std_traj_periods(sdata,tspan,dt);
coarse_grained_ts_store = get_std_traj_cg_ts(sdata, Periods, cut_off_period);
standard_net_ts_bin = get_std_traj_cg_ts_bs(coarse_grained_ts_store,sdata);
standard_net_ts_bin_comp = get_std_traj_cg_ts_bs_comp(standard_net_ts_bin,sdata);


for s = 1:size(sdata,2)
    Periods = get_ptbd_traj_periods(pdata,tspan,dt,s);
    coarse_grained_ts_store = get_ptbd_traj_cg_ts(pdata, Periods, cut_off_period,s);
    all_net_ts_bin = get_ptbd_traj_cg_ts_bs(coarse_grained_ts_store,pdata);
    all_net_ts_bin_comp = get_ptbd_traj_cg_ts_bs_comp(all_net_ts_bin,pdata);
    [phenos ia ic] = get_unique_phenos(all_net_ts_bin);
    [std_pheno ai ci] = get_std_pheno(phenos, standard_net_ts_bin,s);
    unique_bs_idx_freq_reshape = get_unique_bs_freq(ic);
    unique_bs_comp_freq_reshape = get_unique_bs_comp_freq(all_net_ts_bin_comp);
    comp_class_indexes = get_unique_bs_comp_class_indexes(all_net_ts_bin_comp,unique_bs_comp_freq_reshape);
    [phenos_freq, phenos_id] = get_pheno_freq_in_comp_class(ic,comp_class_indexes);
    unique_phen_by_comp = get_unique_phen_in_same_comp(phenos_id,phenos_freq);
    freq_comp_plot = get_freq_comp_plot(phenos_freq,unique_phen_by_comp,unique_bs_comp_freq_reshape,standard_net_ts_bin_comp,ai,s,cut_off_period,Model_name);
end