function output     = household_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prices, ave_prod, ave_profits, masses, labour_demand, government, ent_value, agg, solve_ind)


% Read-in the conjectured objects (Q, C, C_star, wHl wHh wLl wLh wHl_star wHh_star wLl_star wLh_star psiL psiH psiL_star psiH_star)
Q           = conjectures(1);
C           = conjectures(2);
C_star      = conjectures(3);
wHl         = conjectures(4);
wHh         = conjectures(5);
wLl         = conjectures(6);
wLh         = conjectures(7);
wHl_star    = conjectures(8);
wHh_star    = conjectures(9);
wLl_star    = conjectures(10);
wLh_star    = conjectures(11);
psiL        = conjectures(12);
psiH        = conjectures(13);
psiL_star   = conjectures(14);
psiH_star   = conjectures(15);

% Read-in the average real prices
ptil_DL         = ave_prices(1);
ptil_DH         = ave_prices(2);
ptil_VL         = ave_prices(3);
ptil_VH         = ave_prices(4);
ptil_XL         = ave_prices(5);
ptil_XH         = ave_prices(6);
ptil_DL_star    = ave_prices(7);
ptil_DH_star    = ave_prices(8);
ptil_VL_star    = ave_prices(9);
ptil_VH_star    = ave_prices(10);
ptil_XL_star    = ave_prices(11);
ptil_XH_star    = ave_prices(12);

% Read-in the average productivity levels
ztil_DL         = ave_prod(1);
ztil_DH         = ave_prod(2);
ztil_VL         = ave_prod(3);
ztil_VH         = ave_prod(4);
ztil_XL         = ave_prod(5);
ztil_XH         = ave_prod(6);
ztil_DL_star    = ave_prod(7);
ztil_DH_star    = ave_prod(8);
ztil_VL_star    = ave_prod(9);
ztil_VH_star    = ave_prod(10);
ztil_XL_star    = ave_prod(11);
ztil_XH_star    = ave_prod(12);

% Read-in the firm masses
massL           = masses(1);
massH           = masses(2);
mass_DL         = masses(3);
mass_DH         = masses(4);
mass_VL         = masses(5);
mass_VH         = masses(6);
mass_XL         = masses(7);
mass_XH         = masses(8);
mass_EL         = masses(9);
mass_EH         = masses(10);
mass_L_star     = masses(11);
mass_H_star     = masses(12);
mass_DL_star    = masses(13);
mass_DH_star    = masses(14);
mass_VL_star    = masses(15);
mass_VH_star    = masses(16);
mass_XL_star    = masses(17);
mass_XH_star    = masses(18);
mass_EL_star    = masses(19);
mass_EH_star    = masses(20);

% Read-in the labour demand
ell_DL          = labour_demand(1);
ell_DH          = labour_demand(2);
ell_VL          = labour_demand(3);
ell_VH          = labour_demand(4);
ell_XL          = labour_demand(5);
ell_XH          = labour_demand(6);
ell_DL_star     = labour_demand(7);
ell_DH_star     = labour_demand(8);
ell_VL_star     = labour_demand(9); 
ell_VH_star     = labour_demand(10);
ell_XL_star     = labour_demand(11);
ell_XH_star     = labour_demand(12);
h_DL            = labour_demand(13);
h_DH            = labour_demand(14);
h_VL            = labour_demand(15);
h_VH            = labour_demand(16); 
h_XL            = labour_demand(17);
h_XH            = labour_demand(18);
h_DL_star       = labour_demand(19);
h_DH_star       = labour_demand(20);
h_VL_star       = labour_demand(21);
h_VH_star       = labour_demand(22);
h_XL_star       = labour_demand(23); 
h_XH_star       = labour_demand(24);

% Read-in government budget
T_agg           = government(1);
T_agg_star      = government(2);

% Read-in the entry value
vtilL           = ent_value(1);
vtilH           = ent_value(2);
vtilL_star      = ent_value(3);
vtilH_star      = ent_value(4);

% Read-in aggregate profits
agg_profitsL        = agg(1);
agg_profitsH        = agg(2);
agg_profitsL_star   = agg(3);
agg_profitsH_star   = agg(4);


% Profits divided-up amongst households
profits_percapita           = (agg_profitsL + agg_profitsH - mass_EL*vtilL - mass_EH*vtilH)/(parH.h_supply + parL.h_supply + parH.l_supply + parL.l_supply);
profits_percapita_star      = (agg_profitsL_star + agg_profitsH_star - mass_EL_star*vtilL_star - mass_EH_star*vtilH_star)/ ...
    (parH_star.h_supply + parL_star.h_supply + parH_star.l_supply + parL_star.l_supply);

% Bond holdings
BHh_implied                 = (par.beta*(1+par.r)*(1) - 1)/par.eta;
BHl_implied                 = (par.beta*(1+par.r)*(1) - 1)/par.eta;
BLh_implied                 = (par.beta*(1+par.r)*(1) - 1)/par.eta;
BLl_implied                 = (par.beta*(1+par.r)*(1) - 1)/par.eta;

