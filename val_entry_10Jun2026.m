function output     = val_entry_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, ave_prices, ave_prod, cutoffs, ave_profits)
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

% Read-in the cutoffs
z_VL        = cutoffs(1);
z_VH        = cutoffs(2);
z_XL        = cutoffs(3);
z_XH        = cutoffs(4);
z_VL_star   = cutoffs(5);
z_VH_star   = cutoffs(6);
z_XL_star   = cutoffs(7);
z_XH_star   = cutoffs(8);

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



% Find the probability of each different status
% North
G_DL            = 1 - (par.z_min/z_VL)^par.k;     %prob(z < zV)
G_VL            = 1 - G_DL;                       %prob(z > zV)
G_XL            = (par.z_min/z_XL)^par.k;         %prob(z > zX)

G_DH            = 1 - (par.z_min/z_VH)^par.k;     %prob(z < zV)
G_VH            = 1 - G_DH;                       %prob(z > zV)
G_XH            = (par.z_min/z_XH)^par.k;         %prob(z > zX)

% South
G_DL_star       = 1 - (par.z_min/z_VL_star)^par.k;     %prob(z < zV)
G_VL_star       = 1 - G_DL_star;
G_XL_star       = (par.z_min/z_XL_star)^par.k;         %prob(z > zX)

G_DH_star       = 1 - (par.z_min/z_VH_star)^par.k;     %prob(z < zV)
G_VH_star       = 1 - G_DH_star;
G_XH_star       = (par.z_min/z_XH_star)^par.k;         %prob(z > zX)


% Find the average expected dividend    
% North
dL              = G_DL*dtil_DL + G_VL*dtil_VL + G_XL*dtil_XL;
dH              = G_DH*dtil_DH + G_VH*dtil_VH + G_XH*dtil_XH;

% South
dL_star         = G_DL_star*dtil_DL_star + G_VL_star*dtil_VL_star + G_XL_star*dtil_XL_star;
dH_star         = G_DH_star*dtil_DH_star + G_VH_star*dtil_VH_star + G_XH_star*dtil_XH_star;


% Find the value using the geometric sum formula
% North
vtilL           = dL*(par.beta*(1-par.delta)/(1-par.beta*(1-par.delta)));
vtilH           = dH*(par.beta*(1-par.delta)/(1-par.beta*(1-par.delta)));

% South
vtilL_star      = dL_star*(par.beta*(1-par.delta)/(1-par.beta*(1-par.delta)));
vtilH_star      = dH_star*(par.beta*(1-par.delta)/(1-par.beta*(1-par.delta)));




output(1)       = vtilL;
output(2)       = vtilH;
output(3)       = vtilL_star;
output(4)       = vtilH_star;
output(5)       = dL;
output(6)       = dH;
output(7)       = dL_star;
output(8)       = dH_star;








end