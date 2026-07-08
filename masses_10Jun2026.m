function output     = masses_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, conjectures, cutoffs, labour_demand, solve_ind, ave_prices)

% Have 4 types of firms in the world. Find the 4 masses by clearing the h
% (high skilled) market exactly.


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

% Read-in the high skilled labour demands
h_DL        = labour_demand(13);
h_DH        = labour_demand(14);
h_VL        = labour_demand(15);
h_VH        = labour_demand(16);
h_XL        = labour_demand(17);
h_XH        = labour_demand(18);
h_DL_star   = labour_demand(19);
h_DH_star   = labour_demand(20);
h_VL_star   = labour_demand(21);
h_VH_star   = labour_demand(22);
h_XL_star   = labour_demand(23);
h_XH_star   = labour_demand(24);
 

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

% Find the probability of each different status
% North
G_DL            = 1 - (par.z_min/z_VL)^par.k;         % prob(z < zV)
G_DH            = 1 - (par.z_min/z_VH)^par.k;         % prob(z < zV)
G_VL            = 1 - G_DL;                           % prob(z > zV)
G_VH            = 1 - G_DH;                           % prob(z > zV)
G_XL            = (par.z_min/z_XL)^par.k;             % prob(z > zX)
G_XH            = (par.z_min/z_XH)^par.k;             % prob(z > zX)
G_EL            = par.delta/(1-par.delta);            % using N = (1-delta)(N+NE)
G_EH            = par.delta/(1-par.delta);            % using N = (1-delta)(N+NE)

% South
G_DL_star       = 1 - (par.z_min/z_VL_star)^par.k;    % prob(z < zV)
G_DH_star       = 1 - (par.z_min/z_VH_star)^par.k;    % prob(z < zV)
G_VL_star       = 1 - G_DL_star;
G_VH_star       = 1 - G_DH_star;
G_XL_star       = (par.z_min/z_XL_star)^par.k;        % prob(z > zX)
G_XH_star       = (par.z_min/z_XH_star)^par.k;        % prob(z > zX)
G_EL_star       = G_EL;
G_EH_star       = G_EH;











