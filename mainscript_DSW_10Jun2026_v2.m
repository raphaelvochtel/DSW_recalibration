% Early June 2024
% Two sector model
% This script sets parameters and calls functions that solve for the steady
% state

clear; clc;

% Parameters (declare for N and S separately)
% Common to N and S
par.beta            = 0.99;             %discount factor
par.r               = 1/par.beta - 1;   %interest rate on bonds
par.eta             = 0.5;              %adjustment cost of bonds
par.s               = 0.005;            %retirement rate
par.delta           = 0.025;            %exogenous death rate
par.theta           = 3.8;              %elasticity of substitution
par.k               = 3.4;              %Pareto shape parameter
par.z_min           = 1;                %Pareto minimum parameter
par.gamma           = 1;                %CRRA parameter MUST BE ONE!!!
par.pers            = 0.9;              %Persistence of the TFP shock
par.pers_pol        = 0.56;             %Persistence of policy shock
par.sigma_Z         = 0.01;             %Standard deviation of the TFP shock
par.sigma_pol       = 0.1;             %Standard deviation of the tariff policy shock
par.sigmah          = 1;
par.sigmal          = par.sigmah;
par_star            = par;

% Targets in the data
tar.skilled_prem    = 1.369;             %skilled wage premium
tar.trade_share     = 0.20;             %US trade share
tar.fracX           = 0.09;             %fraction of exporters
tar.fracV           = 0.0054;           %fraction of vertical mnes
tar.Xint            = 0.15;             %export intensity
tar.trade_shareH    = 0.60;             %share of H trade in total (IER article)


% Asymmetric parameters (calibrated externally)
par.Z                       = 1;       %steady state aggregate North productivity
par_star.Z                  = 1;

% Sector specific parameters sector is upper case, skill is lower case
% H sector North
parH.alpha          = 0.45;  
parH.tau            = 1.0;
parH.tauIM          = 0;
parH.tau_offshoring = 1;
parH.s_D            = 0;
parH.s_E            = 0;
parH.fE             = 0;
parH.fV             = 0.0000001;
parH.fX             = 0.0000001;
parH.gamma          = 0.6;              %expenditure share

% L sector North
parL.alpha          = 0.32;  
parL.tau            = parH.tau;
parL.tauIM          = 0;
parL.tau_offshoring = 1;
parL.s_D            = 0;
parL.s_E            = 0;
parL.fE             = 0;
parL.fV             = 0.000005;
parL.fX             = 0.000003;
parL.gamma          = 1-parH.gamma; 


% H sector South
parH_star           = parH;
parH_star.fV        = 0.0000001;
parH_star.fX        = 0.0000001;


% L sector South
parL_star           = parL;
parL_star.fV        = 0.000001;
parL_star.fX        = 0.000003;

if (par.k <= par.theta -1)
    keyboard
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% CALIBRATED STEADY STATE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%eqlbm_ss0.mom 

parL.tau            = 2.0;
parH.tau            = 2.5;
parL_star.tau       = 1.7;
parH_star.tau       = 1.5;

cal                 = zeros(14,1);
cal(1,1)            = parL.fV;
cal(2,1)            = parH.fV;
cal(3,1)            = parL_star.fV;
cal(4,1)            = parH_star.fV;
cal(5,1)            = parL.fX;
cal(6,1)            = parH.fX;
cal(7,1)            = parL_star.fX;
cal(8,1)            = parH_star.fX;
cal(9,1)            = parL.tau;
cal(10,1)           = parH.tau;
cal(11,1)           = parL_star.tau;
cal(12,1)           = parH_star.tau;
cal(13,1)           = 1.1;
%cal(14,1)           = 0.99;



cal = [0.000004961348943   0.000000101422950   0.000001001504279   0.000000102024647   0.000002987300621 ...
    0.000000098394330   0.000003062778543   0.000000099882682   2.040492939611868   2.446892827173535 ...
    1.680418030960522   1.488677781109606   1.102042917744938   0.000101232349030]';


cal_ind                     = 1; %without offshoring (2) or with offshoring (1)
options                     = optimset('MaxFunEvals', 1000);
% f                           = @(cal_params)calibration_09Sep2025(par, parL, parH, parL_star, parH_star, par_star, tar, cal_params, cal_ind);
% [params_out,tmp1,tmp2]      = fminsearch(f, cal);


 
%return


