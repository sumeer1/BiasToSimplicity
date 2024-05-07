% ploting frequency vs unique phenotype for each complexity class
function freq_comp_plot = get_freq_comp_plot(phenos_freq,unique_phen_by_comp,unique_bs_comp_freq_reshape,standard_net_ts_bin_comp,ai,s,cut_off_period,Model_name)
 freq_comp_plot = figure; 
 width = 400;
 height = 300;
 set(gcf,'Position',[300, 300, width, height])
  hold;
for i = 1:length(phenos_freq{1,1})  
    case_i = unique_phen_by_comp(i,:);
     
    type_std = repelem(unique_bs_comp_freq_reshape(i,1),length(case_i));
    scatter(type_std,case_i)
end
       type_ptbd = repelem(standard_net_ts_bin_comp(s),size(unique_phen_by_comp,1));
       scatter(type_ptbd,unique_phen_by_comp(:,ai),'*','*r')
        set(gca,'YScale','log')
grid on; box on
title({'log freq.  vs. k.complexity'}, {[num2str(Model_name),', Specie ',num2str(s),', Cg-ts:', num2str(cut_off_period)]}); ylabel ('log frequency'); xlabel('k complexity')
xlim([1 max(unique_bs_comp_freq_reshape(:,1)+1)]);  ylim([1 1e4]);
