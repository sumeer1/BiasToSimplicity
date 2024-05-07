% Start Matlab code
function xdot=f_lee(t,x,k,v)
% End Matlab code

% Start Octave code
%function xdot=f(x,t)
% End Octave code

% Compartment: id = Cytoplasm, name = Cytoplasm, constant
	compartment_Cytoplasm=1.0;
% Compartment: id = Nucleus, name = Nucleus, constant
	compartment_Nucleus=1.0;
% Parameter:   id =  k1, name = k1
	global_par_k1 = k(1)*v(1); % 	global_par_k1 0.182;
% Parameter:   id =  k2, name = k2
	global_par_k2 = k(2)*v(2); % 	global_par_k2 0.0182;
% Parameter:   id =  k3, name = k3
	global_par_k3 = k(3)*v(3); % 	global_par_k3 0.05;
% Parameter:   id =  k4, name = k4
	global_par_k4 = k(4)*v(4); % 	global_par_k4 0.267;
% Parameter:   id =  k5, name = k5
	global_par_k5 = k(5)*v(5); % 	global_par_k5 0.133;
% Parameter:   id =  k6, name = k6
	global_par_k6 = k(6)*v(6); % 	global_par_k6 0.0909;
% Parameter:   id =  k_6, name = k_6
	global_par_k_6 = k(7)*v(7); % 	global_par_k_6 0.909;
% Parameter:   id =  k7, name = k7
	global_par_k7 = k(8)*v(8); % 	global_par_k7 500.0;
% Parameter:   id =  k_7, name = k_7
% Parameter:   id =  k8, name = k8
	global_par_k8 = k(9)*v(9); % 	global_par_k8 500.0;
% Parameter:   id =  k_8, name = k_8
% Parameter:   id =  k9, name = k9
	global_par_k9 = k(10)*v(10); % 	global_par_k9 206.0;
% Parameter:   id =  k10, name = k10
	global_par_k10 = k(11)*v(11); % 	global_par_k10 206.0;
% Parameter:   id =  k11, name = k11
	global_par_k11 = k(12)*v(12); % 	global_par_k11 0.417;
% Parameter:   id =  k12, name = k12
	global_par_k12 = k(13)*v(13); % 	global_par_k12 0.423;
% Parameter:   id =  k13, name = k13
	global_par_k13 = k(14)*v(14); % 	global_par_k13 2.57E-4;
% Parameter:   id =  k14, name = k14
	global_par_k14 = k(15)*v(15); % 	global_par_k14 8.22E-5;
% Parameter:   id =  k15, name = k15
	global_par_k15 = k(16)*v(16); % 	global_par_k15 0.167;
% Parameter:   id =  k16, name = k16
	global_par_k16 = k(17)*v(17); % 	global_par_k16 500.0;
% Parameter:   id =  k_16, name = k_16
% Parameter:   id =  k17, name = k17
	global_par_k17 = k(18)*v(18); % 	global_par_k17 500.0;
% Parameter:   id =  k_17, name = k_17
% Parameter:   id =  K_7, name = K_7
	global_par_K_7 = k(19)*v(19); % 	global_par_K_7 50.0;
% Parameter:   id =  K_8, name = K_8
	global_par_K_8 = k(20)*v(20); % 	global_par_K_8 120.0;
% Parameter:   id =  K_16, name = K_16
	global_par_K_16 = k(21)*v(21); % 	global_par_K_16 30.0;
% Parameter:   id =  K_17, name = K_17
	global_par_K_17 = k(22)*v(22); % 	global_par_K_17 1200.0;
% Parameter:   id =  lambda, name = lambda
	global_par_lambda = k(23)*v(23); % 	global_par_lambda 0.05;
% Parameter:   id =  t0, name = t0
	global_par_t0 = k(24)*v(24); % 	global_par_t0 40.0;
% Parameter:   id =  Dsh0, name = Dsh0
	global_par_Dsh0 = k(25)*v(25); % 	global_par_Dsh0 100.0;
% Parameter:   id =  Total_B_Catenin, name = Total_B_Catenin
% Parameter:   id =  Total_Axin, name = Total_Axin
% assignmentRule: variable = Total_B_Catenin
	global_par_Total_B_Catenin=x(8)+x(9)+x(10)+x(11)+x(14)+x(15);
% assignmentRule: variable = Total_Axin
	global_par_Total_Axin=x(3)+x(4)+x(6)+x(8)+x(9)+x(12);
% assignmentRule: variable = k_16
	global_par_k_16=global_par_k16*global_par_K_16;
% assignmentRule: variable = k_7
	global_par_k_7=global_par_k7*global_par_K_7;
% assignmentRule: variable = k_17
	global_par_k_17=global_par_k17*global_par_K_17;
% assignmentRule: variable = k_8
	global_par_k_8=global_par_k8*global_par_K_8;

% assignmentRule: variable = W
 	species_W = piecewise(0, t < global_par_t0, exp((-1)*global_par_lambda*(t-global_par_t0)));
% piswise(t,global_par_t0,global_par_lambda);
% Reaction: id = v1, name = v1
	reaction_v1=compartment_Cytoplasm*function_for_v1(global_par_k1, x(1), species_W);

% Reaction: id = v2, name = v2
	reaction_v2=compartment_Cytoplasm*global_par_k2*x(2);

% Reaction: id = v3, name = v3
	reaction_v3=compartment_Cytoplasm*function_for_v3(global_par_k3, x(2), x(4));

% Reaction: id = v4, name = v4
	reaction_v4=compartment_Cytoplasm*global_par_k4*x(4);

% Reaction: id = v5, name = v5
	reaction_v5=compartment_Cytoplasm*global_par_k5*x(3);

