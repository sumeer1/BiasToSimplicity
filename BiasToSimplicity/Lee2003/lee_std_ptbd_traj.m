
%% Get standard and perturbed trajectories of Lee_2003 Model

function [sdata, pdata, rand_vecs] = lee_std_ptbd_traj(k, vec_sample_space)
%Initial conditions vector
	x0=zeros(15,1);
	x0(1) = 100.0;
	x0(2) = 0.0;
	x0(3) = 0.00966;
	x0(4) = 0.00483;
	x0(5) = 50.0;
	x0(6) = 9.8065E-4;
	x0(7) = 98.0;
	x0(8) = 0.00202;
	x0(9) = 0.00202;
	x0(10) = 1.0;
	x0(11) = 25.1;
	x0(12) = 4.93E-4;
	x0(13) = 8.17;
	x0(14) = 6.83;
	x0(15) = 2.05;

% standard trajectories
    tspan = 0:1:1000;
	opts = odeset('AbsTol',1e-6);
    v = ones(numel(k),1);
    [t,x]=ode23tb(@f_lee,tspan,x0,opts,k,v);
    sdata = x;


 % perturbation trajectories
    opts = odeset('AbsTol',1e-6);
    parfor  i = 1:10000
          rand_v = randsample(vec_sample_space,numel(k),true);
          v = rand_v;
          [t,x]=ode23tb(@f_lee,tspan,x0,opts,k,v);
          while isreal(x) == 0
             rand_v = randsample(vec_sample_space,numel(k),true);
             v = rand_v;
             [t,x]=ode23tb(@f_lee,tspan,x0,opts,k,v);
          end
          rand_vecs(:,i) = rand_v;
          pdata{i} = x;
     end