% % Use the linearity of the stationary measure to solve two linear equations
% % in the mass of H firms and F firms for a given i \in {L,H} sector
% % I got the two linear equations as
% % Mi x gamma3i + Mi* x gamma4i = h_supply_i and
% % Mi x gamma2i + Mi* x gamma1i = h_supply_star_i where the gamma coefficients are
% OmegaL          = ((parL.alpha*wLl)/((1-parL.alpha)*wLh))^(1-parL.alpha);
% OmegaH          = ((parH.alpha*wHl)/((1-parH.alpha)*wHh))^(1-parH.alpha);
% 
% OmegaL_star     = ((parL.alpha*wLl_star)/((1-parL.alpha)*wLh_star))^(1-parL.alpha);
% OmegaH_star     = ((parH.alpha*wHl_star)/((1-parH.alpha)*wHh_star))^(1-parH.alpha);
% 
% gamma1L         = G_DL_star*h_DL_star + G_XL_star*h_XL_star + OmegaL_star*(G_EL_star*parL_star.fE/par_star.Z  + ...
%     G_XL_star*parL_star.fX/par_star.Z);
% gamma1H         = G_DH_star*h_DH_star + G_XH_star*h_XH_star + OmegaH_star*(G_EH_star*parH_star.fE/par_star.Z  + ...
%     G_XH_star*parH_star.fX/par_star.Z);
% 
% gamma2L         = OmegaL_star*G_VL*parL.fV/par_star.Z;
% gamma2H         = OmegaH_star*G_VH*parH.fV/par_star.Z;
% 
% gamma3L         = G_DL*h_DL + G_XL*h_XL + G_VL*h_VL + OmegaL*(G_EL*parL.fE/par.Z + G_XL*parL.fX/par.Z);
% gamma3H         = G_DH*h_DH + G_XH*h_XH + G_VH*h_VH + OmegaH*(G_EH*parH.fE/par.Z + G_XH*parH.fX/par.Z);
% 
% gamma4L         = parL_star.tau_offshoring*G_VL_star*h_VL_star + OmegaL*G_VL_star*parL_star.fV/par.Z;
% gamma4H         = parH_star.tau_offshoring*G_VH_star*h_VH_star + OmegaH*G_VH_star*parH_star.fV/par.Z;
% 
% % For the L markets
% if (gamma2L > 0) && (gamma4L > 0)   %FDI in both directions
% 
%     massL_star      = (parL.h_supply - parL_star.h_supply*gamma3L/gamma2L)/(gamma4L - gamma1L*gamma3L/gamma2L);% correct
%     massL           = (parL_star.h_supply - massL_star*gamma1L)/gamma2L; % correct
% 
% elseif (gamma2L == 0) && (gamma4L > 0)  %only FDI from south to north
% 
%     massL_star      = parL_star.h_supply/gamma1L;% correct
%     massL           = (parL.h_supply - massL_star*gamma4L)/gamma3L;% correct
% %     massL           = (parL.h_supply*gamma1L - massL_star*gamma4L)/(gamma3L*gamma1L);
% elseif (gamma2L > 0) && (gamma4L == 0) %only FDI from North to South
% 
%     massL           = parL.h_supply/gamma3L;% correct
%     massL_star      = (parL_star.h_supply - massL*gamma2L)/gamma1L;% correct
% 
% elseif (gamma2L == 0) && (gamma4L == 0) %No FDI at all
% 
%     massL           = parL.h_supply/gamma3L;% correct
%     massL_star      = parL_star.h_supply/gamma1L;% correct
% 
% end
% 
% % For the H markets
% if (gamma2H > 0) && (gamma4H > 0)   %FDI in both directions
% 
%     massH_star      = (parH.h_supply - parH_star.h_supply*gamma3H/gamma2H)/(gamma4H - gamma1H*gamma3H/gamma2H);
%     massH           = (parH_star.h_supply - massH_star*gamma1H)/gamma2H;
% 
% elseif (gamma2H == 0) && (gamma4H > 0)  %only FDI from south to north
% 
%     massH_star      = parH_star.h_supply/gamma1H;% correct
%     massH           = (parH.h_supply - massH_star*gamma4H)/gamma3H;% correct
% 
% elseif (gamma2H > 0) && (gamma4H == 0) %only FDI from North to South
% 
%     massH           = parH.h_supply/gamma3H;% correct
%     massH_star      = (parH_star.h_supply - massH*gamma2H)/gamma1H;% correct
% 
% elseif (gamma2H == 0) && (gamma4H == 0) %No FDI at all
% 
%     massH           = parH.h_supply/gamma3H;
%     massH_star      = parH_star.h_supply/gamma1H;
% 
% end
% 
% 
% if (gamma1H <0) || (gamma2H < 0) || (gamma3H < 0) || (gamma4H < 0)
%     output = -100000;
%     return
% end
% 
% if (gamma1L <0) || (gamma2L < 0) || (gamma3L < 0) || (gamma4L < 0)
%     output = -100000;
%     return
% end
% 
% 

Omega1L         = G_DL*(ptil_DL^(1-par.theta)) + G_VL*(ptil_VL^(1-par.theta));
if (G_DL == 0)
    Omega1L     = G_VL*(ptil_VL^(1-par.theta));
elseif (G_VL == 0)
    Omega1L     = G_DL*(ptil_DL^(1-par.theta));
end

Omega2L         = G_XL_star*(((1+parL.tauIM)*ptil_XL_star)^(1-par.theta));
if (G_XL_star == 0)
    Omega2L     = 0;
end

Omega1L_star    = G_DL_star*(ptil_DL_star^(1-par.theta)) + G_VL_star*(ptil_VL_star^(1-par.theta));
if (G_DL_star == 0)
    Omega1L_star    = G_VL_star*(ptil_VL_star^(1-par.theta));
elseif (G_VL_star == 0)
    Omega1L_star    = G_DL_star*(ptil_DL_star^(1-par.theta));
end

Omega2L_star    = G_XL*(((1+parL_star.tauIM)*ptil_XL)^(1-par.theta));
if (G_XL == 0)
    Omega2L_star    = 0;
end

massL           = (psiL_star^(1-par.theta) - Omega1L_star*psiL^(1-par.theta)/Omega2L)/(Omega2L_star - Omega1L_star*Omega1L/Omega2L);
massL_star      = (psiL^(1-par.theta) - Omega1L*massL)/Omega2L;
clear Omega1L Omega2L Omega1L_star Omega2L_star



Omega1H         = G_DH*(ptil_DH^(1-par.theta)) + G_VH*(ptil_VH^(1-par.theta));
if (G_DH == 0)
    Omega1H     = G_VH*(ptil_VH^(1-par.theta));
