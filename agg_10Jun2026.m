function output     = agg_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prices, ave_prod, ave_profits, masses, labour_demand, cutoffs, solve_ind)
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

% Read-in the cutoffs
z_VL        = cutoffs(1);
z_VH        = cutoffs(2);
z_XL        = cutoffs(3);
z_XH        = cutoffs(4);
z_VL_star   = cutoffs(5);
z_VH_star   = cutoffs(6);
z_XL_star   = cutoffs(7);
z_XH_star   = cutoffs(8);

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



% Aggregation
% Profits
agg_profitsL        = mass_DL*dtil_DL + mass_XL*dtil_XL + mass_VL*dtil_VL;
agg_profitsH        = mass_DH*dtil_DH + mass_XH*dtil_XH + mass_VH*dtil_VH;

agg_profitsL_star   = mass_DL_star*dtil_DL_star + mass_XL_star*dtil_XL_star + mass_VL_star*dtil_VL_star;
agg_profitsH_star   = mass_DH_star*dtil_DH_star + mass_XH_star*dtil_XH_star + mass_VH_star*dtil_VH_star;


% Low skilled demand
Ll_demand           = mass_DL*ell_DL + mass_XL*ell_XL + ...
    (mass_EL*parL.fE/par.Z + mass_XL*parL.fX/par.Z + mass_VL_star*parL_star.fV/par.Z)*(((1-parL.alpha)*wLh/(parL.alpha*wLl))^parL.alpha);
Hl_demand           = mass_DH*ell_DH + mass_XH*ell_XH + ...
    (mass_EH*parH.fE/par.Z + mass_XH*parH.fX/par.Z + mass_VH_star*parH_star.fV/par.Z)*(((1-parH.alpha)*wHh/(parH.alpha*wHl))^parH.alpha);

Ll_demand_star      = mass_DL_star*ell_DL_star + mass_XL_star*ell_XL_star + mass_VL_star*ell_VL_star + parL.tau_offshoring*mass_VL*ell_VL + ...
    (mass_EL_star*parL_star.fE/par_star.Z + mass_XL_star*parL_star.fX/par_star.Z + mass_VL*parL.fV/par_star.Z)*(((1-parL.alpha)*wLh_star/(parL.alpha*wLl_star))^parL.alpha);
Hl_demand_star      = mass_DH_star*ell_DH_star + mass_XH_star*ell_XH_star + mass_VH_star*ell_VH_star + parH.tau_offshoring*mass_VH*ell_VH + ...
    (mass_EH_star*parH_star.fE/par_star.Z + mass_XH_star*parH_star.fX/par_star.Z + mass_VH*parH.fV/par_star.Z)*(((1-parH.alpha)*wHh_star/(parH.alpha*wHl_star))^parH.alpha);


% High skilled demand (checking)
Lh_demand           = mass_DL*h_DL + mass_XL*h_XL + mass_VL*h_VL + mass_VL_star*h_VL_star*parL_star.tau_offshoring + ...
    (mass_EL*parL.fE/par.Z + mass_XL*parL.fX/par.Z + mass_VL_star*parL_star.fV/par.Z)*((parL.alpha*wLl/((1-parL.alpha)*wLh))^(1-parL.alpha));
Hh_demand           = mass_DH*h_DH + mass_XH*h_XH + mass_VH*h_VH + mass_VH_star*h_VH_star*parH_star.tau_offshoring + ...
    (mass_EH*parH.fE/par.Z + mass_XH*parH.fX/par.Z + mass_VH_star*parH_star.fV/par.Z)*((parH.alpha*wHl/((1-parH.alpha)*wHh))^(1-parH.alpha));

Lh_demand_star      = mass_DL_star*h_DL_star + mass_XL_star*h_XL_star + ...
    (mass_EL_star*parL_star.fE/par_star.Z + mass_XL_star*parL_star.fX/par_star.Z + mass_VL*parL.fV/par_star.Z)*((parL.alpha*wLl_star/((1-parL.alpha)*wLh_star))^(1-parL.alpha));