% Reaction: id = v6, name = v6
	reaction_v6=compartment_Cytoplasm*(global_par_k6*x(5)*x(6)-global_par_k_6*x(4));

% Reaction: id = v7, name = v7
	reaction_v7=compartment_Cytoplasm*(global_par_k7*x(7)*x(12)-global_par_k_7*x(6));

% Reaction: id = v8, name = v8
	reaction_v8=global_par_k8*x(3)*x(11)-global_par_k_8*x(8);

% Reaction: id = v9, name = v9
	reaction_v9=compartment_Cytoplasm*global_par_k9*x(8);

% Reaction: id = v10, name = v10
	reaction_v10=compartment_Cytoplasm*global_par_k10*x(9);

% Reaction: id = v11, name = v11
	reaction_v11=compartment_Cytoplasm*global_par_k11*x(10);

% Reaction: id = v12, name = v12
     
    reaction_v12=compartment_Nucleus*global_par_k12;

% Reaction: id = v13, name = v13
	reaction_v13=compartment_Nucleus*global_par_k13*x(11);

 % Reaction: id = v14, name = v14

    reaction_v14=compartment_Cytoplasm*global_par_k14;
    

% Reaction: id = v15, name = v15
	reaction_v15=compartment_Cytoplasm*global_par_k15*x(12);

% Reaction: id = v16, name = v16
	reaction_v16=compartment_Nucleus*(global_par_k16*x(11)*x(13)-global_par_k_16*x(14));

% Reaction: id = v17, name = v17
	reaction_v17=global_par_k17*x(7)*x(11)-global_par_k_17*x(15);
	
% Species:   id = W, name = W, involved in a rule 


	xdot=zeros(15,1);
	
% Species:   id = Dsh_i, name = Dsh_i, affected by kineticLaw
	xdot(1) = (1/(compartment_Cytoplasm))*((-1.0 * reaction_v1) + ( 1.0 * reaction_v2));
	
% Species:   id = Dsh_a, name = Dsh_a, affected by kineticLaw
	xdot(2) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v1) + (-1.0 * reaction_v2));
	
% Species:   id = APC__axin__GSK3, name = APC*/axin*/GSK3, affected by kineticLaw
	xdot(3) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v4) + (-1.0 * reaction_v5) + (-1.0 * reaction_v8) + ( 1.0 * reaction_v10));
	
% Species:   id = APC_axin_GSK3, name = APC/axin/GSK3, affected by kineticLaw
	xdot(4) = (1/(compartment_Cytoplasm))*((-1.0 * reaction_v3) + (-1.0 * reaction_v4) + ( 1.0 * reaction_v5) + ( 1.0 * reaction_v6));
	
% Species:   id = GSK3, name = GSK3, affected by kineticLaw
	xdot(5) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v3) + (-1.0 * reaction_v6));
	
% Species:   id = APC_axin, name = APC/axin, affected by kineticLaw
	xdot(6) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v3) + (-1.0 * reaction_v6) + ( 1.0 * reaction_v7));
	
% Species:   id = APC, name = APC, affected by kineticLaw
	xdot(7) = (1/(compartment_Cytoplasm))*((-1.0 * reaction_v7) + (-1.0 * reaction_v17));
	
% Species:   id = B_catenin_APC__axin__GSK3, name = B_catenin/APC*/axin*/GSK3, affected by kineticLaw
	xdot(8) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v8) + (-1.0 * reaction_v9));
	
% Species:   id = B_catenin__APC__axin__GSK3, name = B_catenin*/APC*/axin*/GSK3, affected by kineticLaw
	xdot(9) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v9) + (-1.0 * reaction_v10));
	
% Species:   id = B_catenin, name = B_catenin*, affected by kineticLaw
	xdot(10) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v10) + (-1.0 * reaction_v11));
	
% Species:   id = B_catenin_0, name = B_catenin, affected by kineticLaw
	xdot(11) = (1/(compartment_Nucleus))*((-1.0 * reaction_v8) + ( 1.0 * reaction_v12) + (-1.0 * reaction_v13) + (-1.0 * reaction_v16) + (-1.0 * reaction_v17));
	
% Species:   id = Axin, name = Axin, affected by kineticLaw
	xdot(12) = (1/(compartment_Cytoplasm))*((-1.0 * reaction_v7) + ( 1.0 * reaction_v14) + (-1.0 * reaction_v15));
	
% Species:   id = TCF, name = TCF, affected by kineticLaw
	xdot(13) = (1/(compartment_Nucleus))*((-1.0 * reaction_v16));
	
% Species:   id = B_catenin_TCF, name = B_catenin/TCF, affected by kineticLaw
	xdot(14) = (1/(compartment_Nucleus))*(( 1.0 * reaction_v16));
	
% Species:   id = B_catenin_APC, name = B_catenin/APC, affected by kineticLaw
	xdot(15) = (1/(compartment_Cytoplasm))*(( 1.0 * reaction_v17));
end


function z=Constant_flux__irreversible(v), z=(v);end

function z=function_for_v1(k1,x1,W), z=(k1*x1*W);end

function z=function_for_v3(k3,x2,x4), z=(k3*x2*x4);end

% adding few functions representing operators used in SBML but not present directly 
% in either matlab or octave. 
function z=pow(x,y),z=x^y;end
function z=root(x,y),z=y^(1/x);end
function z = piecewise(varargin)
	numArgs = nargin;
	result = 0;
	foundResult = 0;
	for k=1:2: numArgs-1
		if varargin{k+1} == 1
			result = varargin{k};
			foundResult = 1;
			break;
		end
	end
	if foundResult == 0
		result = varargin{numArgs};
	end
	z = result;
end