% FIND THE INITIAL VALUES FOR DYNARE
parL.fV             = cal(1,1);
parH.fV             = cal(2,1);
parL_star.fV        = cal(3,1);
parH_star.fV        = cal(4,1);

parL.fX             = cal(5,1);
parH.fX             = cal(6,1);
parL_star.fX        = cal(7,1);
parH_star.fX        = cal(8,1);

parL.tau            = cal(9,1);
parH.tau            = cal(10,1);
parL_star.tau       = cal(11,1);
parH_star.tau       = cal(12,1);

psiL                = cal(13,1);
psiL_star           = 1; %normalised


conjectures0 = [ 1 1 1 1 1];
options             = optimset('MaxFunEvals', 500000, 'MaxIter', 500000);
fun                 = @(x)ss_equilibrium_09Sep2025(par,par_star,parL,parH,parL_star,parH_star, x, 0,tar, psiL, psiL_star);   
[solve,~,flag]      = fsolve(fun, conjectures0, options);

solve_ind           = 1;
eqlbm_ss0           = ss_equilibrium_09Sep2025(par, par_star, parL, parH, parL_star, parH_star, solve, solve_ind, tar, psiL, psiL_star);

if (flag <= 0)
    return
end




% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN DYNARE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dynare
addpath('C:\dynare\6.2\matlab');
dynare DSW_2Sector_09Sep2025.mod

% Impact consumption deviation held constant:
size_tauIM      = abs(oo_.irfs.C_eps_tauIMH(1)/eqlbm_ss0.hh(13))*100
size_tau_offsh  = abs(oo_.irfs.C_eps_tau_offshoringH(1)/eqlbm_ss0.hh(13))*100
size_s_D        = abs(oo_.irfs.C_eps_s_DH(1)/eqlbm_ss0.hh(13))*100
size_s_E        = abs(oo_.irfs.C_eps_s_EH(1)/eqlbm_ss0.hh(13))*100


save w.mat

  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SHUT-DOWN OFFSHORING

cal2                = zeros(9,1);
% cal2(1:4,1)         = cal(5:8,1);
% cal2(5:8,1)         = cal(9:12,1);
% cal2(9,1)           = cal(13,1);

parL.fX             = 0.000002987300621;
parH.fX             = 0.000000098394330;
parL_star.fX        = 0.000003062778543;
parH_star.fX        = 0.000000099882682;

parL.tau            = 1.940492939611868;
parH.tau            = 1.846892827173535;
parL_star.tau       = 1.880418030960522;
parH_star.tau       = 1.788677781109606;

psiL                = 1.102042917744938;
psiL_star           = 1; %normalised

cal2(1,1)           = parL.fX;
cal2(2,1)           = parH.fX;
cal2(3,1)           = parL_star.fX;
cal2(4,1)           = parH_star.fX;

cal2(5,1)           = parL.tau;
cal2(6,1)           = parH.tau;
cal2(7,1)           = parL_star.tau;
cal2(8,1)           = parH_star.tau;

cal2(9,1)            = psiL;



cal2 = [ 0.000003064909641   0.000000101384220   0.000002981851933   0.000000099197855   1.734637586894665 ...
     1.936355532868675   1.991880114733672   1.829587706356032   1.056553724758286]';


cal_ind                     = 2; %without offshoring (2), with (1)
options                     = optimset('MaxFunEvals', 50000);
f                           = @(cal_params)calibration_09Sep2025(par, parL, parH, parL_star, parH_star, par_star, tar, cal_params, cal_ind);
[params_out,tmp1,tmp2]      = fminsearch(f, cal2);

if (flag <= 0)
    return
end


% FIND THE INITIAL VALUES FOR DYNARE
parL.fV             = 10;
parH.fV             = 10;
parL_star.fV        = 10;
parH_star.fV        = 10;

parL.fX             = cal2(1,1);
parH.fX             = cal2(2,1);
parL_star.fX        = cal2(3,1);
parH_star.fX        = cal2(4,1);

parL.tau            = cal2(5,1);
parH.tau            = cal2(6,1);
parL_star.tau       = cal2(7,1);
parH_star.tau       = cal2(8,1);

psiL                = cal2(9,1);
psiL_star           = 1; %normalised