BHh_star_implied            = (par.beta*(1+par.r)*(1) - 1)/par.eta;
BHl_star_implied            = (par.beta*(1+par.r)*(1) - 1)/par.eta;
BLh_star_implied            = (par.beta*(1+par.r)*(1) - 1)/par.eta;
BLl_star_implied            = (par.beta*(1+par.r)*(1) - 1)/par.eta;

% Consumption for each type of household
% North
% CHh_implied                 = (wHh*parH.h_supply + T_agg*parH.h_supply + profits_percapita*parH.h_supply - par.r*BHh_implied)/parH.h_supply;
% CHl_implied                 = (wHl*parH.l_supply + T_agg*parH.l_supply + profits_percapita*parH.l_supply - par.r*BHl_implied)/parH.l_supply;
% CLh_implied                 = (wLh*parL.h_supply + T_agg*parL.h_supply + profits_percapita*parL.h_supply - par.r*BLh_implied)/parL.h_supply;
% CLl_implied                 = (wLl*parL.l_supply + T_agg*parL.l_supply + profits_percapita*parL.l_supply - par.r*BLl_implied)/parL.l_supply;

CHh_implied                 = (wHh*parH.h_supply + T_agg*parH.h_supply + profits_percapita*parH.h_supply + par.r*BHh_implied)/parH.h_supply;
CHl_implied                 = (wHl*parH.l_supply + T_agg*parH.l_supply + profits_percapita*parH.l_supply + par.r*BHl_implied)/parH.l_supply;
CLh_implied                 = (wLh*parL.h_supply + T_agg*parL.h_supply + profits_percapita*parL.h_supply + par.r*BLh_implied)/parL.h_supply;
CLl_implied                 = (wLl*parL.l_supply + T_agg*parL.l_supply + profits_percapita*parL.l_supply + par.r*BLl_implied)/parL.l_supply;

C_implied                   = CHh_implied*parH.h_supply + CHl_implied*parH.l_supply + CLh_implied*parL.h_supply + CLl_implied*parL.l_supply;

% South
% CHh_star_implied            = (wHh_star*parH_star.h_supply + T_agg_star*parH_star.h_supply + profits_percapita_star*parH_star.h_supply - par.r*BHh_star_implied)/parH_star.h_supply;
% CHl_star_implied            = (wHl_star*parH_star.l_supply + T_agg_star*parH_star.l_supply + profits_percapita_star*parH_star.l_supply - par.r*BHl_star_implied)/parH_star.l_supply;
% CLh_star_implied            = (wLh_star*parL_star.h_supply + T_agg_star*parL_star.h_supply + profits_percapita_star*parL_star.h_supply - par.r*BLh_implied)/parL_star.h_supply;
% CLl_star_implied            = (wLl_star*parL_star.l_supply + T_agg_star*parL_star.l_supply + profits_percapita_star*parL_star.l_supply - par.r*BLl_implied)/parL_star.l_supply;

CHh_star_implied            = (wHh_star*parH_star.h_supply + T_agg_star*parH_star.h_supply + profits_percapita_star*parH_star.h_supply + par.r*BHh_star_implied)/parH_star.h_supply;
CHl_star_implied            = (wHl_star*parH_star.l_supply + T_agg_star*parH_star.l_supply + profits_percapita_star*parH_star.l_supply + par.r*BHl_star_implied)/parH_star.l_supply;
CLh_star_implied            = (wLh_star*parL_star.h_supply + T_agg_star*parL_star.h_supply + profits_percapita_star*parL_star.h_supply + par.r*BLh_implied)/parL_star.h_supply;
CLl_star_implied            = (wLl_star*parL_star.l_supply + T_agg_star*parL_star.l_supply + profits_percapita_star*parL_star.l_supply + par.r*BLl_implied)/parL_star.l_supply;


C_star_implied              = CHh_star_implied*parH_star.h_supply + CHl_star_implied*parH_star.l_supply ...
    + CLh_star_implied*parL_star.h_supply + CLl_star_implied*parL_star.l_supply;



% Value functions (in steady state)
VHh_implied                 = log(CHh_implied)/(1-par.beta*(1-par.s));
VHl_implied                 = log(CHl_implied)/(1-par.beta*(1-par.s));
VLh_implied                 = log(CLh_implied)/(1-par.beta*(1-par.s));
VLl_implied                 = log(CLl_implied)/(1-par.beta*(1-par.s));

VHh_star_implied            = log(CHh_star_implied)/(1-par.beta*(1-par.s));
VHl_star_implied            = log(CHl_star_implied)/(1-par.beta*(1-par.s));
VLh_star_implied            = log(CLh_star_implied)/(1-par.beta*(1-par.s));
VLl_star_implied            = log(CLl_star_implied)/(1-par.beta*(1-par.s));

% Preference shocks implied
epsh                        = VLh_implied - VHh_implied;
epsl                        = VLl_implied - VHl_implied;
epsh_star                   = VLh_star_implied - VHh_star_implied;
epsl_star                   = VLl_star_implied - VHl_star_implied;

