%% Obtain the period of specie for standard trajectory
% inputs: standard data trajectory, integration time vector, integration sampling time

function Periods = get_std_traj_periods(sdata,tspan,dt)

        for i = 1:size(sdata,2)
              specie = sdata(:,i);
             [pks,locs] = findpeaks(specie,tspan);
              per = max(diff(locs));
                 if isempty(per) == 1
                     period = 0;
                 else
                     period = per;
                 end
              period = period/dt;
              Periods(i) = period;
        end
end