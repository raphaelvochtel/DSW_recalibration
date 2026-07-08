function output     = ss_equilibrium_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, solve_ind, tar, psiL, psiL_star, wage)


% Read-in the conjectured objects (Q, C, C_star, wHl wHh wLl wLh wHl_star wHh_star wLl_star wLh_star psiL psiH psiL_star psiH_star)
if (solve_ind == 1) || (solve_ind == 0)     %calibrated steady state
    Q               = conjectures(1);
    C               = conjectures(2);
    C_star          = conjectures(3);
    psiH            = conjectures(4);
    psiH_star       = conjectures(5);

    conjectures_prim= conjectures;
   
    % North wages: numeraire + sector-specific skill premia (Josh's estimation)
    wHl             = 1;                            % numeraire
    wLl             = wHl;
    wHh             = wage.PH  * wHl;               % North H-sector skill premium
    wLh             = wage.PL  * wLl;               % North L-sector skill premium

    % South wages: offshoring arbitrage (eps perturbation ensures interior cutoffs)
    % Low-skill: set just below North break-even → North firms offshore low-skill to South
    % High-skill: set just above North break-even → South firms offshore high-skill to North
    eps             = 0.01;
    wLl_star        = par_star.Z/par.Z*(1-eps)/parL.tau_offshoring*1/((1/(1-parL.s_D))^(1/(1-parL.alpha)))*wLl/Q;
    wHl_star        = par_star.Z/par.Z*(1-eps)/parH.tau_offshoring*1/((1/(1-parH.s_D))^(1/(1-parH.alpha)))*wHl/Q;
    wLh_star        = par_star.Z/par.Z*(1+eps)/((parL_star.tau_offshoring^(-1))*((1-parL_star.s_D)^(1/parL.alpha)))*wLh/Q;
    wHh_star        = par_star.Z/par.Z*(1+eps)/((parH_star.tau_offshoring^(-1))*((1-parH_star.s_D)^(1/parH.alpha)))*wHh/Q;

    psiH            = parH.gamma*(parL.gamma/psiL)^(parL.gamma/parH.gamma);
    psiH_star       = parH.gamma*(parL.gamma/psiL_star)^(parL.gamma/parH.gamma);
 
    
 
    % Re-shuffle after reading these in
    conjectures(1)  = Q;
    conjectures(2)  = C;
    conjectures(3)  = C_star;
    conjectures(4)  = wHl;
    conjectures(5)  = wHh;
    conjectures(6)  = wLl;
    conjectures(7)  = wLh;
    conjectures(8)  = wHl_star;
    conjectures(9)  = wHh_star;
    conjectures(10) = wLl_star;
    conjectures(11) = wLh_star;
    conjectures(12) = psiL;
    conjectures(13) = psiH;
    conjectures(14) = psiL_star;
    conjectures(15) = psiH_star;

end

if (min(conjectures) < 0)
    bad_ind = 1;
end

% Checking the existence of cutoffs
bad_ind         = 0;

TOL_Ll          = (Q*wLl_star/par_star.Z)/(wLl/par.Z);
TOL_Hl          = (Q*wHl_star/par_star.Z)/(wHl/par.Z);
par_check_Ll    = 1-parL.tau_offshoring*((1/(1-parL.s_D))^(1/(1-parL.alpha)))*TOL_Ll;
par_check_Hl    = 1-parH.tau_offshoring*((1/(1-parH.s_D))^(1/(1-parH.alpha)))*TOL_Hl;

TOL_Lh_star         = Q*(wLh_star/par_star.Z)/(wLh/par.Z);
TOL_Hh_star         = Q*(wHh_star/par_star.Z)/(wHh/par.Z);
par_check_Lh_star   = (parL_star.tau_offshoring^(-1))*((1-parL_star.s_D)^(1/parL.alpha))*TOL_Lh_star - 1;
par_check_Hh_star   = (parH_star.tau_offshoring^(-1))*((1-parH_star.s_D)^(1/parH.alpha))*TOL_Hh_star - 1;
 
if (par_check_Ll < 0)
    display(['The Ll offshoring condition fails'])
    bad_ind     = 1;
end
if (par_check_Hl < 0)
    display(['The Hl offshoring condition fails'])
    bad_ind     = 1;
end
if (par_check_Lh_star < 0)
    display(['The Lh_star offshoring condition fails'])
    bad_ind     = 1;
end
if (par_check_Hh_star < 0)
    display(['The Hh_star offshoring condition fails'])
    bad_ind     = 1;
end

% Checking that the average productivities are defined
par_check_nu    = par.k - (par.theta-1);
if (par_check_nu < 0)
    display(['The averages are not defined'])
end

% Find the cutoff productivity levels
cutoffs         = cutoffs_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures);   