% Entering workers
LhE_supply                  = par.s*parL.h_supply;
LlE_supply                  = par.s*parL.l_supply;
HhE_supply                  = par.s*parH.h_supply;
HlE_supply                  = par.s*parH.l_supply;

LhE_star_supply             = par.s*parL_star.h_supply;
LlE_star_supply             = par.s*parL_star.l_supply;
HhE_star_supply             = par.s*parH_star.h_supply;
HlE_star_supply             = par.s*parH_star.l_supply;

% % Assume the preference shocks differ across skills/countries.
% % Assume they are all distributed normal(0, sigma_s) for s in {l,h}
% % Back-out the sigma_s parameters that make the equilibrium conditions hold
% sigmah                      = epsh/sqrt(2)*1/erfinv(1 - 2*HhE_supply/(par.s*(parL.h_supply + parH.h_supply)));
% sigmal                      = epsl/sqrt(2)*1/erfinv(1 - 2*HlE_supply/(par.s*(parL.l_supply + parH.l_supply)));
% sigmah_star                 = epsh_star/sqrt(2)*1/erfinv(1 - 2*HhE_star_supply/(par.s*(parL_star.h_supply + parH_star.h_supply)));
% sigmal_star                 = epsl_star/sqrt(2)*1/erfinv(1 - 2*HlE_star_supply/(par.s*(parL_star.l_supply + parH_star.l_supply)));
%     


% Back-out the mean of the distribution to make these hold
% Guard: erfinv requires argument in (-1,1); during solver iterations
% labor supplies can go negative/complex, so return penalty if invalid
erfinv_arg1 = 2*(1-HhE_supply/(par.s*(parL.h_supply + parH.h_supply)))-1;
erfinv_arg2 = 2*(1-HlE_supply/(par.s*(parL.l_supply + parH.l_supply)))-1;
erfinv_arg3 = 2*(1-HhE_star_supply/(par_star.s*(parL_star.h_supply + parH_star.h_supply)))-1;
erfinv_arg4 = 2*(1-HlE_star_supply/(par_star.s*(parL_star.l_supply + parH_star.l_supply)))-1;

if ~isreal(erfinv_arg1) || ~isreal(erfinv_arg2) || ~isreal(erfinv_arg3) || ~isreal(erfinv_arg4) || ...
   abs(erfinv_arg1) >= 1 || abs(erfinv_arg2) >= 1 || abs(erfinv_arg3) >= 1 || abs(erfinv_arg4) >= 1
    output = 1000*ones(1,36);
    return
end

meanh           = epsh - sqrt(2)*par.sigmah*erfinv(erfinv_arg1);
meanl           = epsl - sqrt(2)*par.sigmal*erfinv(erfinv_arg2);
meanh_star      = epsh_star - sqrt(2)*par_star.sigmah*erfinv(erfinv_arg3);
meanl_star      = epsl_star - sqrt(2)*par_star.sigmal*erfinv(erfinv_arg4);



% Checks
check_mu(1)              = HhE_supply - par.s*(parL.h_supply + parH.h_supply)*(1 - (1/2 + 1/2*erf((epsh-meanh)/(sqrt(2)*par.sigmah))));
check_mu(2)              = HlE_supply - par.s*(parL.l_supply + parH.l_supply)*(1 - (1/2 + 1/2*erf((epsl-meanl)/(sqrt(2)*par.sigmal))));
check_mu(3)              = HhE_star_supply - par.s*(parL_star.h_supply + parH_star.h_supply)*(1 - (1/2 + 1/2*erf((epsh_star-meanh_star)/(sqrt(2)*par_star.sigmah))));
check_mu(4)              = HlE_star_supply - par.s*(parL_star.l_supply + parH_star.l_supply)*(1 - (1/2 + 1/2*erf((epsl_star-meanl_star)/(sqrt(2)*par_star.sigmal))));


 




output(1)           = CHh_implied;
output(2)           = CHl_implied;
output(3)           = CLh_implied;
output(4)           = CLl_implied;

output(5)           = CHh_star_implied;
output(6)           = CHl_star_implied;
output(7)           = CLh_star_implied;
output(8)           = CLl_star_implied;

output(9)           = epsh;
output(10)          = epsl;
output(11)          = epsh_star;
output(12)          = epsl_star;

output(13)          = C_implied;
output(14)          = C_star_implied;

output(15)          = meanh;
output(16)          = meanl;
output(17)          = meanh_star;
output(18)          = meanl_star;

output(19)          = VHh_implied;
output(20)          = VHl_implied;
output(21)          = VLh_implied;
output(22)          = VLl_implied;

output(23)          = VHh_star_implied;
output(24)          = VHl_star_implied;
output(25)          = VLh_star_implied;
output(26)          = VLl_star_implied;

output(27)          = HhE_supply;
output(28)          = HlE_supply;
output(29)          = LhE_supply;
output(30)          = LlE_supply;

output(31)          = HhE_star_supply;
output(32)          = HlE_star_supply;
output(33)          = LhE_star_supply;
output(34)          = LlE_star_supply;

output(35)          = profits_percapita;
output(36)          = profits_percapita_star;




end