elseif (G_VH == 0)
    Omega1H     = G_DH*(ptil_DH^(1-par.theta));
end

Omega2H         = G_XH_star*(((1+parH.tauIM)*ptil_XH_star)^(1-par.theta));
if (G_XH_star == 0)
    Omega2H     = 0;
end

Omega1H_star    = G_DH_star*(ptil_DH_star^(1-par.theta)) + G_VH_star*(ptil_VH_star^(1-par.theta));
if (G_DH_star == 0)
    Omega1H_star    = G_VH_star*(ptil_VH_star^(1-par.theta));
elseif (G_VH_star == 0)
    Omega1H_star    = G_DH_star*(ptil_DH_star^(1-par.theta));
end

Omega2H_star    = G_XH*(((1+parH_star.tauIM)*ptil_XH)^(1-par.theta));
if (G_XH == 0)
    Omega2H_star = 0;
end

massH           = (psiH_star^(1-par.theta) - Omega1H_star*psiH^(1-par.theta)/Omega2H)/(Omega2H_star - Omega1H_star*Omega1H/Omega2H);
massH_star      = (psiH^(1-par.theta) - Omega1H*massH)/Omega2H;
clear Omega1H Omega2H Omega1H_star Omega2H_star




output(1)       = massL;              %N(t)
output(2)       = massH;              %N(t)
output(3)       = massL*G_DL;         %ND(t)
output(4)       = massH*G_DH;         %ND(t)
output(5)       = massL*G_VL;         %NV(t)
output(6)       = massH*G_VH;         %NV(t)
output(7)       = massL*G_XL;         %NX(t)
output(8)       = massH*G_XH;         %NX(t)
output(9)       = massL*G_EL;         %NE(t)
output(10)      = massH*G_EH;         %NE(t)
output(11)      = massL_star;                   %N(t)
output(12)      = massH_star;                   %N(t)
output(13)      = massL_star*G_DL_star;         %ND(t)
output(14)      = massH_star*G_DH_star;         %ND(t)
output(15)      = massL_star*G_VL_star;         %NV(t)
output(16)      = massH_star*G_VH_star;         %NV(t)
output(17)      = massL_star*G_XL_star;         %NX(t)
output(18)      = massH_star*G_XH_star;         %NX(t)
output(19)      = massL_star*G_EL_star;         %NE(t)
output(20)      = massH_star*G_EH_star;         %NE(t)
output(21)      = G_DL;
output(22)      = G_DH;
output(23)      = G_VL;
output(24)      = G_VH;
output(25)      = G_XL;
output(26)      = G_XH;
output(27)      = G_EL;
output(28)      = G_EH;
output(29)      = G_DL_star;
output(30)      = G_DH_star;
output(31)      = G_VL_star;
output(32)      = G_VH_star;
output(33)      = G_XL_star;
output(34)      = G_XH_star;
output(35)      = G_EL_star;
output(36)      = G_EH_star;
 
 

top         = 1.00 + 0.0001;
bottom      = 0-0.0001;

if (G_DL > top) || (G_DL < bottom) || (G_XL > top) || (G_XL < bottom) || (G_VL > top) || (G_VL < bottom) ...
    || (G_DL_star > top) || (G_DL_star < bottom) || (G_XL_star > top) || (G_XL_star < bottom) || (G_VL_star > top) || (G_VL_star < bottom) ...
    || (G_DH > top) || (G_DH < bottom) || (G_XH > top) || (G_XH < bottom) || (G_VH > top) || (G_VH < bottom) ...
    || (G_DH_star > top) || (G_DH_star < bottom) || (G_XH_star > top) || (G_XH_star < bottom) || (G_VH_star > top) || (G_VH_star < bottom)
    
    checks_masses(1)    = G_DL;
    checks_masses(2)    = G_DH;
    checks_masses(3)    = G_VL;
    checks_masses(4)    = G_VH;
    checks_masses(5)    = G_XL;
    checks_masses(6)    = G_XH;
    checks_masses(7)    = G_DL_star;
    checks_masses(8)    = G_DH_star;
    checks_masses(9)    = G_VL_star;
    checks_masses(19)   = G_VH_star;
    checks_masses(11)   = G_XL_star;
    checks_masses(12)   = G_XH_star;
    
    checks_masses;

    clear output
    output             = -100000;    

   
end

 


end