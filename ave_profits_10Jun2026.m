function output     = ave_profits_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prices, cutoffs, ave_prod)


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

% Read-in the cutoffs
z_VL            = cutoffs(1);
z_VH            = cutoffs(2);
z_XL            = cutoffs(3);
z_XH            = cutoffs(4);
z_VL_star       = cutoffs(5);
z_VH_star       = cutoffs(6);
z_XL_star       = cutoffs(7);
z_XH_star       = cutoffs(8);

% Read-in the average productivies
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


% North, checked
dtil_DL         = (1/par.theta)*(ptil_DL^(1-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
dtil_DH         = (1/par.theta)*(ptil_DH^(1-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;

dtil_VL         = (1/par.theta)*(ptil_VL^(1-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C ...
    - (parL.fV*Q/par_star.Z)*((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^parL.alpha);
dtil_VH         = (1/par.theta)*(ptil_VH^(1-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C ...
    - (parH.fV*Q/par_star.Z)*((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^parH.alpha);

dtil_XL         = (1/par.theta)*((1+parL_star.tauIM)^(-par.theta))*(ptil_XL^(1-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star*Q - ...
    (parL.fX/par.Z)*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha);
dtil_XH         = (1/par.theta)*((1+parH_star.tauIM)^(-par.theta))*(ptil_XH^(1-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star*Q - ...
    (parH.fX/par.Z)*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha);

% South, checked
dtil_DL_star    = (1/par.theta)*(ptil_DL_star^(1-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
dtil_DH_star    = (1/par.theta)*(ptil_DH_star^(1-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;

dtil_VL_star    = (1/par.theta)*(ptil_VL_star^(1-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star - ...
    (parL_star.fV*(Q^(-1))/par.Z)*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha);
dtil_VH_star    = (1/par.theta)*(ptil_VH_star^(1-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star - ...
    (parH_star.fV*(Q^(-1))/par.Z)*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha);

dtil_XL_star    = (1/par.theta)*((1+parL.tauIM)^(-par.theta))*(ptil_XL_star^(1-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C*(Q^(-1)) - ...
    (parL_star.fX/par_star.Z)*((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^parL.alpha);
dtil_XH_star    = (1/par.theta)*((1+parH.tauIM)^(-par.theta))*(ptil_XH_star^(1-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C*(Q^(-1)) - ...
    (parH_star.fX/par_star.Z)*((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^parH.alpha);


% Checks (for the links)
dtil_VL_check       = (par.k/(par.k - (par.theta-1)))*((z_VL/ztil_DL)^(par.theta-1))*dtil_DL ...
    + ((par.theta-1)/(par.k-(par.theta-1)))*(parL.fV*Q/par_star.Z)*((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^(parL.alpha));
dtil_VH_check       = (par.k/(par.k - (par.theta-1)))*((z_VH/ztil_DH)^(par.theta-1))*dtil_DH ...
    + ((par.theta-1)/(par.k-(par.theta-1)))*(parH.fV*Q/par_star.Z)*((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^(parH.alpha));

dtil_VL_star_check  = par.k/(par.k - (par.theta-1))*(z_VL_star/ztil_DL_star)^(par.theta-1)*dtil_DL_star ...
    + (par.theta-1)/(par.k-(par.theta-1))*parL_star.fV*Q^(-1)/par.Z*(wLl/(1-parL.alpha))^(1-parL.alpha)*(wLh/parL.alpha)^parL.alpha;
dtil_VH_star_check  = par.k/(par.k - (par.theta-1))*(z_VH_star/ztil_DH_star)^(par.theta-1)*dtil_DH_star ...
    + (par.theta-1)/(par.k-(par.theta-1))*parH_star.fV*Q^(-1)/par.Z*(wHl/(1-parH.alpha))^(1-parH.alpha)*(wHh/parH.alpha)^parH.alpha;

dtil_XL_check       = (par.theta-1)/(par.k - (par.theta-1))*parL.fX/par.Z*(wLl/(1-parL.alpha))^(1-parL.alpha)*(wLh/parL.alpha)^parL.alpha;
dtil_XH_check       = (par.theta-1)/(par.k - (par.theta-1))*parH.fX/par.Z*(wHl/(1-parH.alpha))^(1-parH.alpha)*(wHh/parH.alpha)^parH.alpha;

dtil_XL_star_check  = (par.theta-1)/(par.k - (par.theta-1))*parL_star.fX/par.Z*(wLl_star/(1-parL.alpha))^(1-parL.alpha)*(wLh_star/parL.alpha)^parL.alpha;
dtil_XH_star_check  = (par.theta-1)/(par.k - (par.theta-1))*parH_star.fX/par.Z*(wHl_star/(1-parH.alpha))^(1-parH.alpha)*(wHh_star/parH.alpha)^parH.alpha;





output(1)       = dtil_DL;
output(2)       = dtil_DH;
output(3)       = dtil_VL;
output(4)       = dtil_VH;
output(5)       = dtil_XL;
output(6)       = dtil_XH;
output(7)       = dtil_DL_star;
output(8)       = dtil_DH_star;
output(9)       = dtil_VL_star;
output(10)      = dtil_VH_star;
output(11)      = dtil_XL_star;
output(12)      = dtil_XH_star;




for i = 1:length(output)
    if (isnan(output(i)) == 1) || (isinf(output(i)) == 1)
        output(i)   = 0;
    end
end




end