Hh_demand_star      = mass_DH_star*h_DH_star + mass_XH_star*h_XH_star + ...
    (mass_EH_star*parH_star.fE/par_star.Z + mass_XH_star*parH_star.fX/par_star.Z + mass_VH*parH.fV/par_star.Z)*((parH.alpha*wHl_star/((1-parH.alpha)*wHh_star))^(1-parH.alpha));


% Relative price indices
mass_vec_temp       = [mass_DL; mass_VL; mass_XL_star];
ptil_vec_temp       = [ptil_DL; ptil_VL; (1+parL.tauIM)*ptil_XL_star];
psiL_temp           = 0;
for i = 1:length(mass_vec_temp)
    if (mass_vec_temp(i) > 0)
        psiL_temp   = psiL_temp + mass_vec_temp(i)*ptil_vec_temp(i)^(1-par.theta);
    end
end
psiL_implied        = psiL_temp^(1/(1-par.theta));
clear psiL_temp mass_vec_temp ptil_vec_temp
%psiL_implied        = (mass_DL*(ptil_DL^(1-par.theta)) + mass_VL*(ptil_VL^(1-par.theta)) + mass_XL_star*(((1+parL.tauIM)*ptil_XL_star)^(1-par.theta)))^(1/(1-par.theta));

mass_vec_temp       = [mass_DH; mass_VH; mass_XH_star];
ptil_vec_temp       = [ptil_DH; ptil_VH; (1+parH.tauIM)*ptil_XH_star];
psiH_temp           = 0;
for i = 1:length(mass_vec_temp)
    if (mass_vec_temp(i) > 0)
        psiH_temp   = psiH_temp + mass_vec_temp(i)*ptil_vec_temp(i)^(1-par.theta);
    end
end
psiH_implied        = psiH_temp^(1/(1-par.theta));
clear mass_vec_temp ptil_vec_temp psiH_temp
%psiH_implied        = (mass_DH*(ptil_DH^(1-par.theta)) + mass_VH*(ptil_VH^(1-par.theta)) + mass_XH_star*(((1+parH.tauIM)*ptil_XH_star)^(1-par.theta)))^(1/(1-par.theta));

mass_vec_temp       = [mass_DL_star; mass_VL_star; mass_XL];
ptil_vec_temp       = [ptil_DL_star; ptil_VL_star; (1+parL_star.tauIM)*ptil_XL];
psiL_star_temp      = 0;
for i = 1:length(mass_vec_temp)
    if (mass_vec_temp(i) > 0)
        psiL_star_temp  = psiL_star_temp + mass_vec_temp(i)*ptil_vec_temp(i)^(1-par.theta);
    end
end
psiL_star_implied   = psiL_star_temp^(1/(1-par.theta));
clear mass_vec_temp ptil_vec_temp psiL_star_temp
% psiL_star_implied   = (mass_DL_star*(ptil_DL_star^(1-par.theta)) + mass_VL_star*(ptil_VL_star^(1-par.theta)) + ...
%     mass_XL*(((1+parL_star.tauIM)*ptil_XL)^(1-par.theta)))^(1/(1-par.theta));

mass_vec_temp       = [mass_DH_star; mass_VH_star; mass_XH];
ptil_vec_temp       = [ptil_DH_star; ptil_VH_star; (1+parH_star.tauIM)*ptil_XH];
psiH_star_temp      = 0;
for i = 1:length(mass_vec_temp)
    if (mass_vec_temp(i) > 0)
        psiH_star_temp  = psiH_star_temp + mass_vec_temp(i)*ptil_vec_temp(i)^(1-par.theta);
    end
