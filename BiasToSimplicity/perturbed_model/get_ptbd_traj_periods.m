%% Obtain periods of the perturbed model

function Periods = get_ptbd_traj_periods(pdata,tspan,dt,s)
for i = 1:size(pdata,2)
     model_i = pdata{i}; % choose a perturbed model trajectory
     specie = model_i(:,s);  % choose specie for the analysis
     [pks,locs] = findpeaks(specie,tspan);
      per = max(diff(locs));
         if isempty(per) == 1
             period = 0;
         else
             period = per;
         end
     periods(i) = period;
     Periods = periods/dt;
end