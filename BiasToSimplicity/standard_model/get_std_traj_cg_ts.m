% % Obtain coarse grained time series periods of spechies for the standard trajectory

function coarse_grained_ts_store = get_std_traj_cg_ts(sdata, Periods, cut_off_period)

for i = 1:size(sdata,2)
     specie = sdata(:,i);
     if Periods(i) > cut_off_period
         quotient_i = length(specie)/Periods(i);
         ts_i_period_sequence = specie(floor(quotient_i*Periods(i) - Periods(i)):floor(quotient_i*Periods(i)));
         downsample_factor_i = floor(length(ts_i_period_sequence)/cut_off_period);
          if downsample_factor_i == 1
              coarsegrained_ts_i = ts_i_period_sequence(1:cut_off_period);
          else 
              coarsegrained_ts_i = downsample(ts_i_period_sequence,downsample_factor_i);
              coarsegrained_ts_i = coarsegrained_ts_i(1:cut_off_period);
          end
     elseif Periods(i) <= cut_off_period
            ts_i_period_sequence = specie(floor((length(specie)/2):end));
            coarsegrained_ts_i = ts_i_period_sequence(1:cut_off_period);
     end
     coarse_grained_ts_store(:,i) = coarsegrained_ts_i; 
end