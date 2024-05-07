
%% Get standard and perturbed trajectories of Ueda_2001 Model

function [sdata, pdata, rand_vecs] = ueda_std_ptbd_traj(k, vec_sample_space)
%Initial conditions vector
	x0=zeros(11,1);
	x0(1) = 0.0;
	x0(2) = 0.3;
	x0(3) = 0.4;
	x0(4) = 0.2;
	x0(5) = 0.1;
	x0(6) = 0.6;
	x0(7) = 0.5;
	x0(8) = 0.9;
	x0(9) = 1.0;
	x0(10) = 0.8;
	x0(11) = 0.7;

% standard trajectories
    tspan = 0:1:1000;
	opts = odeset('AbsTol',1e-3);
    v = ones(numel(k),1);
    [t,x]=ode23tb(@f_ueda,tspan,x0,opts,k,v);
    sdata = x;


 % perturbation trajectories
    opts = odeset('AbsTol',1e-100);
    parfor  i = 1:10000
          rand_v = randsample(vec_sample_space,numel(k),true);
          v = rand_v;
          [t,x]=ode23tb(@f_ueda,tspan,x0,opts,k,v);
          while isreal(x) == 0
             rand_v = randsample(vec_sample_space,numel(k),true);
             v = rand_v;
             [t,x]=ode23tb(@f_ueda,tspan,x0,opts,k,v);
          end
          rand_vecs(:,i) = rand_v;
          pdata{i} = x;
     end