function output     = government_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prices, ave_prod, ave_profits, masses, labour_demand)
%checked

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

% Read-in the average profit levels
dtil_DL         = ave_profits(1);
dtil_DH         = ave_profits(2);
dtil_VL         = ave_profits(3);
dtil_VH         = ave_profits(4);
dtil_XL         = ave_profits(5);
dtil_XH         = ave_profits(6);
dtil_DL_star    = ave_profits(7);
dtil_DH_star    = ave_profits(8);
dtil_VL_star    = ave_profits(9);
dtil_VH_star    = ave_profits(10);
dtil_XL_star    = ave_profits(11);
dtil_XH_star    = ave_profits(12);

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


% Find the lump-sum transfer
% North
TL_agg          = parL.tauIM*mass_XL_star*ptil_XL_star*(((1+parL.tauIM)*ptil_XL_star/psiL)^(-par.theta))*(parL.gamma/psiL)*C ...
    - parL.s_E*mass_EL*(parL.fE/par.Z)*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha) - ...
    parL.s_D*mass_DL*((ptil_DL/psiL)^(-par.theta))*(parL.gamma/psiL)*C*(1/par.Z)*(1/ztil_DL)*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha);

TH_agg          = parH.tauIM*mass_XH_star*ptil_XH_star*((1+parH.tauIM)*ptil_XH_star/psiH)^(-par.theta)*(parH.gamma/psiH)*C ...
    - parH.s_E*mass_EH*(parH.fE/par.Z)*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha) - ...
    parH.s_D*mass_DH*((ptil_DH/psiH)^(-par.theta))*(parH.gamma/psiH)*C*(1/par.Z)*(1/ztil_DH)*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha);

T_agg           = (TH_agg + TL_agg)/(parL.h_supply + parH.h_supply + parL.l_supply + parH.l_supply);

% South
TL_agg_star     = parL_star.tauIM*mass_XL*ptil_XL*(((1+parL_star.tauIM)*ptil_XL/psiL_star)^(-par.theta))*(parL.gamma/psiL_star)*C_star ...
    - parL_star.s_E*mass_EL_star*(parL_star.fE/par_star.Z)*((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^(parL.alpha)) - ...
    parL_star.s_D*mass_DL_star*((ptil_DL_star/psiL_star)^(-par.theta))*(parL.gamma/psiL_star)*C_star*(1/par_star.Z)*(1/ztil_DL_star)*((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^parL.alpha);

TH_agg_star     = parH_star.tauIM*mass_XH*ptil_XH*(((1+parH_star.tauIM)*ptil_XH/psiH_star)^(-par.theta))*(parH.gamma/psiH_star)*C_star ...
    - parH_star.s_E*mass_EH_star*(parH_star.fE/par_star.Z)*((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^(parH.alpha)) - ...
    parH_star.s_D*mass_DH_star*((ptil_DH_star/psiH_star)^(-par.theta))*(parH.gamma/psiH_star)*C_star*(1/par_star.Z)*(1/ztil_DH_star)*((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^parH.alpha);

T_agg_star      = (TH_agg_star + TL_agg_star)/(parL_star.h_supply + parH_star.h_supply + parL_star.l_supply + parH_star.l_supply);



output(1)       = T_agg;
output(2)       = T_agg_star;

output(3)       = TL_agg;
output(4)       = TH_agg;
output(5)       = TL_agg_star;
output(6)       = TH_agg_star;


for i = 1:length(output)
    if (isnan(output(i)) == 1) || (isinf(output(i)) == 1)
        output(i) = 0;
    end
end


 



end