conjectures0 = [ 1 1 1 1 1];
options             = optimset('MaxFunEvals', 500000, 'MaxIter', 500000);
fun                 = @(x)ss_equilibrium_09Sep2025(par,par_star,parL,parH,parL_star,parH_star, x, 0,tar, psiL, psiL_star);   
[solve,~,flag]      = fsolve(fun, conjectures0, options);

solve_ind           = 1;
eqlbm_ss0           = ss_equilibrium_09Sep2025(par, par_star, parL, parH, parL_star, parH_star, solve, solve_ind, tar, psiL, psiL_star);

if (flag <= 0)
    return
end

 
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN DYNARE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dynare
addpath('C:\dynare\6.2\matlab');
dynare DSW_2Sector_09Sep2025_v2.mod

% Impact consumption deviation held constant:
size_tauIM      = abs(oo_.irfs.C_eps_tauIMH(1)/eqlbm_ss0.hh(13))*100
size_tau_offsh  = abs(oo_.irfs.C_eps_tau_offshoringH(1)/eqlbm_ss0.hh(13))*100
size_s_D        = abs(oo_.irfs.C_eps_s_DH(1)/eqlbm_ss0.hh(13))*100
size_s_E        = abs(oo_.irfs.C_eps_s_EH(1)/eqlbm_ss0.hh(13))*100

save wo.mat




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES

% Consumption North
clear
clc
load w.mat
plot(oo_.irfs.C_eps_tauIMH(1:20)/eqlbm_ss0.hh(13)*100, 'b')
hold on
plot(oo_.irfs.C_eps_s_DH(1:20)/eqlbm_ss0.hh(13)*100, 'b--')
plot(oo_.irfs.C_eps_s_EH(1:20)/eqlbm_ss0.hh(13)*100, 'b:')

