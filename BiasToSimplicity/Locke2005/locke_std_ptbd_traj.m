
%% Get standard and perturbed trajectories of Locke_2005 Model

function [sdata, pdata, rand_vecs] = locke_std_ptbd_traj(k, vec_sample_space)
%Initial conditions vector
	x0=zeros(13,1);
	x0(1) = 0.539;
	x0(2) = 0.015;
	x0(3) = 0.0855;
	x0(4) = 0.456;
	x0(5) = 8.7;
	x0(6) = 0.4;
	x0(7) = 0.08;
	x0(8) = 1.34;
	x0(9) = 0.4;
	x0(10) = 0.037;
	x0(11) = 0.004;
	x0(12) = 0.013;
	x0(13) = 0.835;

% standard trajectories
    tspan = 0:1:1000;
	opts = odeset('AbsTol',1e-6);
    v = ones(numel(k),1);
    [t,x]=ode23tb(@f_locke,tspan,x0,opts,k,v);
    sdata = x;


 % perturbation trajectories
    parfor  i = 1:10000
          rand_v = randsample(vec_sample_space,numel(k),true);
          v = rand_v;
          [t,x]=ode23tb(@f_locke,tspan,x0,opts,k,v);
          while isreal(x) == 0
             rand_v = randsample(vec_sample_space,numel(k),true);
             v = rand_v;
             [t,x]=ode23tb(@f_locke,tspan,x0,opts,k,v);
          end
          rand_vecs(:,i) = rand_v;
          pdata{i} = x;
     end