end
psiH_star_implied   = psiH_star_temp^(1/(1-par.theta));
% psiH_star_implied   = (mass_DH_star*(ptil_DH_star^(1-par.theta)) + mass_VH_star*(ptil_VH_star^(1-par.theta)) + ...
%     mass_XH*(((1+parH_star.tauIM)*ptil_XH)^(1-par.theta)))^(1/(1-par.theta));


% Aggregate price index
agg_P               = ((psiH_implied/parH.gamma)^parH.gamma)*((psiL_implied/parL.gamma)^parL.gamma);
agg_P_star          = ((psiH_star_implied/parH.gamma)^parH.gamma)*((psiL_star_implied/parL.gamma)^parL.gamma);
% agg_P               = (psiH/parH.gamma)^parH.gamma*(psiL/parL.gamma)^parL.gamma;
% agg_P_star          = (psiH_star/parH.gamma)^parH.gamma*(psiL_star/parL.gamma)^parL.gamma;



% Fixed costs part of balance of payments
BOP_FCL             = mass_VL*parL.fV*(Q/par_star.Z)*((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^parL.alpha) - ...
    mass_VL_star*parL_star.fV*(1/par.Z)*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha);
BOP_FCH             = mass_VH*parH.fV*(Q/par_star.Z)*((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^parH.alpha) - ...
    mass_VH_star*parH_star.fV*(1/par.Z)*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha);
BOP_FC              = BOP_FCL + BOP_FCH;


% Trade balance part of balance of payments
BOP_TBL             = mass_XL*ptil_XL*(((1+parL_star.tauIM)*ptil_XL/psiL_star)^(-par.theta))*(parL.gamma/psiL_star)*C_star*Q + ...
    parL_star.tau_offshoring*mass_VL_star*wLh*h_VL_star - ...
    parL.tau_offshoring*mass_VL*wLl_star*ell_VL*Q - mass_XL_star*ptil_XL_star*(((1+parL.tauIM)*ptil_XL_star/psiL)^(-par.theta))*(parL.gamma/psiL)*C;
BOP_TBH             = mass_XH*ptil_XH*(((1+parH_star.tauIM)*ptil_XH/psiH_star)^(-par.theta))*(parH.gamma/psiH_star)*C_star*Q + ...
    parH_star.tau_offshoring*mass_VH_star*wHh*h_VH_star - ...
    parH.tau_offshoring*mass_VH*wHl_star*ell_VH*Q - mass_XH_star*ptil_XH_star*(((1+parH.tauIM)*ptil_XH_star/psiH)^(-par.theta))*(parH.gamma/psiH)*C;
BOP_TB              = BOP_TBL + BOP_TBH;

BOP                 = BOP_FC - BOP_TB;


% Import volumes
% Imp                 = parL.tau_offshoring*mass_VL*wLl_star*ell_VL*Q + mass_XL_star*ptil_XL_star*(((1+parL.tauIM)*ptil_XL_star/psiL)^(-par.theta))*(parL.gamma/psiL)*C  ...
%         + parH.tau_offshoring*mass_VH*wHl_star*ell_VH*Q + mass_XH_star*ptil_XH_star*(((1+parH.tauIM)*ptil_XH_star/psiH)^(-par.theta))*(parH.gamma/psiH)*C;
% 
% Imp_star            = mass_XL*ptil_XL*(((1+parL_star.tauIM)*ptil_XL/psiL_star)^(-par.theta))*(parL.gamma/psiL_star)*C_star*Q + ...
%     parL_star.tau_offshoring*mass_VL_star*wLh*h_VL_star ...
%     + mass_XH*ptil_XH*(((1+parH_star.tauIM)*ptil_XH/psiH_star)^(-par.theta))*(parH.gamma/psiH_star)*C_star*Q + ...
%     parH_star.tau_offshoring*mass_VH_star*wHh*h_VH_star;

