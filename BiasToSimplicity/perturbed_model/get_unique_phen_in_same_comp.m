% collect unique phenotypes with identical complexity class 
function unique_phen_by_comp = get_unique_phen_in_same_comp(phenos_id,phenos_freq)
for i = 1:length(phenos_id)
    for j= 1:length(phenos_freq{1,1}) 
    sort_i = length(phenos_freq{1,i}{j,1});
    unique_phen_by_comp(j,i) = sort_i;
    end
end