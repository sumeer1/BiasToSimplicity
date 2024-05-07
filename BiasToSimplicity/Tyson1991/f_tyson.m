function xdot=f_tyson(t,x,k,v)

% Compartment: id = cell, name = cell, constant
	compartment_cell=1.0;
% assignmentRule: variable = YT
	x(8)=x(6)+x(7)+x(4)+x(5);
% assignmentRule: variable = CT
	x(9)=x(2)+x(3)+x(4)+x(5);

% Reaction: id = Reaction1, name = cyclin_cdc2k dissociation	% Local Parameter:   id =  k6, name = k6
	reaction_Reaction1_k6= k(1)*v(1); %1

	reaction_Reaction1=compartment_cell*reaction_Reaction1_k6*x(4);

% Reaction: id = Reaction2, name = cdc2k phosphorylation	% Local Parameter:   id =  k8notP, name = k8notP
	reaction_Reaction2_k8notP=k(2)*v(2); %1000000.0;

	reaction_Reaction2=compartment_cell*x(2)*reaction_Reaction2_k8notP;

% Reaction: id = Reaction3, name = cdc2k dephosphorylation	% Local Parameter:   id =  k9, name = k9
	reaction_Reaction3_k9= k(3)*v(3); %1000.0;

	reaction_Reaction3=compartment_cell*x(3)*reaction_Reaction3_k9;

% Reaction: id = Reaction4, name = cyclin cdc2k-p association	% Local Parameter:   id =  k3, name = k3
	reaction_Reaction4_k3= k(4)*v(4); %200.0;

	reaction_Reaction4=compartment_cell*x(3)*reaction_Reaction4_k3*x(6);

% Reaction: id = Reaction5, name = deactivation of cdc2 kinase	% Local Parameter:   id =  k5notP, name = k5notP
	reaction_Reaction5_k5notP= k(5)*v(5); %0.0;

	reaction_Reaction5=compartment_cell*reaction_Reaction5_k5notP*x(4);

% Reaction: id = Reaction6, name = cyclin biosynthesis	% Local Parameter:   id =  k1aa, name = k1aa
	reaction_Reaction6_k1aa= k(6)*v(6); %0.015;

	reaction_Reaction6=compartment_cell*reaction_Reaction6_k1aa;

% Reaction: id = Reaction7, name = default degradation of cyclin	% Local Parameter:   id =  k2, name = k2
	reaction_Reaction7_k2= k(7)*v(7); %0.0;

	reaction_Reaction7=compartment_cell*reaction_Reaction7_k2*x(6);

% Reaction: id = Reaction8, name = cdc2 kinase triggered degration of cyclin	% Local Parameter:   id =  k7, name = k7
	reaction_Reaction8_k7=k(8)*v(8);  %0.6;

	reaction_Reaction8=compartment_cell*reaction_Reaction8_k7*x(7);

% Reaction: id = Reaction9, name = activation of cdc2 kinase	% Local Parameter:   id =  k4, name = k4
	reaction_Reaction9_k4= k(9)*v(9); %180.0;
	% Local Parameter:   id =  k4prime, name = k4prime
	reaction_Reaction9_k4prime = k(10)*v(10); %0.018;

	reaction_Reaction9=compartment_cell*x(5)*(reaction_Reaction9_k4prime+reaction_Reaction9_k4*(x(4)/x(9))^2);


	xdot=zeros(9,1);
	
% Species:   id = EmptySet, name = EmptySet
%WARNING speciesID: EmptySet, constant= false  , boundaryCondition = true but is not involved in assignmentRule, rateRule or events !
	xdot(1) = 0.0;
	
% Species:   id = C2, name = cdc2k, affected by kineticLaw
	xdot(2) = (1/(compartment_cell))*(( 1.0 * reaction_Reaction1) + (-1.0 * reaction_Reaction2) + ( 1.0 * reaction_Reaction3));
	
% Species:   id = CP, name = cdc2k-P, affected by kineticLaw
	xdot(3) = (1/(compartment_cell))*(( 1.0 * reaction_Reaction2) + (-1.0 * reaction_Reaction3) + (-1.0 * reaction_Reaction4));
	
% Species:   id = M, name = p-cyclin_cdc2, affected by kineticLaw
	xdot(4) = (1/(compartment_cell))*((-1.0 * reaction_Reaction1) + (-1.0 * reaction_Reaction5) + ( 1.0 * reaction_Reaction9));
	
% Species:   id = pM, name = p-cyclin_cdc2-p, affected by kineticLaw
	xdot(5) = (1/(compartment_cell))*(( 1.0 * reaction_Reaction4) + ( 1.0 * reaction_Reaction5) + (-1.0 * reaction_Reaction9));
	
% Species:   id = Y, name = cyclin, affected by kineticLaw
	xdot(6) = (1/(compartment_cell))*((-1.0 * reaction_Reaction4) + ( 1.0 * reaction_Reaction6) + (-1.0 * reaction_Reaction7));
	
% Species:   id = YP, name = p-cyclin, affected by kineticLaw
	xdot(7) = (1/(compartment_cell))*(( 1.0 * reaction_Reaction1) + (-1.0 * reaction_Reaction8));
	
end
