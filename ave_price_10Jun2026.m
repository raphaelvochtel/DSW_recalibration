function output     = ave_price_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prod)


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



% North, checked
if (ztil_DL > 0)
    ptil_DL         = (par.theta/(par.theta-1))*((1-parL.s_D)/(par.Z*ztil_DL))*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha);
else
    ptil_DL         = 0;
end
if (ztil_DH > 0)
    ptil_DH         = (par.theta/(par.theta-1))*((1-parH.s_D)/(par.Z*ztil_DH))*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha);
else
    ptil_DH         = 0;
end

if (ztil_VL > 0)
    ptil_VL         = (par.theta/(par.theta-1))*(1/ztil_VL)*...
        (((parL.tau_offshoring*Q*wLl_star)/(par_star.Z*(1-parL.alpha)))^(1-parL.alpha))* ...
        ((wLh/(par.Z*parL.alpha))^parL.alpha);
else 
    ptil_VL         = 0;
end
if (ztil_VH > 0)
    ptil_VH         = (par.theta/(par.theta-1))*(1/ztil_VH)*...
        (((parH.tau_offshoring*Q*wHl_star)/(par_star.Z*(1-parH.alpha)))^(1-parH.alpha))* ...
        ((wHh/(par.Z*parH.alpha))^parH.alpha);
else
    ptil_VH         = 0;
end

if (ztil_XL > 0)
    ptil_XL         = (par.theta/(par.theta-1))*(parL.tau*(Q^(-1))/(par.Z*ztil_XL))*((wLl/(1-parL.alpha))^(1-parL.alpha))*((wLh/parL.alpha)^parL.alpha);
else 
    ptil_XL         = 0;
end
if (ztil_XH > 0) 
    ptil_XH         = (par.theta/(par.theta-1))*(parH.tau*(Q^(-1))/(par.Z*ztil_XH))*((wHl/(1-parH.alpha))^(1-parH.alpha))*((wHh/parH.alpha)^parH.alpha);
else
    ptil_XH         = 0;
end

% South, checked
if (ztil_DL_star > 0)
    ptil_DL_star    = (par.theta/(par.theta-1))*((1-parL_star.s_D)/(par_star.Z*ztil_DL_star))* ...
        ((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^parL.alpha);
else
    ptil_DL_star    = 0;
end
if (ztil_DH_star > 0)
    ptil_DH_star    = (par.theta/(par.theta-1))*((1-parH_star.s_D)/(par_star.Z*ztil_DH_star))* ...
        ((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^parH.alpha);
else
    ptil_DH_star    = 0;
end

if (ztil_VL_star > 0)
    ptil_VL_star    = (par.theta/(par.theta-1))*(1/ztil_VL_star)*((wLl_star/(par_star.Z*(1-parL.alpha)))^(1-parL.alpha))* ...
        (((parL_star.tau_offshoring*(Q^(-1))*wLh)/(par.Z*parL.alpha))^parL.alpha);
else
    ptil_VL_star    = 0;
end
if (ztil_VH_star > 0)
    ptil_VH_star    = (par.theta/(par.theta-1))*(1/ztil_VH_star)*((wHl_star/(par_star.Z*(1-parH.alpha)))^(1-parH.alpha))* ...
        (((parH_star.tau_offshoring*(Q^(-1))*wHh)/(par.Z*parH.alpha))^parH.alpha);
else
    ptil_VH_star    = 0;
end

if (ztil_XL_star > 0)
    ptil_XL_star    = (par.theta/(par.theta-1))*(parL_star.tau*Q/(par_star.Z*ztil_XL_star))* ...
        ((wLl_star/(1-parL.alpha))^(1-parL.alpha))*((wLh_star/parL.alpha)^parL.alpha);
else
    ptil_XL_star    = 0;
end
if (ztil_XH_star > 0)
    ptil_XH_star    = (par.theta/(par.theta-1))*(parH_star.tau*Q/(par_star.Z*ztil_XH_star))* ...
        ((wHl_star/(1-parH.alpha))^(1-parH.alpha))*((wHh_star/parH.alpha)^parH.alpha);
else
    ptil_XH_star    = 0;
end











output(1)       = ptil_DL;
output(2)       = ptil_DH;
output(3)       = ptil_VL;
output(4)       = ptil_VH;
output(5)       = ptil_XL;
output(6)       = ptil_XH;
output(7)       = ptil_DL_star;
output(8)       = ptil_DH_star;
output(9)       = ptil_VL_star;
output(10)      = ptil_VH_star;
output(11)      = ptil_XL_star;
output(12)      = ptil_XH_star;




 




end