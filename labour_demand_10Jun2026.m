function output     = labour_demand_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prices, ave_prod)


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

% Find the low skilled labour demand--ell_X par.tauIM should be par_star.tauIM
% North, checked
ell_DL          = (1/(par.Z*ztil_DL))*((((1-parL.alpha)/parL.alpha)*(wLh/wLl))^parL.alpha)*(ptil_DL^(-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
ell_DH          = (1/(par.Z*ztil_DH))*((((1-parH.alpha)/parH.alpha)*(wHh/wHl))^parH.alpha)*(ptil_DH^(-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;

ell_VL          = (1/((par.Z^parL.alpha)*(par_star.Z^(1-parL.alpha))*ztil_VL))* ...
    ((((1-parL.alpha)/parL.alpha)*wLh/(parL.tau_offshoring*Q*wLl_star))^parL.alpha)*(ptil_VL^(-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
ell_VH          = (1/((par.Z^parH.alpha)*(par_star.Z^(1-parH.alpha))*ztil_VH))* ...
    ((((1-parH.alpha)/parH.alpha)*wHh/(parH.tau_offshoring*Q*wHl_star))^parH.alpha)*(ptil_VH^(-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;

ell_XL          = (1/(par.Z*ztil_XL))*((((1-parL.alpha)/parL.alpha)*wLh/wLl)^parL.alpha)*...
    (((1+parL_star.tauIM)*ptil_XL)^(-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
ell_XH          = (1/(par.Z*ztil_XH))*((((1-parH.alpha)/parH.alpha)*wHh/wHl)^parH.alpha)*...
    (((1+parH_star.tauIM)*ptil_XH)^(-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;

% South, checked
ell_DL_star     = (1/(par_star.Z*ztil_DL_star))*((((1-parL.alpha)/parL.alpha)*wLh_star/wLl_star)^parL.alpha)*...
    (ptil_DL_star^(-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
ell_DH_star     = (1/(par_star.Z*ztil_DH_star))*((((1-parH.alpha)/parH.alpha)*wHh_star/wHl_star)^parH.alpha)*...
    (ptil_DH_star^(-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;

ell_VL_star     = (1/((par.Z^parL.alpha)*(par_star.Z^(1-parL.alpha))*ztil_VL_star))*...
    ((((1-parL.alpha)/parL.alpha)*parL_star.tau_offshoring*(Q^(-1))*wLh/wLl_star)^parL.alpha)*...
    (ptil_VL_star^(-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
ell_VH_star     = (1/((par.Z^parH.alpha)*(par_star.Z^(1-parH.alpha))*ztil_VH_star))*...
    ((((1-parH.alpha)/parH.alpha)*parH_star.tau_offshoring*(Q^(-1))*wHh/wHl_star)^parH.alpha)*...
    (ptil_VH_star^(-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;

ell_XL_star     = (1/(par_star.Z*ztil_XL_star))*((((1-parL.alpha)/parL.alpha)*wLh_star/wLl_star)^parL.alpha)*...
    (((1+parL.tauIM)*ptil_XL_star)^(-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
ell_XH_star     = (1/(par_star.Z*ztil_XH_star))*((((1-parH.alpha)/parH.alpha)*wHh_star/wHl_star)^parH.alpha)*...
    (((1+parH.tauIM)*ptil_XH_star)^(-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;



% Find the high skilled labour demand- earlier version has a bracket error in the first term in h_D
% North, checked
h_DL            = (1/(par.Z*ztil_DL))*(((parL.alpha/(1-parL.alpha))*wLl/wLh)^(1-parL.alpha))*(ptil_DL^(-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
h_DH            = (1/(par.Z*ztil_DH))*(((parH.alpha/(1-parH.alpha))*wHl/wHh)^(1-parH.alpha))*(ptil_DH^(-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;

h_VL            = (1/((par.Z^parL.alpha)*(par_star.Z^(1-parL.alpha))*ztil_VL))* ...
    (((parL.alpha/(1-parL.alpha))*parL.tau_offshoring*Q*wLl_star/wLh)^(1-parL.alpha))* ...
    (ptil_VL^(-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
h_VH            = (1/((par.Z^parH.alpha)*(par_star.Z^(1-parH.alpha))*ztil_VH))* ...
    (((parH.alpha/(1-parH.alpha))*parH.tau_offshoring*Q*wHl_star/wHh)^(1-parH.alpha))* ...
    (ptil_VH^(-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;

h_XL            = (1/(par.Z*ztil_XL))*(((parL.alpha/(1-parL.alpha))*wLl/wLh)^(1-parL.alpha))* ...
    (((1+parL_star.tauIM)*ptil_XL)^(-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
h_XH            = (1/(par.Z*ztil_XH))*(((parH.alpha/(1-parH.alpha))*wHl/wHh)^(1-parH.alpha))* ...
    (((1+parH_star.tauIM)*ptil_XH)^(-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;


% South, checked
h_DL_star       = (1/(par_star.Z*ztil_DL_star))*(((parL.alpha/(1-parL.alpha))*wLl_star/wLh_star)^(1-parL.alpha))*...
    (ptil_DL_star^(-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
h_DH_star       = (1/(par_star.Z*ztil_DH_star))*(((parH.alpha/(1-parH.alpha))*wHl_star/wHh_star)^(1-parH.alpha))*...
    (ptil_DH_star^(-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;

h_VL_star       = (1/((par.Z^parL.alpha)*(par_star.Z^(1-parL.alpha))*ztil_VL_star))* ...
    (((parL.alpha/(1-parL.alpha))*wLl_star/(parL_star.tau_offshoring*(Q^(-1))*wLh))^(1-parL.alpha))* ...
    (ptil_VL_star^(-par.theta))*((1/psiL_star)^(1-par.theta))*parL.gamma*C_star;
h_VH_star       = (1/((par.Z^parH.alpha)*(par_star.Z^(1-parH.alpha))*ztil_VH_star))* ...
    (((parH.alpha/(1-parH.alpha))*wHl_star/(parH_star.tau_offshoring*(Q^(-1))*wHh))^(1-parH.alpha))* ...
    (ptil_VH_star^(-par.theta))*((1/psiH_star)^(1-par.theta))*parH.gamma*C_star;

h_XL_star       = (1/(par_star.Z*ztil_XL_star))*(((parL.alpha/(1-parL.alpha))*wLl_star/wLh_star)^(1-parL.alpha))* ...
    (((1+parL.tauIM)*ptil_XL_star)^(-par.theta))*((1/psiL)^(1-par.theta))*parL.gamma*C;
h_XH_star       = (1/(par_star.Z*ztil_XH_star))*(((parH.alpha/(1-parH.alpha))*wHl_star/wHh_star)^(1-parH.alpha))* ...
    (((1+parH.tauIM)*ptil_XH_star)^(-par.theta))*((1/psiH)^(1-par.theta))*parH.gamma*C;




output(1)       = ell_DL;
output(2)       = ell_DH;
output(3)       = ell_VL;
output(4)       = ell_VH;
output(5)       = ell_XL;
output(6)       = ell_XH;

output(7)       = ell_DL_star;
output(8)       = ell_DH_star;
output(9)       = ell_VL_star;
output(10)      = ell_VH_star;
output(11)      = ell_XL_star;
output(12)      = ell_XH_star;

output(13)      = h_DL;
output(14)      = h_DH;
output(15)      = h_VL;
output(16)      = h_VH;
output(17)      = h_XL;
output(18)      = h_XH;

output(19)      = h_DL_star;
output(20)      = h_DH_star;
output(21)      = h_VL_star;
output(22)      = h_VH_star;
output(23)      = h_XL_star;
output(24)      = h_XH_star;



for i = 1:length(output)
    if (isnan(output(i)) == 1) || (isinf(output(i)) == 1)
        output(i)   = 0;
    end
end



end