% Sep 05 2025: there should be no reason we can't have all firms exporting
% or being multinationals....right?
for i = 1:length(cutoffs)
    if (cutoffs(i) < par.z_min)
        cutoffs(i)    = par.z_min;
    end
end
% Check for productivities that are below the minimum
% if (min(cutoffs) < par.z_min-0.001)
%     bad_ind = 1;
%     output(1:3) = 10000;
%     display(['The cutoffs are too low'])
%     return
% end

% Find the average productivity levels
ave_prod        = ave_prod_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, cutoffs);

% Find the average real price levels
ave_p           = ave_price_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prod);

% Find the average profits
ave_profits     = ave_profits_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_p, cutoffs, ave_prod);

% Find labour demand schedules
labour_demand   = labour_demand_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_p, ave_prod);

% Find the value of entry
ent_value       = val_entry_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_p, ave_prod, cutoffs, ave_profits);

% Find the entry costs implied by the free entry condition
% checked
if (solve_ind == 1) || (solve_ind == 0) %calibrated steady state
    parL.fE         = ent_value(1)*(1/(1-parL.s_E))*par.Z*(((1-parL.alpha)/wLl)^(1-parL.alpha))*((parL.alpha/wLh)^parL.alpha);                        %free parameter
    parH.fE         = ent_value(2)*(1/(1-parH.s_E))*par.Z*(((1-parH.alpha)/wHl)^(1-parH.alpha))*((parH.alpha/wHh)^parH.alpha);                        %free parameter
    
    parL_star.fE    = ent_value(3)*(1/(1-parL_star.s_E))*par_star.Z*(((1-parL.alpha)/wLl_star)^(1-parL.alpha))*((parL.alpha/wLh_star)^parL.alpha);    %free parameter
    parH_star.fE    = ent_value(4)*(1/(1-parH_star.s_E))*par_star.Z*(((1-parH.alpha)/wHl_star)^(1-parH.alpha))*((parH.alpha/wHh_star)^parH.alpha);    %free parameter
    %parL_star.fE    = parL.fE;
    %parH_star.fE    = parL_star.fE;
end
% Checking:
% checked
diff_fe(1)      = ent_value(1) - parL.fE*((1/(1-parL.s_E))*par.Z*(((1-parL.alpha)/wLl)^(1-parL.alpha))*((parL.alpha/wLh)^parL.alpha))^(-1);
diff_fe(2)      = ent_value(2) - parH.fE*((1/(1-parH.s_E))*par.Z*(((1-parH.alpha)/wHl)^(1-parH.alpha))*((parH.alpha/wHh)^parH.alpha))^(-1);
diff_fe(3)      = ent_value(3) - parL_star.fE*((1/(1-parL_star.s_E))*par_star.Z*(((1-parL.alpha)/wLl_star)^(1-parL.alpha))*((parL.alpha/wLh_star)^parL.alpha))^(-1);
diff_fe(4)      = ent_value(4) - parH_star.fE*((1/(1-parH_star.s_E))*par_star.Z*(((1-parH.alpha)/wHl_star)^(1-parH.alpha))*((parH.alpha/wHh_star)^parH.alpha))^(-1);
 
% Find the firm masses
masses          = masses_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, cutoffs, labour_demand, solve_ind, ave_p);

% Check for negative or undefined masses
if (min(masses) < 0) || (max(double(isnan(masses)) == 1))
    bad_ind = 1;
    output(1:length(conjectures_prim)) = 10000;
    
   % display(['Masses issue'])
    return
    
end

% Aggregation
agg                 = agg_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_p, ave_prod, ave_profits, masses, labour_demand, cutoffs, solve_ind);
parL.l_supply       = agg(5);   %free parameter
parH.l_supply       = agg(6);   %free parameter
parL_star.l_supply  = agg(7);   %free parameter
parH_star.l_supply  = agg(8);   %free parameter

parL.h_supply       = agg(16);
parH.h_supply       = agg(17);   %free parameter
parL_star.h_supply  = agg(18);   %free parameter
parH_star.h_supply  = agg(19);   %free parameter


% Government
gov             = government_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_p, ave_prod, ave_profits, masses, labour_demand);

% Household
hh              = household_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_p, ave_prod, ave_profits, masses, labour_demand, gov, ent_value, agg, solve_ind);
if (hh(1) > 100)
    bad_ind     = 1;