clear
clc
load wo.mat
plot(oo_.irfs.C_eps_tauIMH(1:20)/eqlbm_ss0.hh(13)*100, 'r')
plot(oo_.irfs.C_eps_s_DH(1:20)/eqlbm_ss0.hh(13)*100, 'r--')
plot(oo_.irfs.C_eps_s_EH(1:20)/eqlbm_ss0.hh(13)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('Consumption (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'Consumption.eps')





% Overall firm massL North
clear
clc
load w.mat
plot(oo_.irfs.massL_eps_tauIMH(1:20)/eqlbm_ss0.masses(1)*100, 'b')
hold on
plot(oo_.irfs.massL_eps_s_DH(1:20)/eqlbm_ss0.masses(1)*100, 'b--')
plot(oo_.irfs.massL_eps_s_EH(1:20)/eqlbm_ss0.masses(1)*100, 'b:')


clear
clc
load wo.mat
plot(oo_.irfs.massL_eps_tauIMH(1:20)/eqlbm_ss0.masses(1)*100, 'r')
plot(oo_.irfs.massL_eps_s_DH(1:20)/eqlbm_ss0.masses(1)*100, 'r--')
plot(oo_.irfs.massL_eps_s_EH(1:20)/eqlbm_ss0.masses(1)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('MassL (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'MassL.eps')




% Overall firm massH North
clear
clc
load w.mat
plot(oo_.irfs.massH_eps_tauIMH(1:20)/eqlbm_ss0.masses(2)*100, 'b')
hold on
plot(oo_.irfs.massH_eps_s_DH(1:20)/eqlbm_ss0.masses(2)*100, 'b--')
plot(oo_.irfs.massH_eps_s_EH(1:20)/eqlbm_ss0.masses(2)*100, 'b:')


clear
clc
load wo.mat
plot(oo_.irfs.massH_eps_tauIMH(1:20)/eqlbm_ss0.masses(2)*100, 'r')
plot(oo_.irfs.massH_eps_s_DH(1:20)/eqlbm_ss0.masses(2)*100, 'r--')
plot(oo_.irfs.massH_eps_s_EH(1:20)/eqlbm_ss0.masses(2)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('MassH (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'MassH.eps')






% Consumption Hh
clear
clc
load w.mat
plot(oo_.irfs.CHh_eps_tauIMH(1:20)/eqlbm_ss0.hh(1)*100, 'b')
hold on
plot(oo_.irfs.CHh_eps_s_DH(1:20)/eqlbm_ss0.hh(1)*100, 'b--')
plot(oo_.irfs.CHh_eps_s_EH(1:20)/eqlbm_ss0.hh(1)*100, 'b:')


clear
clc
load wo.mat
plot(oo_.irfs.CHh_eps_tauIMH(1:20)/eqlbm_ss0.hh(1)*100, 'r')
plot(oo_.irfs.CHh_eps_s_DH(1:20)/eqlbm_ss0.hh(1)*100, 'r--')
plot(oo_.irfs.CHh_eps_s_EH(1:20)/eqlbm_ss0.hh(1)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('Consumption Hh (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'CHh.eps')




% Consumption Hl
clear
clc
load w.mat
plot(oo_.irfs.CHl_eps_tauIMH(1:20)/eqlbm_ss0.hh(2)*100, 'b')
hold on
plot(oo_.irfs.CHl_eps_s_DH(1:20)/eqlbm_ss0.hh(2)*100, 'b--')
plot(oo_.irfs.CHl_eps_s_EH(1:20)/eqlbm_ss0.hh(2)*100, 'b:')


clear
clc
load wo.mat
plot(oo_.irfs.CHl_eps_tauIMH(1:20)/eqlbm_ss0.hh(2)*100, 'r')
plot(oo_.irfs.CHl_eps_s_DH(1:20)/eqlbm_ss0.hh(2)*100, 'r--')
plot(oo_.irfs.CHl_eps_s_EH(1:20)/eqlbm_ss0.hh(2)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('Consumption Hl (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'CHl.eps')





% Consumption Lh
clear
clc
load w.mat
plot(oo_.irfs.CLh_eps_tauIMH(1:20)/eqlbm_ss0.hh(3)*100, 'b')
hold on
plot(oo_.irfs.CLh_eps_s_DH(1:20)/eqlbm_ss0.hh(3)*100, 'b--')
plot(oo_.irfs.CLh_eps_s_EH(1:20)/eqlbm_ss0.hh(3)*100, 'b:')


clear
clc
load wo.mat
plot(oo_.irfs.CLh_eps_tauIMH(1:20)/eqlbm_ss0.hh(3)*100, 'r')
plot(oo_.irfs.CLh_eps_s_DH(1:20)/eqlbm_ss0.hh(3)*100, 'r--')
plot(oo_.irfs.CLh_eps_s_EH(1:20)/eqlbm_ss0.hh(3)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('Consumption Lh (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'CLh.eps')


% Consumption Ll
clear
clc
load w.mat
plot(oo_.irfs.CLl_eps_tauIMH(1:20)/eqlbm_ss0.hh(4)*100, 'b')
hold on
plot(oo_.irfs.CLl_eps_s_DH(1:20)/eqlbm_ss0.hh(4)*100, 'b--')
plot(oo_.irfs.CLl_eps_s_EH(1:20)/eqlbm_ss0.hh(4)*100, 'b:')


clear
clc
load wo.mat
plot(oo_.irfs.CLl_eps_tauIMH(1:20)/eqlbm_ss0.hh(4)*100, 'r')
plot(oo_.irfs.CLl_eps_s_DH(1:20)/eqlbm_ss0.hh(4)*100, 'r--')
plot(oo_.irfs.CLl_eps_s_EH(1:20)/eqlbm_ss0.hh(4)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo', 'Subs wo', 'SubsE wo')
title('Consumption Ll (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'CLl.eps')




% Mass offshorersL (without offshorers calibration makes no sense)
clear
clc
load w.mat
plot(oo_.irfs.mass_VL_eps_tauIMH(1:20)/eqlbm_ss0.masses(5)*100, 'b')
hold on
plot(oo_.irfs.mass_VL_eps_tauIMH(1:20)/eqlbm_ss0.masses(5)*100, 'b--')
plot(oo_.irfs.mass_VL_eps_tauIMH(1:20)/eqlbm_ss0.masses(5)*100, 'b:')

legend('Tariff w', 'Subs w', 'SubsE w')
title('MassVL (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'MassVL.eps')




% Mass offshorersH (without offshorers calibration makes no sense)
clear
clc
load w.mat
plot(oo_.irfs.mass_VH_eps_tauIMH(1:20)/eqlbm_ss0.masses(6)*100, 'b')
hold on
plot(oo_.irfs.mass_VH_eps_tauIMH(1:20)/eqlbm_ss0.masses(6)*100, 'b--')
plot(oo_.irfs.mass_VH_eps_tauIMH(1:20)/eqlbm_ss0.masses(6)*100, 'b:')

legend('Tariff w', 'Subs w', 'SubsE w')
title('MassVH (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'MassVH.eps')









return