ImpL                = parL.tau_offshoring*mass_VL*wLl_star*ell_VL*Q + mass_XL_star*ptil_XL_star*(((1+parL.tauIM)*ptil_XL_star/psiL)^(-par.theta))*(parL.gamma/psiL)*C;
ImpH                = parH.tau_offshoring*mass_VH*wHl_star*ell_VH*Q + mass_XH_star*ptil_XH_star*(((1+parH.tauIM)*ptil_XH_star/psiH)^(-par.theta))*(parH.gamma/psiH)*C;

ImpL_star           = mass_XL*ptil_XL*(((1+parL_star.tauIM)*ptil_XL/psiL_star)^(-par.theta))*(parL.gamma/psiL_star)*C_star*Q + ...
    parL_star.tau_offshoring*mass_VL_star*wLh*h_VL_star;
ImpH_star           = mass_XH*ptil_XH*(((1+parH_star.tauIM)*ptil_XH/psiH_star)^(-par.theta))*(parH.gamma/psiH_star)*C_star*Q + ...
    parH_star.tau_offshoring*mass_VH_star*wHh*h_VH_star;

Imp                 = ImpL + ImpH;
Imp_star            = ImpL_star + ImpH_star;


trade_shareH        = (ImpH + ImpH_star)/(Imp + Imp_star);
 

% ImpL_share          = ( parL.tau_offshoring*mass_VL*wLl_star*ell_VL*Q + mass_XL_star*ptil_XL_star*(((1+parL.tauIM)*ptil_XL_star/psiL)^(-par.theta))*(parL.gamma/psiL)*C)/Imp;
% 
% ImpH_share          = 1-ImpL_share;
% 
% ImpL_share_star     = (mass_XL*ptil_XL*(((1+parL_star.tauIM)*ptil_XL/psiL_star)^(-par.theta))*(parL.gamma/psiL_star)*C_star*Q + ...
%     parL_star.tau_offshoring*mass_VL_star*wLh*h_VL_star)/ ...
%     Imp_star;
% 
% ImpH_share_star     = 1 - ImpL_share_star;


% Checks for average productivity
nu                  = (par.k/(par.k - (par.theta -1)))^(1/(par.theta-1));   %defined in the writeup
ztil_VL_check       = nu*par.z_min*(massL/mass_VL)^(1/par.k);
ztil_VH_check       = nu*par.z_min*(massH/mass_VH)^(1/par.k);
ztil_VL_star_check  = nu*par.z_min*(mass_L_star/mass_VL_star)^(1/par.k);
ztil_VH_star_check  = nu*par.z_min*(mass_H_star/mass_VH_star)^(1/par.k);
ztil_XL_check       = nu*par.z_min*(massL/mass_XL)^(1/par.k);
ztil_XH_check       = nu*par.z_min*(massH/mass_XH)^(1/par.k);
ztil_XL_star_check  = nu*par.z_min*(mass_L_star/mass_XL_star)^(1/par.k);
ztil_XH_star_check  = nu*par.z_min*(mass_H_star/mass_XH_star)^(1/par.k);


% Aggregate offshoring distortion
agg_offsh           = (parL.tau_offshoring-1)*mass_VL*wLl_star*ell_VL*Q + ...
    (parH.tau_offshoring-1)*mass_VH*wHl_star*ell_VH*Q;
agg_offsh_star      = (parL_star.tau_offshoring-1)*mass_VL_star*wLh*h_VL_star + ...
    (parH_star.tau_offshoring-1)*mass_VH_star*wHh*h_VH_star;

output(1)           = agg_profitsL;
output(2)           = agg_profitsH;
output(3)           = agg_profitsL_star;
output(4)           = agg_profitsH_star;
output(5)           = Ll_demand;
output(6)           = Hl_demand;
output(7)           = Ll_demand_star;
output(8)           = Hl_demand_star;
output(9)           = psiL_implied;
output(10)          = psiH_implied;
output(11)          = psiL_star_implied;
output(12)          = psiH_star_implied;
output(13)          = agg_P;
output(14)          = agg_P_star;
output(15)          = BOP;

