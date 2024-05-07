% Obtain frequency of phenotypes in each complexity class
function [phenos_freq, phenos_id] = get_pheno_freq_in_comp_class(ic,comp_class_indexes)
phenos_id = unique(ic);
for i = 1:length(phenos_id)
    pheno_i_indices = find(ic == phenos_id(i,1));
    for j = 1:length(comp_class_indexes)
        pheno_i_count = intersect(pheno_i_indices,comp_class_indexes{1,j});
        pheno_i_in_comp_class_j{j,1} =  pheno_i_count;
    end
  phenos_freq{1,i} = pheno_i_in_comp_class_j;
end