else
    par.meanh       = hh(15);
    par.meanl       = hh(16);
    par_star.meanh  = hh(17);
    par_star.meanl  = hh(18);
end


% Differences
if (bad_ind ~= 1)
    diff_signed(1)          = agg(15);              % BOP
    diff_signed(2)          = C - hh(13);           % C
    diff_signed(3)          = C_star - hh(14);      % C_star
    diff_signed(4)          = psiL - agg(9);
    diff_signed(5)          = psiL_star - agg(11);
    diff_signed(6)          = 1 - agg(13);          % checking
    diff_signed(7)          = 1 - agg(14);          % checking
    diff_signed(8)          = psiH - agg(10);       % checking
    diff_signed(9)          = psiH_star - agg(12);  % checking
    %diff_signed(8)          = psiH - parH.gamma*(parL.gamma/psiL)^(parL.gamma/parH.gamma);       % checking
    %diff_signed(9)          = psiH_star - parH.gamma*(parL.gamma/psiL_star)^(parL.gamma/parH.gamma);  % checking
else
    diff_signed(1:9)        = 1000;
end

% diff_signed(10)         = agg(5) - parL.l_supply;
% diff_signed(11)         = agg(6) - parH.l_supply;
% diff_signed(12)         = agg(7) - parL_star.l_supply;
% diff_signed(13)         = agg(8) - parH_star.l_supply;


 
 




% So I was generally finding that whichever conditions were excluded from 
% the iteration conditions tend to be pretty noisy. In this case I think 
% it was the last two. They don't look terribly far off here, but I think 
% for some parameterizations it can get pretty big. Generally when there 
% was a lot of asymmetry between the sectors (although country asymmetry 
% wasn't so much a problem, which I think is consistent with the one sector
% model working fine and I've messed up somewhere in writing the L and H throughout)

diff                    = abs([diff_signed(1:3), diff_signed(6:7)]);

%diff                    = abs([diff_signed(1:3)]);

% Sep 21 2024: the more I think about it, the more I think that iterating
% on all 6 of the psi/price index conditions is wrong. It seems to give
% indeterminacy. Iterating on the C definition gives some noise, but it
% seems to be much more robust.
    

if (solve_ind == 0) %are you finding the calibrated steady state
% if (solve_ind == 1) || (solve_ind == 0) %calibrated steady state
    
    output              = diff;
    
    if bad_ind == 1
        output(1:length(conjectures_prim)) = 10000;
    end

    diff_signed;

end

  


if (solve_ind == 1)
    
    output.cutoffs          = cutoffs;
    output.ave_prod         = ave_prod;
    output.ave_p            = ave_p;
    output.ave_profits      = ave_profits;
    output.labour_demand    = labour_demand;
    output.ent_value        = ent_value;
    output.masses           = masses;
    output.agg              = agg;
    output.gov              = gov;
    output.hh               = hh;
    output.fEL              = parL.fE;
    output.fEH              = parH.fE;
    output.fEL_star         = parL_star.fE;
    output.fEH_star         = parH_star.fE;
    output.wHh_fixed        = wHh;
    output.wLh_fixed        = wLh;
    output.wHh_star_fixed   = wHh_star;
    output.wLh_star_fixed   = wLh_star;
    output.meanh            = par.meanh;
    output.meanl            = par.meanl;
    output.meanh_star       = par_star.meanh;
    output.meanl_star       = par_star.meanl;
    output.l_supplyL        = parL.l_supply;
    output.l_supplyH        = parH.l_supply;
    output.l_supplyL_star   = parL_star.l_supply;
    output.l_supplyH_star   = parH_star.l_supply;


    output.h_supplyL        = parL.h_supply;
    output.h_supplyH        = parH.h_supply;
    output.h_supplyL_star   = parL_star.h_supply;
    output.h_supplyH_star   = parH_star.h_supply;



    output.psiL_fixed       = psiL;
    output.psiH_fixed       = psiH;
    output.psiL_star_fixed  = psiL_star;
    output.psiH_star_fixed  = psiH_star;
    output.wHl_fixed        = wHl;
    output.wLl_fixed        = wLl;
    output.wHl_star_fixed   = wHl_star;
    output.wLl_star_fixed   = wLl_star;


    mom                     = moments_10Jun2026(masses, conjectures, parL, parH, parL_star, parH_star, par, agg, hh, ave_prod);
    output.mom              = mom;

     
    
end

 

 
end