output(16)          = Lh_demand;
output(17)          = Hh_demand;
output(18)          = Lh_demand_star;
output(19)          = Hh_demand_star;

output(20)          = BOP_FCL;
output(21)          = BOP_FCH;
output(22)          = BOP_TBL;
output(23)          = BOP_TBH;
output(24)          = BOP_FC;
output(25)          = BOP_TB;

output(26)          = parH.gamma*C + BOP_TBH;
output(27)          = parL.gamma*C + BOP_TBL;
output(28)          = parH_star.gamma*C_star - BOP_TBH;
output(29)          = parL_star.gamma*C_star - BOP_TBL;
% if (solve_ind == 1)
%     keyboard
% end

output(30)          = wHh * Hh_demand + wLh * Lh_demand + wHl * Hl_demand + wLl * Ll_demand;
output(31)          = wHh_star * Hh_demand_star + wLh_star * Lh_demand_star + wHl_star * Hl_demand_star + wLl_star * Ll_demand_star;

output(32)          =   (abs(wHh - wLh) * Hh_demand * Lh_demand + abs(wHh - wHl) * Hh_demand * Hl_demand + abs(wHh - wLl) * Hh_demand * Ll_demand ...
                       + abs(wLh - wHh) * Lh_demand * Hh_demand + abs(wLh - wHl) * Lh_demand * Hl_demand + abs(wLh - wLl) * Lh_demand * Ll_demand ...
                       + abs(wHl - wHh) * Hl_demand * Hh_demand + abs(wHl - wLh) * Hl_demand * Lh_demand + abs(wHl - wLl) * Hl_demand * Ll_demand ...
                       + abs(wLl - wHh) * Ll_demand * Hh_demand + abs(wLl - wLh) * Ll_demand * Lh_demand + abs(wLl - wHl) * Ll_demand * Hl_demand)/(2*((Hh_demand + Lh_demand + Hl_demand + Ll_demand)^2)*(wHh * Hh_demand + wLh * Lh_demand + wHl * Hl_demand + wLl * Ll_demand));
output(33)          =  (abs(wHh_star - wLh_star) * Hh_demand_star * Lh_demand_star + abs(wHh_star - wHl_star) * Hh_demand_star * Hl_demand_star + abs(wHh_star - wLl_star) * Hh_demand_star * Ll_demand_star ...
                      + abs(wLh_star - wHh_star) * Lh_demand_star * Hh_demand_star + abs(wLh_star - wHl_star) * Lh_demand_star * Hl_demand_star + abs(wLh_star - wLl_star) * Lh_demand_star * Ll_demand_star ...
                      + abs(wHl_star - wHh_star) * Hl_demand_star * Hh_demand_star + abs(wHl_star - wLh_star) * Hl_demand_star * Lh_demand_star + abs(wHl_star - wLl_star) * Hl_demand_star * Ll_demand_star ...
                      + abs(wLl_star - wHh_star) * Ll_demand_star * Hh_demand_star + abs(wLl_star - wLh_star) * Ll_demand_star * Lh_demand_star + abs(wLl_star - wHl_star) * Ll_demand_star * Hl_demand_star) / (2 * ((Hh_demand_star + Lh_demand_star + Hl_demand_star + Ll_demand_star)^2) * (wHh_star * Hh_demand_star + wLh_star * Lh_demand_star + wHl_star * Hl_demand_star + wLl_star * Ll_demand_star));

output(34)          = Imp;
output(35)          = Imp_star;
output(36)          = ImpL;       % L imports into North
output(37)          = ImpH;       % H imports into North
output(38)          = ImpL_star;  % L imports into South (= L exports from North)
output(39)          = ImpH_star;  % H imports into South (= H exports from North)
output(40)          = agg_offsh;
output(41)          = agg_offsh_star;
output(42)          = trade_shareH;


 

end
