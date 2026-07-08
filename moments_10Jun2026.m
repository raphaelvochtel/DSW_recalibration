function mom             = moments_10Jun2026(masses, conjectures, parL, parH, parL_star, parH_star, par, agg, hh, ave_prod)


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


% Fractions of firm statuses
mom.fracVL                  = masses(23);
mom.fracVH                  = masses(24);
mom.fracXL                  = masses(25);
mom.fracXH                  = masses(26);
mom.fracVL_star             = masses(31);
mom.fracVH_star             = masses(32);
mom.fracXL_star             = masses(33);
mom.fracXH_star             = masses(34);

% Export intensities of firms
% Expressions for prices (absent the productivity since it should drop out)
wL_eff                      = (wLl/(1-parL.alpha))^(1-parL.alpha)*(wLh/parL.alpha)^(1-parL.alpha);
wH_eff                      = (wHl/(1-parH.alpha))^(1-parH.alpha)*(wHh/parH.alpha)^(1-parH.alpha);
wL_eff_star                 = (wLl_star/(1-parL.alpha))^(1-parL.alpha)*(wLh_star/parL.alpha)^(1-parL.alpha);
wH_eff_star                 = (wHl_star/(1-parH.alpha))^(1-parH.alpha)*(wHh_star/parH.alpha)^(1-parH.alpha);

priceL                      = (par.theta/(par.theta-1))*(1-parL.s_D)*wL_eff;
priceH                      = (par.theta/(par.theta-1))*(1-parH.s_D)*wH_eff;
priceL_star                 = (par.theta/(par.theta-1))*(1-parL_star.s_D)*wL_eff_star;
priceH_star                 = (par.theta/(par.theta-1))*(1-parH_star.s_D)*wH_eff_star;

% Below corrected as of Sep 05 2025
priceL_exp                  = Q^(-1)*parL.tau*(par.theta/(par.theta-1))*(1-parL.s_D)*wL_eff;
priceL_star_exp             = Q*parL_star.tau*(par.theta/(par.theta-1))*(1-parL_star.s_D)*wL_eff_star;

priceH_exp                  = Q^(-1)*parH.tau*(par.theta/(par.theta-1))*(1-parH.s_D)*wH_eff;
priceH_star_exp             = Q*parH_star.tau*(par.theta/(par.theta-1))*(1-parH_star.s_D)*wH_eff_star;

qL                          = (priceL/psiL)^(-par.theta)*parL.gamma/psiL*C;
qH                          = (priceH/psiH)^(-par.theta)*parH.gamma/psiH*C;
qL_star                     = (priceL_star/psiL_star)^(-par.theta)*parL_star.gamma/psiL_star*C_star;
qH_star                     = (priceH_star/psiH_star)^(-par.theta)*parH_star.gamma/psiH_star*C_star;

qL_exp                      = ((1+parL_star.tauIM)*priceL_exp/psiL_star)^(-par.theta)*parL_star.gamma/psiL_star*C_star;
qL_star_exp                 = ((1+parL.tauIM)*priceL_star_exp/psiL)^(-par.theta)*parL.gamma/psiL*C;
qH_exp                      = ((1+parH_star.tauIM)*priceH_exp/psiH_star)^(-par.theta)*parH_star.gamma/psiH_star*C_star;
qH_star_exp                 = ((1+parH.tauIM)*priceH_star_exp/psiH)^(-par.theta)*parH.gamma/psiH*C;

mom.exp_intL                = (Q*priceL_exp*qL_exp)/(priceL*qL + Q*priceL_exp*qL_exp);
mom.exp_intL_star           = (Q^(-1)*priceL_star_exp*qL_star_exp)/(priceL_star*qL_star + Q^(-1)*priceL_star_exp*qL_star_exp);
mom.exp_intH                = (Q*priceH_exp*qH_exp)/(priceH*qH + Q*priceH_exp*qH_exp);
mom.exp_intH_star           = (Q^(-1)*priceH_star_exp*qH_star_exp)/(priceH_star*qH_star + Q^(-1)*priceH_star_exp*qH_star_exp);



% Import shares
mom.imp_share               = agg(34)/(C);
mom.imp_share_star          = agg(35)/(C_star*Q);

% Sector-level trade flows (from agg 36-39)
LimN = agg(36);  % L imports into North
HimN = agg(37);  % H imports into North
LexN = agg(38);  % L exports from North (= L imports into South)
HexN = agg(39);  % H exports from North (= H imports into South)

mom.impL_share              = LimN / (agg(34));
mom.impH_share              = HimN / (agg(34));
mom.impL_share_star         = LexN / (agg(35));
mom.impH_share_star         = HexN / (agg(35));

% Comparative advantage moment: [L import share into North] - [H import share into North]
% Target: 0.305 (Josh's estimation)
mom.comp_adv                = (LimN/(LimN+LexN)) - (HimN/(HimN+HexN));
 
% Trade share
labour_force                = parH.l_supply + parH.h_supply + parL.l_supply + parL.h_supply;
profits_percapita           = hh(35);
gdp                         = wHl*parH.l_supply + wHh*parH.h_supply + wLl*parL.l_supply + wLh*parL.h_supply + ...
    profits_percapita*labour_force; 

mom.trade_share             = (agg(34) + agg(35))/gdp;

% Size premia
mom.x_prem                  = 0.25*(log(ave_prod(5)) - log(ave_prod(1)) + log(ave_prod(6)) - log(ave_prod(2)) + ...
    log(ave_prod(11)) - log(ave_prod(7)) + log(ave_prod(12)) - log(ave_prod(8)));


 




 
end