function output     = ave_prod_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, cutoffs)
% checked

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

% Read-in the cutoffs (zV, zX, zV*, zX*)
z_VL        = cutoffs(1);
z_VH        = cutoffs(2);
z_XL        = cutoffs(3);
z_XH        = cutoffs(4);
z_VL_star   = cutoffs(5);
z_VH_star   = cutoffs(6);
z_XL_star   = cutoffs(7);
z_XH_star   = cutoffs(8);

% Find the averages
nu              = (par.k/(par.k - (par.theta -1)))^(1/(par.theta-1));   %defined in the writeup

% North
ztil_DL         = nu*par.z_min*z_VL*((z_VL^(par.k-(par.theta-1)) - par.z_min^(par.k-(par.theta-1)))/ ...
    (z_VL^par.k - par.z_min^par.k))^(1/(par.theta-1));
if (isnan(ztil_DL) == 1)
    ztil_DL     = 0;
end
ztil_DH         = nu*par.z_min*z_VH*((z_VH^(par.k-(par.theta-1)) - par.z_min^(par.k-(par.theta-1)))/ ...
    (z_VH^par.k - par.z_min^par.k))^(1/(par.theta-1));
if (isnan(ztil_DH) == 1)
    ztil_DH     = 0;
end

ztil_VL         = nu*z_VL;
if (isnan(ztil_VL) == 1)
    ztil_VL     = 0;
end
ztil_VH         = nu*z_VH;
if (isnan(ztil_VH) == 1)
    ztil_VH     = 0;
end

ztil_XL         = nu*z_XL;   %is this right??? It's not written anywhere, but I'm inferring it.
if (isnan(ztil_XL) == 1)
    ztil_XL     = 0;
end
ztil_XH         = nu*z_XH;   %is this right??? It's not written anywhere, but I'm inferring it.
if (isnan(ztil_XH) == 1)
    ztil_XH     = 0;
end

% South
ztil_DL_star    = nu*par.z_min*z_VL_star*((z_VL_star^(par.k-(par.theta-1)) - par.z_min^(par.k-(par.theta-1)))/ ...
    (z_VL_star^par.k - par.z_min^par.k))^(1/(par.theta-1));
if (isnan(ztil_DL_star) == 1)
    ztil_DL_star    = 0;
end
ztil_DH_star    = nu*par.z_min*z_VH_star*((z_VH_star^(par.k-(par.theta-1)) - par.z_min^(par.k-(par.theta-1)))/ ...
    (z_VH_star^par.k - par.z_min^par.k))^(1/(par.theta-1));
if (isnan(ztil_DH_star) == 1)
    ztil_DH_star    = 0;
end

ztil_VL_star    = nu*z_VL_star;
if (isnan(ztil_VL_star) == 1)
    ztil_VL_star    = 0;
end
ztil_VH_star    = nu*z_VH_star;
if (isnan(ztil_VH_star) == 1)
    ztil_VH_star    = 0;
end

ztil_XL_star    = nu*z_XL_star;  %is this right??? It's not written anywhere, but I'm inferring it.
if (isnan(ztil_XL_star) == 1)
    ztil_XL_star    = 0;
end
ztil_XH_star    = nu*z_XH_star;  %is this right??? It's not written anywhere, but I'm inferring it.
if (isnan(ztil_XH_star) == 1)
    ztil_XH_star    = 0;
end

 
 


output(1)       = ztil_DL;
output(2)       = ztil_DH;
output(3)       = ztil_VL;
output(4)       = ztil_VH;
output(5)       = ztil_XL;
output(6)       = ztil_XH;
output(7)       = ztil_DL_star;
output(8)       = ztil_DH_star;
output(9)       = ztil_VL_star;
output(10)      = ztil_VH_star;
output(11)      = ztil_XL_star;
output(12)      = ztil_XH_star;


 


end