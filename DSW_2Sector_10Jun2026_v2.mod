// September 21 2 sector model


///////////////////////////////////////////////////////////////////////////
// VARIABLES
///////////////////////////////////////////////////////////////////////////
// Variable declarations
var Q, C, C_star,
wHl, wHh, wLl, wLh, wHl_star, wHh_star, wLl_star, wLh_star, 
psiL, psiH, psiL_star, psiH_star, 
z_VL, z_VH, z_XL, z_XH, z_VL_star, z_VH_star, z_XL_star, z_XH_star,
ztil_DL, ztil_DH, ztil_VL, ztil_VH, ztil_XL, ztil_XH,
ztil_DL_star, ztil_DH_star, ztil_VL_star, ztil_VH_star, ztil_XL_star, ztil_XH_star,
ptil_DL, ptil_DH, ptil_VL, ptil_VH, ptil_XL, ptil_XH, 
ptil_DL_star, ptil_DH_star, ptil_VL_star, ptil_VH_star, ptil_XL_star, ptil_XH_star,
dtil_DL, dtil_DH, dtil_VL, dtil_VH, dtil_XL, dtil_XH,
dtil_DL_star, dtil_DH_star, dtil_VL_star, dtil_VH_star, dtil_XL_star, dtil_XH_star,
ell_DL, ell_DH, ell_VL, ell_VH, ell_XL, ell_XH,
ell_DL_star, ell_DH_star, ell_VL_star, ell_VH_star, ell_XL_star, ell_XH_star,
h_DL, h_DH, h_VL, h_VH, h_XL, h_XH,
h_DL_star, h_DH_star, h_VL_star, h_VH_star, h_XL_star, h_XH_star,
G_DL, G_DH, G_VL, G_VH, G_XL, G_XH, 
G_DL_star, G_DH_star, G_VL_star, G_VH_star, G_XL_star, G_XH_star,
massL, massH, massL_star, massH_star, mass_DL, mass_DH, mass_VL, mass_VH, mass_EL, mass_EH, 
mass_DL_star, mass_DH_star, mass_VL_star, mass_VH_star, mass_EL_star, mass_EH_star,
mass_XL, mass_XH, mass_XL_star, mass_XH_star,
agg_profitsL, agg_profitsH, agg_profitsL_star, agg_profitsH_star,
Ll_demand, Hl_demand, Ll_demand_star, Hl_demand_star, 
Lh_demand, Hh_demand, Lh_demand_star, Hh_demand_star,
agg_P, agg_P_star, BOP, Z, Z_star, SDF, SDF_star,
dL, dH, dL_star, dH_star, vtilL, vtilH, vtilL_star, vtilH_star,
h_supplyH, h_supplyL, l_supplyH, l_supplyL,
h_supplyH_star, h_supplyL_star, l_supplyH_star, l_supplyL_star,
HhE_supply, HlE_supply, LhE_supply, LlE_supply,
HhE_supply_star, HlE_supply_star, LhE_supply_star, LlE_supply_star,
BOP_FCL, BOP_FCH, BOP_FC, BOP_TB, TH_agg, TL_agg,
TH_agg_star, TL_agg_star, BOP_TBL, BOP_TBH,
BHh, BHl, BLh, BLl, BHh_star, BHl_star, BLh_star, BLl_star,
CHh, CHl, CLh, CLl, CHh_star, CHl_star, CLh_star, CLl_star,
SDFHh, SDFHl, SDFLh, SDFLl, SDFHh_star, SDFHl_star, SDFLh_star, SDFLl_star,
T_agg, T_agg_star, r, r_star, THh, THl, TLh, TLl, THh_star, THl_star,
TLh_star, TLl_star, profits_percapita, profits_percapita_star,
VHh, VHl, VLh, VLl, VHh_star, VHl_star, VLh_star, VLl_star,
epsh, epsl, epsh_star, epsl_star,
tauIMH, tau_offshoringH, s_DH, s_EH,
tauIML, tau_offshoringL, s_DL, s_EL,
tauIMH_star, tau_offshoringH_star, s_DH_star, s_EH_star,
tauIML_star, tau_offshoringL_star, s_DL_star, s_EL_star,
VAH, VAL, VAH_star, VAL_star,
YH, YL, YH_star, YL_star,
wtil, wtil_star, gini, gini_star, agg_offsh, agg_offsh_star;


varexo eps_Z, eps_Z_star, eps_tauIMH, eps_tauIML_star,
eps_tau_offshoringH, eps_tau_offshoringL_star,
eps_s_EH, eps_s_EL_star, eps_s_DH, eps_s_DL_star;

// eps_tauIML, eps_tauIMH_star, eps_tau_offshoringL, eps_tau_offshoringH_star, eps_s_EL, eps_s_EH_star, eps_s_DL, eps_s_DH_star


///////////////////////////////////////////////////////////////////////////
// PARAMETERS
///////////////////////////////////////////////////////////////////////////
// Parameter declarations
parameters beta, eta, s, delta, theta, k, z_min, gamma, pers, pers_pol, 
sigma_Z, sigma_pol, sigmah, sigmal, nu, sigma_Z_star, 
alphaH, tauH, 
//tauIMH, tau_offshoringH, s_DH, s_EH, 
fEH, fVH, fXH, gammaH,
alphaL, tauL, 
//tauIML, tau_offshoringL, s_DL, s_EL, 
fEL, fVL, fXL, gammaL,
alphaH_star, tauH_star, 
//tauIMH_star, tau_offshoringH_star, s_DH_star, s_EH_star, 
fEH_star, fVH_star, fXH_star, gammaH_star,
alphaL_star, tauL_star, 
//tauIML_star, tau_offshoringL_star, s_DL_star, s_EL_star, 
fEL_star, fVL_star, fXL_star, gammaL_star,
meanh, meanl, meanh_star, meanl_star, sigmah_star, sigmal_star,
Zss, Zss_star,
Qss, Css, Css_star, psiLss, psiLss_star, psiHss, psiHss_star, wHhss, wHlss, wLhss, wLlss,
wHhss_star, wHlss_star, wLhss_star, wLlss_star, z_VLss, z_VHss, z_XLss, z_XHss,
ztil_DLss, ztil_DHss, ztil_VLss, ztil_VHss, ztil_XLss, ztil_XHss, ztil_DLss_star, ztil_DHss_star,
ztil_VLss_star, ztil_VHss_star, ztil_XLss_star, ztil_XHss_star,
ptil_DLss, ptil_DHss, ptil_VLss, ptil_VHss, ptil_XLss, ptil_XHss, ptil_DLss_star, ptil_DHss_star, ptil_VLss_star,
ptil_VHss_star, ptil_XLss_star, ptil_XHss_star, dtil_DLss, dtil_DHss, dtil_VLss, dtil_VHss, dtil_XLss, dtil_XHss,
dtil_DLss_star, dtil_DHss_star, dtil_VLss_star, dtil_VHss_star, dtil_XLss_star, dtil_XHss_star,
ell_DLss, ell_DHss, ell_VLss, ell_VHss, ell_XLss, ell_XHss, ell_DLss_star, ell_DHss_star,
ell_VLss_star, ell_VHss_star, ell_XLss_star, ell_XHss_star,
h_DLss, h_DHss, h_VLss, h_VHss, h_XLss, h_XHss, h_DLss_star, h_DHss_star, h_VLss_star, h_VHss_star,
h_XLss_star, h_XHss_star, G_DLss, G_DHss, G_VLss, G_VHss, G_XLss, G_XHss, G_ELss, G_EHss,
G_DLss_star, G_DHss_star, G_VLss_star, G_VHss_star, G_XLss_star, G_XHss_star, G_ELss_star, G_EHss_star,
vtilLss, vtilHss, vtilLss_star, vtilHss_star, dLss, dHss, dLss_star, dHss_star,
massLss, massHss, mass_DLss, mass_DHss, mass_VLss, mass_VHss, mass_XLss, mass_XHss,
mass_ELss, mass_EHss, massLss_star, massHss_star, mass_DLss_star, mass_DHss_star, mass_VLss_star, mass_VHss_star,
mass_XLss_star, mass_XHss_star, mass_ELss_star, mass_EHss_star,
agg_profitsLss, agg_profitsHss, agg_profitsLss_star, agg_profitsHss_star,
Ll_demandss, Hl_demandss, Ll_demandss_star, Hl_demandss_star, agg_Pss, agg_Pss_star, BOPss,
Lh_demandss, Hh_demandss, Lh_demandss_star, Hh_demandss_star, T_aggss, T_aggss_star, TL_aggss,
TH_aggss, TL_aggss_star, TH_aggss_star, tauIMLss, tauIMHss, tauIMLss_star, tauIMHss_star,
tauss_offshoringL, tauss_offshoringH, tauss_offshoringL_star, tauss_offshoringH_star,
s_ELss, s_EHss, s_ELss_star, s_EHss_star, s_DLss, s_DHss, s_DLss_star, s_DHss_star,
CHhss, CHlss, CLhss, CLlss, CHhss_star, CHlss_star, CLhss_star, CLlss_star,
epshss, epslss, epshss_star, epslss_star, VHhss, VHlss, VLhss, VLlss,
VHhss_star, VHlss_star, VLhss_star, VLlss_star, HhE_supplyss_star,
HlE_supplyss_star, LhE_supplyss_star, LlE_supplyss_star,
HhE_supplyss, HlE_supplyss, LhE_supplyss, LlE_supplyss,
z_VLss_star, z_VHss_star, z_XLss_star, z_XHss_star, rss, rss_star,
l_supplyLss, l_supplyHss, l_supplyLss_star, l_supplyHss_star,
h_supplyLss, h_supplyHss, h_supplyLss_star, h_supplyHss_star,
profits_percapitass, profits_percapitass_star,
BOP_FCLss BOP_FCHss, BOP_TBLss, BOP_TBHss, BOP_FCss, BOP_TBss,
VAHss, VALss, VAHss_star, VALss_star,
YHss, YLss, YHss_star, YLss_star,
wtilss, wtilss_star, giniss, giniss_star, agg_offshss, agg_offsh_starss;

// Set parameters
set_param_value('beta',                 par.beta); 
set_param_value('rss',                  par.r); 
set_param_value('rss_star',             par.r); 
set_param_value('gamma',                par.gamma); 
set_param_value('gammaL',               parL.gamma); 
set_param_value('gammaH',               parH.gamma); 
set_param_value('gammaL_star',          parL_star.gamma); 
set_param_value('gammaH_star',          parH_star.gamma); 
set_param_value('delta',                par.delta);
set_param_value('theta',                par.theta);
set_param_value('k',                    par.k);
set_param_value('z_min',                par.z_min);
set_param_value('alphaL',               parL.alpha);
set_param_value('alphaH',               parH.alpha);
set_param_value('alphaL_star',          parL_star.alpha);
set_param_value('alphaH_star',          parH_star.alpha);
set_param_value('s',                    par.s);

set_param_value('eta',                  par.eta);
set_param_value('Zss',                  par.Z);
set_param_value('Zss_star',             par_star.Z);

set_param_value('l_supplyLss',          eqlbm_ss0.l_supplyL);
set_param_value('l_supplyHss',          eqlbm_ss0.l_supplyH);
set_param_value('l_supplyLss_star',     eqlbm_ss0.l_supplyL_star);
set_param_value('l_supplyHss_star',     eqlbm_ss0.l_supplyH_star);
set_param_value('h_supplyLss',          eqlbm_ss0.h_supplyL);
set_param_value('h_supplyHss',          eqlbm_ss0.h_supplyH);
set_param_value('h_supplyLss_star',     eqlbm_ss0.h_supplyL_star);
set_param_value('h_supplyHss_star',     eqlbm_ss0.h_supplyH_star);


set_param_value('sigmal',               par.sigmal);
set_param_value('sigmah',               par.sigmah);
set_param_value('sigmal_star',               par_star.sigmal);
set_param_value('sigmah_star',               par_star.sigmah);
set_param_value('meanh',                eqlbm_ss0.meanh);
set_param_value('meanl',                eqlbm_ss0.meanl);
set_param_value('meanh_star',           eqlbm_ss0.meanh_star);
set_param_value('meanl_star',           eqlbm_ss0.meanl_star);


set_param_value('fVL',                   parL.fV);
set_param_value('fVH',                   parH.fV);
set_param_value('fVL_star',              parL_star.fV);
set_param_value('fVH_star',              parH_star.fV);
set_param_value('fXL',                   parL.fX);
set_param_value('fXH',                   parH.fX);
set_param_value('fXL_star',              parL_star.fX);
set_param_value('fXH_star',              parH_star.fX);
set_param_value('fEL',                   eqlbm_ss0.fEL);
set_param_value('fEH',                   eqlbm_ss0.fEH);
set_param_value('fEL_star',              eqlbm_ss0.fEL_star);
set_param_value('fEH_star',              eqlbm_ss0.fEH_star);

//set_param_value('tauIML',                parL.tauIM);
//set_param_value('tauIMH',                parH.tauIM);
//set_param_value('tauIML_star',           parL_star.tauIM);
//set_param_value('tauIMH_star',           parH_star.tauIM);
set_param_value('tauL',                  parL.tau);
set_param_value('tauH',                  parH.tau);
set_param_value('tauL_star',             parL_star.tau);
set_param_value('tauH_star',             parH_star.tau);
//set_param_value('tau_offshoringL',       parL.tau_offshoring);
//set_param_value('tau_offshoringH',       parH.tau_offshoring);
//set_param_value('tau_offshoringL_star',  parL_star.tau_offshoring);
//set_param_value('tau_offshoringH_star',  parH_star.tau_offshoring);
//set_param_value('s_EL',                  parL.s_E);
//set_param_value('s_EH',                  parH.s_E);
//set_param_value('s_EL_star',             parL_star.s_E);
//set_param_value('s_EH_star',             parH_star.s_E);
//set_param_value('s_DL',                  parL.s_D);
//set_param_value('s_DH',                  parH.s_D);
//set_param_value('s_DL_star',             parL_star.s_D);
//set_param_value('s_DH_star',             parH_star.s_D);

set_param_value('pers',                 par.pers);
set_param_value('sigma_Z',              par.sigma_Z);
set_param_value('sigma_Z_star',         par_star.sigma_Z);
set_param_value('nu',                   (k/(k - (theta -1)))^(1/(theta-1))); 
set_param_value('pers_pol',             par.pers_pol);
set_param_value('sigma_pol',            par.sigma_pol);


// Steady state variables for the initial values below
set_param_value('Qss',                  solve(1));
set_param_value('Css',                  solve(2));
set_param_value('Css_star',             solve(3));
set_param_value('psiLss',               eqlbm_ss0.psiL_fixed); 
set_param_value('psiLss_star',          eqlbm_ss0.psiL_star_fixed); 
set_param_value('psiHss',               eqlbm_ss0.psiH_fixed); 
set_param_value('psiHss_star',          eqlbm_ss0.psiH_star_fixed); 
set_param_value('wHhss',                eqlbm_ss0.wHh_fixed);
set_param_value('wHlss',                eqlbm_ss0.wHl_fixed); 
set_param_value('wLhss',                eqlbm_ss0.wLh_fixed); 
set_param_value('wLlss',                eqlbm_ss0.wLl_fixed); 
set_param_value('wHhss_star',           eqlbm_ss0.wHh_star_fixed);
set_param_value('wHlss_star',           eqlbm_ss0.wHl_star_fixed); 
set_param_value('wLhss_star',           eqlbm_ss0.wLh_star_fixed); 
set_param_value('wLlss_star',           eqlbm_ss0.wLl_star_fixed); 
set_param_value('z_VLss',               eqlbm_ss0.cutoffs(1)); 
set_param_value('z_VHss',               eqlbm_ss0.cutoffs(2));                         
set_param_value('z_XLss',               eqlbm_ss0.cutoffs(3)); 
set_param_value('z_XHss',               eqlbm_ss0.cutoffs(4)); 
set_param_value('z_VLss_star',          eqlbm_ss0.cutoffs(5));
set_param_value('z_VHss_star',          eqlbm_ss0.cutoffs(6));
set_param_value('z_XLss_star',          eqlbm_ss0.cutoffs(7));
set_param_value('z_XHss_star',          eqlbm_ss0.cutoffs(8));
set_param_value('ztil_DLss',            eqlbm_ss0.ave_prod(1));   
set_param_value('ztil_DHss',            eqlbm_ss0.ave_prod(2));
set_param_value('ztil_VLss',            eqlbm_ss0.ave_prod(3));
set_param_value('ztil_VHss',            eqlbm_ss0.ave_prod(4));
set_param_value('ztil_XLss',            eqlbm_ss0.ave_prod(5));
set_param_value('ztil_XHss',            eqlbm_ss0.ave_prod(6));
set_param_value('ztil_DLss_star',       eqlbm_ss0.ave_prod(7));
set_param_value('ztil_DHss_star',       eqlbm_ss0.ave_prod(8));
set_param_value('ztil_VLss_star',       eqlbm_ss0.ave_prod(9));
set_param_value('ztil_VHss_star',       eqlbm_ss0.ave_prod(10));
set_param_value('ztil_XLss_star',       eqlbm_ss0.ave_prod(11));
set_param_value('ztil_XHss_star',       eqlbm_ss0.ave_prod(12));
set_param_value('ptil_DLss',            eqlbm_ss0.ave_p(1));
set_param_value('ptil_DHss',            eqlbm_ss0.ave_p(2));
set_param_value('ptil_VLss',            eqlbm_ss0.ave_p(3));
set_param_value('ptil_VHss',            eqlbm_ss0.ave_p(4));
set_param_value('ptil_XLss',            eqlbm_ss0.ave_p(5));
set_param_value('ptil_XHss',            eqlbm_ss0.ave_p(6));
set_param_value('ptil_DLss_star',       eqlbm_ss0.ave_p(7));
set_param_value('ptil_DHss_star',       eqlbm_ss0.ave_p(8));
set_param_value('ptil_VLss_star',       eqlbm_ss0.ave_p(9));
set_param_value('ptil_VHss_star',       eqlbm_ss0.ave_p(10));
set_param_value('ptil_XLss_star',       eqlbm_ss0.ave_p(11));
set_param_value('ptil_XHss_star',       eqlbm_ss0.ave_p(12));
set_param_value('dtil_DLss',            eqlbm_ss0.ave_profits(1));
set_param_value('dtil_DHss',            eqlbm_ss0.ave_profits(2));
set_param_value('dtil_VLss',            eqlbm_ss0.ave_profits(3));
set_param_value('dtil_VHss',            eqlbm_ss0.ave_profits(4));
set_param_value('dtil_XLss',            eqlbm_ss0.ave_profits(5));
set_param_value('dtil_XHss',            eqlbm_ss0.ave_profits(6));
set_param_value('dtil_DLss_star',       eqlbm_ss0.ave_profits(7));
set_param_value('dtil_DHss_star',       eqlbm_ss0.ave_profits(8));
set_param_value('dtil_VLss_star',       eqlbm_ss0.ave_profits(9));
set_param_value('dtil_VHss_star',       eqlbm_ss0.ave_profits(10));
set_param_value('dtil_XLss_star',       eqlbm_ss0.ave_profits(11));
set_param_value('dtil_XHss_star',       eqlbm_ss0.ave_profits(12));
set_param_value('ell_DLss',             eqlbm_ss0.labour_demand(1));
set_param_value('ell_DHss',             eqlbm_ss0.labour_demand(2));
set_param_value('ell_VLss',             eqlbm_ss0.labour_demand(3));
set_param_value('ell_VHss',             eqlbm_ss0.labour_demand(4));
set_param_value('ell_XLss',             eqlbm_ss0.labour_demand(5));
set_param_value('ell_XHss',             eqlbm_ss0.labour_demand(6));
set_param_value('ell_DLss_star',        eqlbm_ss0.labour_demand(7));
set_param_value('ell_DHss_star',        eqlbm_ss0.labour_demand(8));
set_param_value('ell_VLss_star',        eqlbm_ss0.labour_demand(9));
set_param_value('ell_VHss_star',        eqlbm_ss0.labour_demand(10));
set_param_value('ell_XLss_star',        eqlbm_ss0.labour_demand(11));
set_param_value('ell_XHss_star',        eqlbm_ss0.labour_demand(12));
set_param_value('h_DLss',               eqlbm_ss0.labour_demand(13));
set_param_value('h_DHss',               eqlbm_ss0.labour_demand(14));
set_param_value('h_VLss',               eqlbm_ss0.labour_demand(15));
set_param_value('h_VHss',               eqlbm_ss0.labour_demand(16));
set_param_value('h_XLss',               eqlbm_ss0.labour_demand(17));
set_param_value('h_XHss',               eqlbm_ss0.labour_demand(18));
set_param_value('h_DLss_star',          eqlbm_ss0.labour_demand(19));
set_param_value('h_DHss_star',          eqlbm_ss0.labour_demand(20));
set_param_value('h_VLss_star',          eqlbm_ss0.labour_demand(21));
set_param_value('h_VHss_star',          eqlbm_ss0.labour_demand(22));
set_param_value('h_XLss_star',          eqlbm_ss0.labour_demand(23));
set_param_value('h_XHss_star',          eqlbm_ss0.labour_demand(24));
set_param_value('G_DLss',               eqlbm_ss0.masses(21));
set_param_value('G_DHss',               eqlbm_ss0.masses(22));
set_param_value('G_VLss',               eqlbm_ss0.masses(23));
set_param_value('G_VHss',               eqlbm_ss0.masses(24));
set_param_value('G_XLss',               eqlbm_ss0.masses(25));
set_param_value('G_XHss',               eqlbm_ss0.masses(26));
set_param_value('G_ELss',               eqlbm_ss0.masses(27));
set_param_value('G_EHss',               eqlbm_ss0.masses(28));
set_param_value('G_DLss_star',          eqlbm_ss0.masses(29));
set_param_value('G_DHss_star',          eqlbm_ss0.masses(30));
set_param_value('G_VLss_star',          eqlbm_ss0.masses(31));
set_param_value('G_VHss_star',          eqlbm_ss0.masses(32));
set_param_value('G_XLss_star',          eqlbm_ss0.masses(33));
set_param_value('G_XHss_star',          eqlbm_ss0.masses(34));
set_param_value('G_ELss_star',          eqlbm_ss0.masses(35));
set_param_value('G_EHss_star',          eqlbm_ss0.masses(36));
set_param_value('vtilLss',              eqlbm_ss0.ent_value(1));
set_param_value('vtilHss',              eqlbm_ss0.ent_value(2));
set_param_value('vtilLss_star',         eqlbm_ss0.ent_value(3));
set_param_value('vtilHss_star',         eqlbm_ss0.ent_value(4));
set_param_value('dLss',                 eqlbm_ss0.ent_value(5));
set_param_value('dHss',                 eqlbm_ss0.ent_value(6));
set_param_value('dLss_star',            eqlbm_ss0.ent_value(7));
set_param_value('dHss_star',            eqlbm_ss0.ent_value(8));
set_param_value('massLss',              eqlbm_ss0.masses(1));
set_param_value('massHss',              eqlbm_ss0.masses(2));
set_param_value('mass_DLss',            eqlbm_ss0.masses(3));
set_param_value('mass_DHss',            eqlbm_ss0.masses(4));
set_param_value('mass_VLss',            eqlbm_ss0.masses(5));
set_param_value('mass_VHss',            eqlbm_ss0.masses(6));
set_param_value('mass_XLss',            eqlbm_ss0.masses(7));
set_param_value('mass_XHss',            eqlbm_ss0.masses(8));
set_param_value('mass_ELss',            eqlbm_ss0.masses(9));
set_param_value('mass_EHss',            eqlbm_ss0.masses(10));
set_param_value('massLss_star',         eqlbm_ss0.masses(11));
set_param_value('massHss_star',         eqlbm_ss0.masses(12));
set_param_value('mass_DLss_star',       eqlbm_ss0.masses(13));
set_param_value('mass_DHss_star',       eqlbm_ss0.masses(14));
set_param_value('mass_VLss_star',       eqlbm_ss0.masses(15));
set_param_value('mass_VHss_star',       eqlbm_ss0.masses(16));
set_param_value('mass_XLss_star',       eqlbm_ss0.masses(17));
set_param_value('mass_XHss_star',       eqlbm_ss0.masses(18));
set_param_value('mass_ELss_star',       eqlbm_ss0.masses(19));
set_param_value('mass_EHss_star',       eqlbm_ss0.masses(20));
set_param_value('agg_profitsLss',       eqlbm_ss0.agg(1));
set_param_value('agg_profitsHss',       eqlbm_ss0.agg(2));
set_param_value('agg_profitsLss_star',  eqlbm_ss0.agg(3));
set_param_value('agg_profitsHss_star',  eqlbm_ss0.agg(4));
set_param_value('Ll_demandss',          eqlbm_ss0.agg(5));
set_param_value('Hl_demandss',          eqlbm_ss0.agg(6));
set_param_value('Ll_demandss_star',     eqlbm_ss0.agg(7));
set_param_value('Hl_demandss_star',     eqlbm_ss0.agg(8));
set_param_value('agg_Pss',              eqlbm_ss0.agg(13));
set_param_value('agg_Pss_star',         eqlbm_ss0.agg(14));
set_param_value('BOPss',                eqlbm_ss0.agg(15));
set_param_value('Lh_demandss',          eqlbm_ss0.agg(16));
set_param_value('Hh_demandss',          eqlbm_ss0.agg(17));
set_param_value('Lh_demandss_star',     eqlbm_ss0.agg(18));
set_param_value('Hh_demandss_star',     eqlbm_ss0.agg(19));
set_param_value('BOP_FCLss',            eqlbm_ss0.agg(20));
set_param_value('BOP_FCHss',            eqlbm_ss0.agg(21));
set_param_value('BOP_TBLss',            eqlbm_ss0.agg(22));
set_param_value('BOP_TBHss',            eqlbm_ss0.agg(23));
set_param_value('BOP_FCss',             eqlbm_ss0.agg(24));
set_param_value('BOP_TBss',             eqlbm_ss0.agg(25));
set_param_value('T_aggss',              eqlbm_ss0.gov(1));
set_param_value('T_aggss_star',         eqlbm_ss0.gov(2));
set_param_value('TL_aggss',             eqlbm_ss0.gov(3));
set_param_value('TH_aggss',             eqlbm_ss0.gov(4));
set_param_value('TL_aggss_star',        eqlbm_ss0.gov(5));
set_param_value('TH_aggss_star',        eqlbm_ss0.gov(6));
set_param_value('tauIMLss',             parL.tauIM);
set_param_value('tauIMHss',             parH.tauIM);
set_param_value('tauIMLss_star',        parL_star.tauIM);
set_param_value('tauIMHss_star',        parH_star.tauIM);
set_param_value('tauss_offshoringL',    parL.tau_offshoring);
set_param_value('tauss_offshoringH',    parH.tau_offshoring);
set_param_value('tauss_offshoringL_star',parL_star.tau_offshoring);
set_param_value('tauss_offshoringH_star',parH_star.tau_offshoring);
set_param_value('s_ELss',                parL.s_E);
set_param_value('s_EHss',                parH.s_E);
set_param_value('s_ELss_star',           parL_star.s_E);
set_param_value('s_EHss_star',           parH_star.s_E);
set_param_value('s_DLss',                parL.s_D);
set_param_value('s_DHss',                parH.s_D);
set_param_value('s_DLss_star',           parL_star.s_D);
set_param_value('s_DHss_star',           parH_star.s_D);
set_param_value('agg_offshss',           eqlbm_ss0.agg(40));
set_param_value('agg_offsh_starss',      eqlbm_ss0.agg(41));

set_param_value('CHhss',                 eqlbm_ss0.hh(1));
set_param_value('CHlss',                 eqlbm_ss0.hh(2));
set_param_value('CLhss',                 eqlbm_ss0.hh(3));
set_param_value('CLlss',                 eqlbm_ss0.hh(4));
set_param_value('CHhss_star',            eqlbm_ss0.hh(5));
set_param_value('CHlss_star',            eqlbm_ss0.hh(6));
set_param_value('CLhss_star',            eqlbm_ss0.hh(7));
set_param_value('CLlss_star',            eqlbm_ss0.hh(8));
set_param_value('epshss',                eqlbm_ss0.hh(9));
set_param_value('epslss',                eqlbm_ss0.hh(10));
set_param_value('epshss_star',           eqlbm_ss0.hh(11));
set_param_value('epslss_star',           eqlbm_ss0.hh(12));
set_param_value('VHhss',                eqlbm_ss0.hh(19));
set_param_value('VHlss',                eqlbm_ss0.hh(20));
set_param_value('VLhss',                eqlbm_ss0.hh(21));
set_param_value('VLlss',                eqlbm_ss0.hh(22));
set_param_value('VHhss_star',           eqlbm_ss0.hh(23));
set_param_value('VHlss_star',           eqlbm_ss0.hh(24));
set_param_value('VLhss_star',           eqlbm_ss0.hh(25));
set_param_value('VLlss_star',           eqlbm_ss0.hh(26));
set_param_value('HhE_supplyss',         eqlbm_ss0.hh(27));
set_param_value('HlE_supplyss',         eqlbm_ss0.hh(28));
set_param_value('LhE_supplyss',         eqlbm_ss0.hh(29));
set_param_value('LlE_supplyss',         eqlbm_ss0.hh(30));
set_param_value('HhE_supplyss_star',         eqlbm_ss0.hh(31));
set_param_value('HlE_supplyss_star',         eqlbm_ss0.hh(32));
set_param_value('LhE_supplyss_star',         eqlbm_ss0.hh(33));
set_param_value('LlE_supplyss_star',         eqlbm_ss0.hh(34));

set_param_value('profits_percapitass',      eqlbm_ss0.hh(35));
set_param_value('profits_percapitass_star', eqlbm_ss0.hh(36));

//addtitional variables and their steadystate values

set_param_value('VAHss',             eqlbm_ss0.agg(26) - eqlbm_ss0.agg(21) + eqlbm_ss0.masses(10)*eqlbm_ss0.ent_value(2));
set_param_value('VALss',             eqlbm_ss0.agg(27) - eqlbm_ss0.agg(20) + eqlbm_ss0.masses(9)*eqlbm_ss0.ent_value(1));
set_param_value('VAHss_star',        eqlbm_ss0.agg(28) + eqlbm_ss0.agg(21) + eqlbm_ss0.masses(20)*eqlbm_ss0.ent_value(4));
set_param_value('VALss_star',        eqlbm_ss0.agg(29) + eqlbm_ss0.agg(20) + eqlbm_ss0.masses(19)*eqlbm_ss0.ent_value(3));

set_param_value('YHss',              eqlbm_ss0.agg(26));
set_param_value('YLss',              eqlbm_ss0.agg(27));
set_param_value('YHss_star',         eqlbm_ss0.agg(28));
set_param_value('YLss_star',         eqlbm_ss0.agg(29));

set_param_value('wtilss',            eqlbm_ss0.agg(30));
set_param_value('wtilss_star',       eqlbm_ss0.agg(31));
set_param_value('giniss',            eqlbm_ss0.agg(32));
set_param_value('giniss_star',       eqlbm_ss0.agg(33));

///////////////////////////////////////////////////////////////////////////
// MODEL
///////////////////////////////////////////////////////////////////////////
model;

// Cutoffs
z_VL            = ((fVL*(Q/Z_star)*(wLl_star/(1-alphaL))^(1-alphaL)*(wLh_star/alphaL)^(alphaL))/ 
    ((1/(psiL^(1-theta)))*(1/theta)*(theta/(theta-1))^(1-theta)*gammaL*C* 
    (((tau_offshoringL*Q*wLl_star)/(Z_star*(1-alphaL)))^((1-alphaL)*(1-theta))* 
    (wLh/(Z*alphaL))^(alphaL*(1-theta)) - ((1-s_DL)/Z)^(1-theta)*(wLl/(1-alphaL))^((1-alphaL)*(1-theta))* 
    (wLh/alphaL)^(alphaL*(1-theta)))))^(1/(theta-1));

z_VH            = ((fVH*(Q/Z_star)*(wHl_star/(1-alphaH))^(1-alphaH)*(wHh_star/alphaH)^(alphaH))/ 
    ((1/(psiH^(1-theta)))*(1/theta)*(theta/(theta-1))^(1-theta)*gammaH*C* 
    (((tau_offshoringH*Q*wHl_star)/(Z_star*(1-alphaH)))^((1-alphaH)*(1-theta))* 
    (wHh/(Z*alphaH))^(alphaH*(1-theta)) - ((1-s_DH)/Z)^(1-theta)*(wHl/(1-alphaH))^((1-alphaH)*(1-theta))* 
    (wHh/alphaH)^(alphaH*(1-theta)))))^(1/(theta-1));

z_XL            = (((fXL/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL))/ 
    ((1/(psiL_star^(1-theta)))*(1/theta)*((1+tauIML_star)^(-theta))*((theta/(theta-1))* 
    (tauL*(Q^(-1))/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL))^(1-theta) 
    *gammaL*C_star*Q))^(1/(theta-1));

z_XH            = (((fXH/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH))/ 
    ((1/(psiH_star^(1-theta)))*(1/theta)*((1+tauIMH_star)^(-theta))*((theta/(theta-1))* 
    (tauH*(Q^(-1))/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH))^(1-theta) 
    *gammaH*C_star*Q))^(1/(theta-1));

z_VL_star        = (((fVL_star*(Q^(-1))/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL))/ 
    ((1/(psiL_star^(1-theta)))*(1/theta)*((theta/(theta-1))^(1-theta))* 
    ((wLl_star/(Z_star*(1-alphaL)))^((1-alphaL)*(1-theta))*
    ((tau_offshoringL_star*(Q^(-1))*wLh)/(Z*alphaL))^(alphaL*(1-theta)) 
    - (((1-s_DL_star)/Z_star)^(1-theta))*((wLl_star/(1-alphaL))^ 
    ((1-alphaL)*(1-theta)))*((wLh_star/alphaL)^(alphaL*(1-theta))))*gammaL*C_star))^ 
    (1/(theta-1));

z_VH_star        = (((fVH_star*(Q^(-1))/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH))/ 
    ((1/(psiH_star^(1-theta)))*(1/theta)*((theta/(theta-1))^(1-theta))* 
    ((wHl_star/(Z_star*(1-alphaH)))^((1-alphaH)*(1-theta))*
    ((tau_offshoringH_star*(Q^(-1))*wHh)/(Z*alphaH))^(alphaH*(1-theta)) 
    - ((1-s_DH_star)/Z_star)^(1-theta)*((wHl_star/(1-alphaH))^ 
    ((1-alphaH)*(1-theta)))*((wHh_star/alphaH)^(alphaH*(1-theta))))*gammaH*C_star))^ 
    (1/(theta-1));

z_XL_star        = (((fXL_star/Z_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL))/ 
    ((1/(psiL^(1-theta)))*(1/theta)*((1+tauIML)^(-theta))*(((theta/(theta-1))* 
    (tauL_star*Q/Z_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL))^(1-theta)) 
    *gammaL*C*Q^(-1)))^(1/(theta-1));

z_XH_star        = (((fXH_star/Z_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH))/ 
    ((1/(psiH^(1-theta)))*(1/theta)*((1+tauIMH)^(-theta))*(((theta/(theta-1))* 
    (tauH_star*Q/Z_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH))^(1-theta)) 
    *gammaH*C*Q^(-1)))^(1/(theta-1));


// Average productivity
ztil_DL         = nu*z_min*z_VL*((z_VL^(k-(theta-1)) - z_min^(k-(theta-1)))/ 
    (z_VL^k - z_min^k))^(1/(theta-1));
ztil_DH         = nu*z_min*z_VH*((z_VH^(k-(theta-1)) - z_min^(k-(theta-1)))/ 
    (z_VH^k - z_min^k))^(1/(theta-1));

ztil_VL         = nu*z_VL;
ztil_VH         = nu*z_VH;

ztil_XL         = nu*z_XL;   
ztil_XH         = nu*z_XH;   

ztil_DL_star    = nu*z_min*z_VL_star*((z_VL_star^(k-(theta-1)) - z_min^(k-(theta-1)))/ 
    (z_VL_star^k - z_min^k))^(1/(theta-1));
ztil_DH_star    = nu*z_min*z_VH_star*((z_VH_star^(k-(theta-1)) - z_min^(k-(theta-1)))/ 
    (z_VH_star^k - z_min^k))^(1/(theta-1));

ztil_VL_star    = nu*z_VL_star;
ztil_VH_star    = nu*z_VH_star;

ztil_XL_star    = nu*z_XL_star;  
ztil_XH_star    = nu*z_XH_star; 

// Average price
ptil_DL         = (theta/(theta-1))*((1-s_DL)/(Z*ztil_DL))*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL);
ptil_DH         = (theta/(theta-1))*((1-s_DH)/(Z*ztil_DH))*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH);

ptil_VL         = (theta/(theta-1))*(1/ztil_VL)*
    (((tau_offshoringL*Q*wLl_star)/(Z_star*(1-alphaL)))^(1-alphaL))* 
    ((wLh/(Z*alphaL))^alphaL);
ptil_VH         = (theta/(theta-1))*(1/ztil_VH)*
    (((tau_offshoringH*Q*wHl_star)/(Z_star*(1-alphaH)))^(1-alphaH))* 
    ((wHh/(Z*alphaH))^alphaH);

ptil_XL         = (theta/(theta-1))*(tauL*(Q^(-1))/(Z*ztil_XL))*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL);
ptil_XH         = (theta/(theta-1))*(tauH*(Q^(-1))/(Z*ztil_XH))*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH);

ptil_DL_star    = (theta/(theta-1))*((1-s_DL_star)/(Z_star*ztil_DL_star))* 
    ((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL);
ptil_DH_star    = (theta/(theta-1))*((1-s_DH_star)/(Z_star*ztil_DH_star))* 
    ((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH);

ptil_VL_star    = (theta/(theta-1))*(1/ztil_VL_star)*((wLl_star/(Z_star*(1-alphaL)))^(1-alphaL))* 
    (((tau_offshoringL_star*(Q^(-1))*wLh)/(Z*alphaL))^alphaL);
ptil_VH_star    = (theta/(theta-1))*(1/ztil_VH_star)*((wHl_star/(Z_star*(1-alphaH)))^(1-alphaH))* 
    (((tau_offshoringH_star*(Q^(-1))*wHh)/(Z*alphaH))^alphaH);

ptil_XL_star    = (theta/(theta-1))*(tauL_star*Q/(Z_star*ztil_XL_star))* 
    ((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL);
ptil_XH_star    = (theta/(theta-1))*(tauH_star*Q/(Z_star*ztil_XH_star))* 
    ((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH);

// Average profits
dtil_DL         = (1/theta)*(ptil_DL^(1-theta))*((1/psiL)^(1-theta))*gammaL*C;
dtil_DH         = (1/theta)*(ptil_DH^(1-theta))*((1/psiH)^(1-theta))*gammaH*C;

dtil_VL         = (1/theta)*(ptil_VL^(1-theta))*((1/psiL)^(1-theta))*gammaL*C 
    - (fVL*Q/Z_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL);
dtil_VH         = (1/theta)*(ptil_VH^(1-theta))*((1/psiH)^(1-theta))*gammaH*C 
    - (fVH*Q/Z_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH);

dtil_XL         = (1/theta)*((1+tauIML_star)^(-theta))*(ptil_XL^(1-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star*Q - 
    (fXL/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL);
dtil_XH         = (1/theta)*((1+tauIMH_star)^(-theta))*(ptil_XH^(1-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star*Q - 
    (fXH/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH);

dtil_DL_star    = (1/theta)*(ptil_DL_star^(1-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
dtil_DH_star    = (1/theta)*(ptil_DH_star^(1-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

dtil_VL_star    = (1/theta)*(ptil_VL_star^(1-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star - 
    (fVL_star*(Q^(-1))/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL);
dtil_VH_star    = (1/theta)*(ptil_VH_star^(1-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star - 
    (fVH_star*(Q^(-1))/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH);

dtil_XL_star    = (1/theta)*((1+tauIML)^(-theta))*(ptil_XL_star^(1-theta))*((1/psiL)^(1-theta))*gammaL*C*(Q^(-1)) - 
    (fXL_star/Z_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL);
dtil_XH_star    = (1/theta)*((1+tauIMH)^(-theta))*(ptil_XH_star^(1-theta))*((1/psiH)^(1-theta))*gammaH*C*(Q^(-1)) - 
    (fXH_star/Z_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH);

// Labour demand
ell_DL          = (1/(Z*ztil_DL))*((((1-alphaL)/alphaL)*(wLh/wLl))^alphaL)*(ptil_DL^(-theta))*((1/psiL)^(1-theta))*gammaL*C;
ell_DH          = (1/(Z*ztil_DH))*((((1-alphaH)/alphaH)*(wHh/wHl))^alphaH)*(ptil_DH^(-theta))*((1/psiH)^(1-theta))*gammaH*C;

ell_VL          = (1/((Z^alphaL)*(Z_star^(1-alphaL))*ztil_VL))* 
    ((((1-alphaL)/alphaL)*wLh/(tau_offshoringL*Q*wLl_star))^alphaL)*(ptil_VL^(-theta))*((1/psiL)^(1-theta))*gammaL*C;
ell_VH          = (1/((Z^alphaH)*(Z_star^(1-alphaH))*ztil_VH))* 
    ((((1-alphaH)/alphaH)*wHh/(tau_offshoringH*Q*wHl_star))^alphaH)*(ptil_VH^(-theta))*((1/psiH)^(1-theta))*gammaH*C;

ell_XL          = tauL*(1/(Z*ztil_XL))*((((1-alphaL)/alphaL)*wLh/wLl)^alphaL)*
    (((1+tauIML_star)*ptil_XL)^(-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
ell_XH          = tauH*(1/(Z*ztil_XH))*((((1-alphaH)/alphaH)*wHh/wHl)^alphaH)*
    (((1+tauIMH_star)*ptil_XH)^(-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

ell_DL_star     = (1/(Z_star*ztil_DL_star))*((((1-alphaL)/alphaL)*wLh_star/wLl_star)^alphaL)*
    (ptil_DL_star^(-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
ell_DH_star     = (1/(Z_star*ztil_DH_star))*((((1-alphaH)/alphaH)*wHh_star/wHl_star)^alphaH)*
    (ptil_DH_star^(-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

ell_VL_star     = (1/((Z^alphaL)*(Z_star^(1-alphaL))*ztil_VL_star))*
    ((((1-alphaL)/alphaL)*tau_offshoringL_star*(Q^(-1))*wLh/wLl_star)^alphaL)*
    (ptil_VL_star^(-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
ell_VH_star     = (1/((Z^alphaH)*(Z_star^(1-alphaH))*ztil_VH_star))*
    ((((1-alphaH)/alphaH)*tau_offshoringH_star*(Q^(-1))*wHh/wHl_star)^alphaH)*
    (ptil_VH_star^(-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

ell_XL_star     = tauL_star*(1/(Z_star*ztil_XL_star))*((((1-alphaL)/alphaL)*wLh_star/wLl_star)^alphaL)*
    (((1+tauIML)*ptil_XL_star)^(-theta))*((1/psiL)^(1-theta))*gammaL*C;
ell_XH_star     = tauH_star*(1/(Z_star*ztil_XH_star))*((((1-alphaH)/alphaH)*wHh_star/wHl_star)^alphaH)*
    (((1+tauIMH)*ptil_XH_star)^(-theta))*((1/psiH)^(1-theta))*gammaH*C;

h_DL            = (1/(Z*ztil_DL))*(((alphaL/(1-alphaL))*wLl/wLh)^(1-alphaL))*(ptil_DL^(-theta))*((1/psiL)^(1-theta))*gammaL*C;
h_DH            = (1/(Z*ztil_DH))*(((alphaH/(1-alphaH))*wHl/wHh)^(1-alphaH))*(ptil_DH^(-theta))*((1/psiH)^(1-theta))*gammaH*C;

h_VL            = (1/((Z^alphaL)*(Z_star^(1-alphaL))*ztil_VL))* 
    (((alphaL/(1-alphaL))*tau_offshoringL*Q*wLl_star/wLh)^(1-alphaL))* 
    (ptil_VL^(-theta))*((1/psiL)^(1-theta))*gammaL*C;
h_VH            = (1/((Z^alphaH)*(Z_star^(1-alphaH))*ztil_VH))* 
    (((alphaH/(1-alphaH))*tau_offshoringH*Q*wHl_star/wHh)^(1-alphaH))* 
    (ptil_VH^(-theta))*((1/psiH)^(1-theta))*gammaH*C;

h_XL            = tauL*(1/(Z*ztil_XL))*(((alphaL/(1-alphaL))*wLl/wLh)^(1-alphaL))* 
    (((1+tauIML_star)*ptil_XL)^(-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
h_XH            = tauH*(1/(Z*ztil_XH))*(((alphaH/(1-alphaH))*wHl/wHh)^(1-alphaH))* 
    (((1+tauIMH_star)*ptil_XH)^(-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

h_DL_star       = (1/(Z_star*ztil_DL_star))*(((alphaL/(1-alphaL))*wLl_star/wLh_star)^(1-alphaL))*
    (ptil_DL_star^(-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
h_DH_star       = (1/(Z_star*ztil_DH_star))*(((alphaH/(1-alphaH))*wHl_star/wHh_star)^(1-alphaH))*
    (ptil_DH_star^(-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

h_VL_star       = (1/((Z^alphaL)*(Z_star^(1-alphaL))*ztil_VL_star))* 
    (((alphaL/(1-alphaL))*wLl_star/(tau_offshoringL_star*(Q^(-1))*wLh))^(1-alphaL))* 
    (ptil_VL_star^(-theta))*((1/psiL_star)^(1-theta))*gammaL*C_star;
h_VH_star       = (1/((Z^alphaH)*(Z_star^(1-alphaH))*ztil_VH_star))* 
    (((alphaH/(1-alphaH))*wHl_star/(tau_offshoringH_star*(Q^(-1))*wHh))^(1-alphaH))* 
    (ptil_VH_star^(-theta))*((1/psiH_star)^(1-theta))*gammaH*C_star;

h_XL_star       = tauL_star*(1/(Z_star*ztil_XL_star))*(((alphaL/(1-alphaL))*wLl_star/wLh_star)^(1-alphaL))* 
    (((1+tauIML)*ptil_XL_star)^(-theta))*((1/psiL)^(1-theta))*gammaL*C;
h_XH_star       = tauH_star*(1/(Z_star*ztil_XH_star))*(((alphaH/(1-alphaH))*wHl_star/wHh_star)^(1-alphaH))* 
    (((1+tauIMH)*ptil_XH_star)^(-theta))*((1/psiH)^(1-theta))*gammaH*C;

// Fractions of firms in each status
G_DL            = 1 - (z_min/z_VL)^k;    
G_VL            = 1 - G_DL;                      
G_XL            = (z_min/z_XL)^k;  

G_DH            = 1 - (z_min/z_VH)^k;    
G_VH            = 1 - G_DH;                      
G_XH            = (z_min/z_XH)^k;         
       
G_DL_star       = 1 - (z_min/z_VL_star)^k;    
G_VL_star       = 1 - G_DL_star;
G_XL_star       = (z_min/z_XL_star)^k;         

G_DH_star       = 1 - (z_min/z_VH_star)^k;   
G_VH_star       = 1 - G_DH_star;
G_XH_star       = (z_min/z_XH_star)^k;       

// Value to entry
dL              = G_DL*dtil_DL + G_VL*dtil_VL + G_XL*dtil_XL;
dH              = G_DH*dtil_DH + G_VH*dtil_VH + G_XH*dtil_XH;

dL_star         = G_DL_star*dtil_DL_star + G_VL_star*dtil_VL_star + G_XL_star*dtil_XL_star;
dH_star         = G_DH_star*dtil_DH_star + G_VH_star*dtil_VH_star + G_XH_star*dtil_XH_star;

vtilL           = (1-delta)*SDF*(dL(+1) + vtilL(+1));
vtilH           = (1-delta)*SDF*(dH(+1) + vtilH(+1));

vtilL_star      = (1-delta)*SDF_star*(dL_star(+1) + vtilL_star(+1));
vtilH_star      = (1-delta)*SDF_star*(dH_star(+1) + vtilH_star(+1));

// Masses
massL           = (1-delta)*(massL(-1) + mass_EL);
massH           = (1-delta)*(massH(-1) + mass_EH);

massL_star      = (1-delta)*(massL_star(-1) + mass_EL_star);
massH_star      = (1-delta)*(massH_star(-1) + mass_EH_star);

mass_DL         = massL(-1)*G_DL;
mass_DH         = massH(-1)*G_DH;
mass_VL         = massL(-1)*G_VL;
mass_VH         = massH(-1)*G_VH;
mass_XL         = massL(-1)*G_XL;
mass_XH         = massH(-1)*G_XH;

mass_DL_star    = massL_star(-1)*G_DL_star;
mass_DH_star    = massH_star(-1)*G_DH_star;
mass_VL_star    = massL_star(-1)*G_VL_star;
mass_VH_star    = massH_star(-1)*G_VH_star;
mass_XL_star    = massL_star(-1)*G_XL_star;
mass_XH_star    = massH_star(-1)*G_XH_star;

// Aggregation
agg_profitsL        = mass_DL*dtil_DL + mass_XL*dtil_XL + mass_VL*dtil_VL;
agg_profitsH        = mass_DH*dtil_DH + mass_XH*dtil_XH + mass_VH*dtil_VH;

agg_profitsL_star   = mass_DL_star*dtil_DL_star + mass_XL_star*dtil_XL_star + mass_VL_star*dtil_VL_star;
agg_profitsH_star   = mass_DH_star*dtil_DH_star + mass_XH_star*dtil_XH_star + mass_VH_star*dtil_VH_star;

Ll_demand           = mass_DL*ell_DL + mass_XL*ell_XL + 
    (mass_EL*fEL/Z + mass_XL*fXL/Z + mass_VL_star*fVL_star/Z)*(((1-alphaL)*wLh/(alphaL*wLl))^alphaL);
Hl_demand           = mass_DH*ell_DH + mass_XH*ell_XH + 
    (mass_EH*fEH/Z + mass_XH*fXH/Z + mass_VH_star*fVH_star/Z)*(((1-alphaH)*wHh/(alphaH*wHl))^alphaH);

Ll_demand_star      = mass_DL_star*ell_DL_star + mass_XL_star*ell_XL_star + mass_VL_star*ell_VL_star + tau_offshoringL*mass_VL*ell_VL + 
    (mass_EL_star*fEL_star/Z_star + mass_XL_star*fXL_star/Z_star + mass_VL*fVL/Z_star)*(((1-alphaL)*wLh_star/(alphaL*wLl_star))^alphaL);
Hl_demand_star      = mass_DH_star*ell_DH_star + mass_XH_star*ell_XH_star + mass_VH_star*ell_VH_star + tau_offshoringH*mass_VH*ell_VH + 
    (mass_EH_star*fEH_star/Z_star + mass_XH_star*fXH_star/Z_star + mass_VH*fVH/Z_star)*(((1-alphaH)*wHh_star/(alphaH*wHl_star))^alphaH);

Lh_demand           = mass_DL*h_DL + mass_XL*h_XL + mass_VL*h_VL + mass_VL_star*h_VL_star*tau_offshoringL_star + 
    (mass_EL*fEL/Z + mass_XL*fXL/Z + mass_VL_star*fVL_star/Z)*((alphaL*wLl/((1-alphaL)*wLh))^(1-alphaL));
Hh_demand           = mass_DH*h_DH + mass_XH*h_XH + mass_VH*h_VH + mass_VH_star*h_VH_star*tau_offshoringH_star + 
    (mass_EH*fEH/Z + mass_XH*fXH/Z + mass_VH_star*fVH_star/Z)*((alphaH*wHl/((1-alphaH)*wHh))^(1-alphaH));

Lh_demand_star      = mass_DL_star*h_DL_star + mass_XL_star*h_XL_star + 
    (mass_EL_star*fEL_star/Z_star + mass_XL_star*fXL_star/Z_star + mass_VL*fVL/Z_star)*((alphaL*wLl_star/((1-alphaL)*wLh_star))^(1-alphaL));
Hh_demand_star      = mass_DH_star*h_DH_star + mass_XH_star*h_XH_star + 
    (mass_EH_star*fEH_star/Z_star + mass_XH_star*fXH_star/Z_star + mass_VH*fVH/Z_star)*((alphaH*wHl_star/((1-alphaH)*wHh_star))^(1-alphaH));

psiL                = (mass_DL*(ptil_DL^(1-theta)) + mass_VL*(ptil_VL^(1-theta)) + mass_XL_star*(((1+tauIML)*ptil_XL_star)^(1-theta)))^(1/(1-theta));
psiH                = (mass_DH*(ptil_DH^(1-theta)) + mass_VH*(ptil_VH^(1-theta)) + mass_XH_star*(((1+tauIMH)*ptil_XH_star)^(1-theta)))^(1/(1-theta));

psiL_star           = (mass_DL_star*(ptil_DL_star^(1-theta)) + mass_VL_star*(ptil_VL_star^(1-theta)) + 
    mass_XL*(((1+tauIML_star)*ptil_XL)^(1-theta)))^(1/(1-theta));
psiH_star           = (mass_DH_star*(ptil_DH_star^(1-theta)) + mass_VH_star*(ptil_VH_star^(1-theta)) + 
    mass_XH*(((1+tauIMH_star)*ptil_XH)^(1-theta)))^(1/(1-theta));

agg_P               = ((psiH/gammaH)^gammaH)*((psiL/gammaL)^gammaL);
agg_P_star          = ((psiH_star/gammaH)^gammaH)*((psiL_star/gammaL)^gammaL);

BOP_FCL             = mass_VL*fVL*(Q/Z_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL) - 
    mass_VL_star*fVL_star*(1/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL);
BOP_FCH             = mass_VH*fVH*(Q/Z_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH) - 
    mass_VH_star*fVH_star*(1/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH);
BOP_FC              = BOP_FCL + BOP_FCH;

BOP_TBL             = mass_XL*ptil_XL*(((1+tauIML_star)*ptil_XL/psiL_star)^(-theta))*(gammaL/psiL_star)*C_star*Q + 
    tau_offshoringL_star*mass_VL_star*wLh*h_VL_star - 
    tau_offshoringL*mass_VL*wLl_star*ell_VL*Q - mass_XL_star*ptil_XL_star*(((1+tauIML)*ptil_XL_star/psiL)^(-theta))*(gammaL/psiL)*C;
BOP_TBH             = mass_XH*ptil_XH*(((1+tauIMH_star)*ptil_XH/psiH_star)^(-theta))*(gammaH/psiH_star)*C_star*Q + 
    tau_offshoringH_star*mass_VH_star*wHh*h_VH_star - 
    tau_offshoringH*mass_VH*wHl_star*ell_VH*Q - mass_XH_star*ptil_XH_star*(((1+tauIMH)*ptil_XH_star/psiH)^(-theta))*(gammaH/psiH)*C;
BOP_TB              = BOP_TBL + BOP_TBH;

BOP                 = BOP_FC - BOP_TB;

// Government
TL_agg          = tauIML*mass_XL_star*ptil_XL_star*(((1+tauIML)*ptil_XL_star/psiL)^(-theta))*(gammaL/psiL)*C 
    - s_EL*mass_EL*(fEL/Z)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL) - 
    s_DL*mass_DL*((ptil_DL/psiL)^(-theta))*(gammaL/psiL)*C*(1/Z)*(1/ztil_DL)*((wLl/(1-alphaL))^(1-alphaL))*((wLh/alphaL)^alphaL);
TH_agg          = tauIMH*mass_XH_star*ptil_XH_star*((1+tauIMH)*ptil_XH_star/psiH)^(-theta)*(gammaH/psiH)*C 
    - s_EH*mass_EH*(fEH/Z)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH) - 
    s_DH*mass_DH*((ptil_DH/psiH)^(-theta))*(gammaH/psiH)*C*(1/Z)*(1/ztil_DH)*((wHl/(1-alphaH))^(1-alphaH))*((wHh/alphaH)^alphaH);
T_agg           = (TH_agg + TL_agg)/(h_supplyL + h_supplyH + l_supplyL + l_supplyH);

TL_agg_star     = tauIML_star*mass_XL*ptil_XL*(((1+tauIML_star)*ptil_XL/psiL_star)^(-theta))*(gammaL/psiL_star)*C_star 
    - s_EL_star*mass_EL_star*(fEL_star/Z_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^(alphaL)) - 
    s_DL_star*mass_DL_star*((ptil_DL_star/psiL_star)^(-theta))*(gammaL/psiL_star)*C_star*(1/Z_star)*(1/ztil_DL_star)*((wLl_star/(1-alphaL))^(1-alphaL))*((wLh_star/alphaL)^alphaL);
TH_agg_star     = tauIMH_star*mass_XH*ptil_XH*(((1+tauIMH_star)*ptil_XH/psiH_star)^(-theta))*(gammaH/psiH_star)*C_star 
    - s_EH_star*mass_EH_star*(fEH_star/Z_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^(alphaH)) - 
    s_DH_star*mass_DH_star*((ptil_DH_star/psiH_star)^(-theta))*(gammaH/psiH_star)*C_star*(1/Z_star)*(1/ztil_DH_star)*((wHl_star/(1-alphaH))^(1-alphaH))*((wHh_star/alphaH)^alphaH);
T_agg_star      = (TH_agg_star + TL_agg_star)/(h_supplyL_star + h_supplyH_star + l_supplyL_star + l_supplyL_star);

// Aggregate offshoring friction
agg_offsh       = (tau_offshoringL-1)*mass_VL*wLl_star*ell_VL*Q + (tau_offshoringH-1)*mass_VH*wHl_star*ell_VH*Q;
agg_offsh_star  = (tau_offshoringL_star-1)*mass_VL_star*wLh*h_VL_star + (tau_offshoringH_star-1)*mass_VH_star*wHh*h_VH_star;


// Household
SDFHh           = beta*(CHh(+1)/CHh)^(-gamma);
SDFHl           = beta*(CHl(+1)/CHl)^(-gamma);
SDFLh           = beta*(CLh(+1)/CLh)^(-gamma);
SDFLl           = beta*(CLl(+1)/CLl)^(-gamma);

SDF           = beta*(C(+1)/C)^(-gamma);

SDFHh_star      = beta*(CHh_star(+1)/CHh_star)^(-gamma);
SDFHl_star      = beta*(CHl_star(+1)/CHl_star)^(-gamma);
SDFLh_star      = beta*(CLh_star(+1)/CLh_star)^(-gamma);
SDFLl_star      = beta*(CLl_star(+1)/CLl_star)^(-gamma);

SDF_star      = beta*(C_star(+1)/C_star)^(-gamma);

1 + eta*BHh     = (1+r)*SDFHh;
1 + eta*BHl     = (1+r)*SDFHl;
1 + eta*BLh     = (1+r)*SDFLh;
1 + eta*BLl     = (1+r)*SDFLl;

1 + eta*BHh_star= (1+r_star)*SDFHh_star;
1 + eta*BHl_star= (1+r_star)*SDFHl_star;
1 + eta*BLh_star= (1+r_star)*SDFLh_star;
1 + eta*BLl_star= (1+r_star)*SDFLl_star;

THh             = eta/2*BHh^2;
THl             = eta/2*BHl^2;
TLh             = eta/2*BLh^2;
TLl             = eta/2*BLl^2;

THh_star        = eta/2*BHh_star^2;
THl_star        = eta/2*BHl_star^2;
TLh_star        = eta/2*BLh_star^2;
TLl_star        = eta/2*BLl_star^2;

//C               = CHh*h_supplyH + CHl*l_supplyH + CLh*h_supplyL + CLl*l_supplyL;
//C_star          = CHh_star*h_supplyH_star + CHl_star*l_supplyH_star + CLh_star*h_supplyL_star + CLl_star*l_supplyL_star;

profits_percapita           = (agg_profitsL + agg_profitsH - mass_EL*vtilL - mass_EH*vtilH)/(h_supplyH + h_supplyL + l_supplyH + l_supplyL);
profits_percapita_star      = (agg_profitsL_star + agg_profitsH_star - mass_EL_star*vtilL_star - mass_EH_star*vtilH_star)/ 
    (h_supplyH_star + h_supplyL_star + l_supplyH_star + l_supplyL_star);

CHh             = ((1+r(-1))*BHh(-1) + wHh*h_supplyH + T_agg*h_supplyH + profits_percapita*h_supplyH + THh - BHh - eta/2*BHh^2)/h_supplyH;
CHl             = ((1+r(-1))*BHl(-1) + wHl*l_supplyH + T_agg*l_supplyH + profits_percapita*l_supplyH + THl - BHl - eta/2*BHl^2)/l_supplyH;
CLh             = ((1+r(-1))*BLh(-1) + wLh*h_supplyL + T_agg*h_supplyL + profits_percapita*h_supplyL + TLh - BLh - eta/2*BLh^2)/h_supplyL;
CLl             = ((1+r(-1))*BLl(-1) + wLl*l_supplyL + T_agg*l_supplyL + profits_percapita*l_supplyL + TLl - BLl - eta/2*BLl^2)/l_supplyL;

CHh_star        = ((1+r_star(-1))*BHh_star(-1) + wHh_star*h_supplyH_star + T_agg_star*h_supplyH_star + profits_percapita_star*h_supplyH_star + THh_star - BHh_star - eta/2*BHh_star^2)/h_supplyH_star;
CHl_star        = ((1+r_star(-1))*BHl_star(-1) + wHl_star*l_supplyH_star + T_agg_star*l_supplyH_star + profits_percapita_star*l_supplyH_star + THl_star - BHl_star - eta/2*BHl_star^2)/l_supplyH_star;
CLh_star        = ((1+r_star(-1))*BLh_star(-1) + wLh_star*h_supplyL_star + T_agg_star*h_supplyL_star + profits_percapita_star*h_supplyL_star + TLh_star - BLh_star - eta/2*BLh_star^2)/h_supplyL_star;
CLl_star        = ((1+r_star(-1))*BLl_star(-1) + wLl_star*l_supplyL_star + T_agg_star*l_supplyL_star + profits_percapita_star*l_supplyL_star + TLl_star - BLl_star - eta/2*BLl_star^2)/l_supplyL_star;

VHh             = log(CHh) + beta*(1-s)*VHh(+1);
VHl             = log(CHl) + beta*(1-s)*VHl(+1);
VLh             = log(CLh) + beta*(1-s)*VLh(+1);
VLl             = log(CLl) + beta*(1-s)*VLl(+1);

VHh_star        = log(CHh_star) + beta*(1-s)*VHh_star(+1);
VHl_star        = log(CHl_star) + beta*(1-s)*VHl_star(+1);
VLh_star        = log(CLh_star) + beta*(1-s)*VLh_star(+1);
VLl_star        = log(CLl_star) + beta*(1-s)*VLl_star(+1);

epsh            = VLh - VHh;
epsl            = VLl - VHl;

epsh_star       = VLh_star - VHh_star;
epsl_star       = VLl_star - VHl_star;

HhE_supply/(s*(h_supplyL + h_supplyH))                          = (1 - (1/2 + 1/2*erf((epsh-meanh)/(sqrt(2)*sigmah))));
LhE_supply                                                      = (s*(h_supplyL + h_supplyH)) - HhE_supply;
HlE_supply/(s*(l_supplyL + l_supplyH))                          = (1 - (1/2 + 1/2*erf((epsl-meanl)/(sqrt(2)*sigmal))));
LlE_supply                                                      = (s*(l_supplyL + l_supplyH)) - HlE_supply;

HhE_supply_star/(s*(h_supplyL_star + h_supplyH_star))           = (1 - (1/2 + 1/2*erf((epsh_star-meanh_star)/(sqrt(2)*sigmah_star))));
LhE_supply_star                                                 = (s*(h_supplyL_star + h_supplyH_star)) - HhE_supply_star;
HlE_supply_star/(s*(l_supplyL_star + l_supplyH_star))           = (1 - (1/2 + 1/2*erf((epsl_star-meanl_star)/(sqrt(2)*sigmal_star))));
LlE_supply_star                                                 = (s*(l_supplyL_star + l_supplyH_star)) - HlE_supply_star;

h_supplyH           = (1-s)*h_supplyH(-1) + HhE_supply;
h_supplyL           = (1-s)*h_supplyL(-1) + LhE_supply;
l_supplyH           = (1-s)*l_supplyH(-1) + HlE_supply;
l_supplyL           = (1-s)*l_supplyL(-1) + LlE_supply;

h_supplyH_star      = (1-s)*h_supplyH_star(-1) + HhE_supply_star;
h_supplyL_star      = (1-s)*h_supplyL_star(-1) + LhE_supply_star;
l_supplyH_star      = (1-s)*l_supplyH_star(-1) + HlE_supply_star;
l_supplyL_star      = (1-s)*l_supplyL_star(-1) + LlE_supply_star;

// Additional variables for plotting
VAH               = gammaH*C + BOP_TBH - BOP_FCH + mass_EH*vtilH;
VAL               = gammaL*C + BOP_TBL - BOP_FCL + mass_EL*vtilL;
VAH_star          = gammaH_star*C_star - BOP_TBH + BOP_FCH + mass_EH_star*vtilH_star;
VAL_star          = gammaL_star*C_star - BOP_TBL + BOP_FCL + mass_EL_star*vtilL_star;

YH                = gammaH*C + BOP_TBH;
YL                = gammaL*C + BOP_TBL;
YH_star           = gammaH_star*C_star - BOP_TBH;
YL_star           = gammaL_star*C_star - BOP_TBL;

wtil      = wHh * h_supplyH + wLh * h_supplyL + wHl * l_supplyH + wLl * l_supplyL;
wtil_star = wHh_star * h_supplyH_star + wLh_star * h_supplyL_star + wHl_star * l_supplyH_star + wLl_star * l_supplyL_star;

gini        = (abs(wHh - wLh) * h_supplyH * h_supplyL + abs(wHh - wHl) * h_supplyH * l_supplyH + abs(wHh - wLl) * h_supplyH * l_supplyL 
             + abs(wLh - wHh) * h_supplyL * h_supplyH + abs(wLh - wHl) * h_supplyL * l_supplyH + abs(wLh - wLl) * h_supplyL * l_supplyL 
             + abs(wHl - wHh) * l_supplyH * h_supplyH + abs(wHl - wLh) * l_supplyH * h_supplyL + abs(wHl - wLl) * l_supplyH * l_supplyL 
             + abs(wLl - wHh) * l_supplyL * h_supplyH + abs(wLl - wLh) * l_supplyL * h_supplyL + abs(wLl - wHl) * l_supplyL * l_supplyH)/(2*((h_supplyH + h_supplyL + l_supplyH + l_supplyL)^2)*wtil);

gini_star   = (abs(wHh_star - wLh_star) * h_supplyH_star * h_supplyL_star + abs(wHh_star - wHl_star) * h_supplyH_star * l_supplyH_star + abs(wHh_star - wLl_star) * h_supplyH_star * l_supplyL_star 
             + abs(wLh_star - wHh_star) * h_supplyL_star * h_supplyH_star + abs(wLh_star - wHl_star) * h_supplyL_star * l_supplyH_star + abs(wLh_star - wLl_star) * h_supplyL_star * l_supplyL_star 
             + abs(wHl_star - wHh_star) * l_supplyH_star * h_supplyH_star + abs(wHl_star - wLh_star) * l_supplyH_star * h_supplyL_star + abs(wHl_star - wLl_star) * l_supplyH_star * l_supplyL_star 
             + abs(wLl_star - wHh_star) * l_supplyL_star * h_supplyH_star + abs(wLl_star - wLh_star) * l_supplyL_star * h_supplyL_star + abs(wLl_star - wHl_star) * l_supplyL_star * l_supplyH_star) / (2 * ((h_supplyH_star + h_supplyL_star + l_supplyH_star + l_supplyL_star)^2) * wtil_star);

// Productivity process
log(Z)          = (1-pers)*log(Zss) + pers*log(Z(-1)) + eps_Z;
log(Z_star)     = (1-pers)*log(Zss_star) + pers*log(Z_star(-1)) + eps_Z_star;

// Policy processes
tauIML                          = (1-pers_pol)*(tauIMLss) + pers_pol*(tauIML(-1)) + eps_tauIMH;
tauIMH                          = (1-pers_pol)*(tauIMHss) + pers_pol*(tauIMH(-1)) + eps_tauIMH;
tauIML_star                     = (1-pers_pol)*(tauIMLss_star) + pers_pol*(tauIML_star(-1)) + eps_tauIML_star;
tauIMH_star                     = (1-pers_pol)*(tauIMHss_star) + pers_pol*(tauIMH_star(-1)) + eps_tauIML_star;
log(tau_offshoringL)            = (1-pers_pol)*log(tauss_offshoringL) + pers_pol*log(tau_offshoringL(-1)) + eps_tau_offshoringH; 
log(tau_offshoringH)            = (1-pers_pol)*log(tauss_offshoringH) + pers_pol*log(tau_offshoringH(-1)) + eps_tau_offshoringH; 
log(tau_offshoringL_star)       = (1-pers_pol)*log(tauss_offshoringL_star) + pers_pol*log(tau_offshoringL_star(-1)) + eps_tau_offshoringL_star; 
log(tau_offshoringH_star)       = (1-pers_pol)*log(tauss_offshoringH_star) + pers_pol*log(tau_offshoringH_star(-1)) + eps_tau_offshoringL_star; 
s_EL                            = (1-pers_pol)*(s_ELss) + pers_pol*s_EL(-1) + eps_s_EH;
s_EH                            = (1-pers_pol)*(s_EHss) + pers_pol*s_EH(-1) + eps_s_EH;
s_EL_star                       = (1-pers_pol)*(s_ELss_star) + pers_pol*s_EL_star(-1) + eps_s_EL_star;
s_EH_star                       = (1-pers_pol)*(s_EHss_star) + pers_pol*s_EH_star(-1) + eps_s_EL_star;
s_DL                            = (1-pers_pol)*(s_DLss) + pers_pol*s_DL(-1) + eps_s_DH;
s_DH                            = (1-pers_pol)*(s_DHss) + pers_pol*s_DH(-1) + eps_s_DH;
s_DL_star                       = (1-pers_pol)*(s_DLss_star) + pers_pol*s_DL_star(-1) + eps_s_DL_star;
s_DH_star                       = (1-pers_pol)*(s_DHss_star) + pers_pol*s_DH_star(-1) + eps_s_DL_star;

// Equilibrum conditions
BOP             = 0;
agg_P           = 1;
agg_P_star      = 1;
Hh_demand       = h_supplyH;
Lh_demand       = h_supplyL;
Hl_demand       = l_supplyH;
Ll_demand       = l_supplyL;
Hh_demand_star  = h_supplyH_star;
Lh_demand_star  = h_supplyL_star;
Hl_demand_star  = l_supplyH_star;
Ll_demand_star  = l_supplyL_star;
fEL             = vtilL*(1/(1-s_EL))*Z*(((1-alphaL)/wLl)^(1-alphaL))*((alphaL/wLh)^alphaL); 
fEH             = vtilH*(1/(1-s_EH))*Z*(((1-alphaH)/wHl)^(1-alphaH))*((alphaH/wHh)^alphaH);  
fEL_star        = vtilL_star*(1/(1-s_EL_star))*Z_star*(((1-alphaL)/wLl_star)^(1-alphaL))*((alphaL/wLh_star)^alphaL); 
fEH_star        = vtilH_star*(1/(1-s_EH_star))*Z_star*(((1-alphaH)/wHl_star)^(1-alphaH))*((alphaH/wHh_star)^alphaH); 
0               = BHh + BHl + BLh + BLl;
0               = BHh_star + BHl_star + BLh_star + BLl_star;
end;




///////////////////////////////////////////////////////////////////////////
// INITIAL VALUES
///////////////////////////////////////////////////////////////////////////
initval;
Q               = Qss;
C               = Css;
C_star          = Css_star;
wHh             = wHhss;
wHl             = wHlss;
wLh             = wLhss;
wLl             = wLlss;
wHh_star        = wHhss_star;
wHl_star        = wHlss_star;
wLh_star        = wLhss_star;
wLl_star        = wLlss_star;
z_VL            = z_VLss;
z_VH            = z_VHss;
z_XL            = z_XLss;
z_XH            = z_XHss;
z_VL_star       = z_VLss_star;
z_VH_star       = z_VHss_star;
z_XL_star       = z_XLss_star;
z_XH_star       = z_XHss_star;
ztil_DL         = ztil_DLss;
ztil_DH         = ztil_DHss;
ztil_VL         = ztil_VLss;
ztil_VH         = ztil_VHss;
ztil_XL         = ztil_XLss;
ztil_XH         = ztil_XHss;
ztil_DL_star    = ztil_DLss_star;
ztil_DH_star    = ztil_DHss_star;
ztil_VL_star    = ztil_VLss_star;
ztil_VH_star    = ztil_VHss_star;
ztil_XL_star    = ztil_XLss_star;
ztil_XH_star    = ztil_XHss_star;
ptil_DL         = ptil_DLss;
ptil_DH         = ptil_DHss;
ptil_VL         = ptil_VLss;
ptil_VH         = ptil_VHss;
ptil_XL         = ptil_XLss;
ptil_XH         = ptil_XHss;
ptil_DL_star    = ptil_DLss_star;
ptil_DH_star    = ptil_DHss_star;
ptil_VL_star    = ptil_VLss_star;
ptil_VH_star    = ptil_VHss_star;
ptil_XL_star    = ptil_XLss_star;
ptil_XH_star    = ptil_XHss_star;
dtil_DL         = dtil_DLss;
dtil_DH         = dtil_DHss;
dtil_VL         = dtil_VLss;
dtil_VH         = dtil_VHss;
dtil_XL         = dtil_XLss;
dtil_XH         = dtil_XHss;
dtil_DL_star    = dtil_DLss_star;
dtil_DH_star    = dtil_DHss_star;
dtil_VL_star    = dtil_VLss_star;
dtil_VH_star    = dtil_VHss_star;
dtil_XL_star    = dtil_XLss_star;
dtil_XH_star    = dtil_XHss_star;
ell_DL          = ell_DLss;
ell_DH          = ell_DHss;
ell_VL          = ell_VLss;
ell_VH          = ell_VHss;
ell_XL          = ell_XLss;
ell_XH          = ell_XHss;
ell_DL_star     = ell_DLss_star;
ell_DH_star     = ell_DHss_star;
ell_VL_star     = ell_VLss_star;
ell_VH_star     = ell_VHss_star;
ell_XL_star     = ell_XLss_star;
ell_XH_star     = ell_XHss_star;
h_DL            = h_DLss;
h_DH            = h_DHss;
h_VL            = h_VLss;
h_VH            = h_VHss;
h_XL            = h_XLss;
h_XH            = h_XHss;
h_DL_star       = h_DLss_star;
h_DH_star       = h_DHss_star;
h_VL_star       = h_VLss_star;
h_VH_star       = h_VHss_star;
h_XL_star       = h_XLss_star;
h_XH_star       = h_XHss_star;
G_DL            = G_DLss;
G_DH            = G_DHss;
G_VL            = G_VLss;
G_VH            = G_VHss;
G_XL            = G_XLss;
G_XH            = G_XHss;
G_DL_star       = G_DLss_star;
G_DH_star       = G_DHss_star;
G_VL_star       = G_VLss_star;
G_VH_star       = G_VHss_star;
G_XL_star       = G_XLss_star;
G_XH_star       = G_XHss_star;
dL              = dLss;
dH              = dHss;
dL_star         = dLss_star;
dH_star         = dHss_star;
vtilL           = vtilLss;
vtilH           = vtilHss;
vtilL_star      = vtilLss_star;
vtilH_star      = vtilHss_star;
massL           = massLss;
massH           = massHss;
massL_star      = massLss_star;
massH_star      = massHss_star;
mass_DL         = mass_DLss;
mass_DH         = mass_DHss;
mass_XL         = mass_XLss;
mass_XH         = mass_XHss;
mass_VL         = mass_VLss;
mass_VH         = mass_VHss;
mass_EL         = mass_ELss;
mass_EH         = mass_EHss;
mass_DL_star    = mass_DLss_star;
mass_DH_star    = mass_DHss_star;
mass_XL_star    = mass_XLss_star;
mass_XH_star    = mass_XHss_star;
mass_VL_star    = mass_VLss_star;
mass_VH_star    = mass_VHss_star;
mass_EL_star    = mass_ELss_star;
mass_EH_star    = mass_EHss_star;
agg_profitsL    = agg_profitsLss;
agg_profitsH    = agg_profitsHss;
agg_profitsL_star= agg_profitsLss_star;
agg_profitsH_star= agg_profitsHss_star;
Hh_demand       = Hh_demandss;
Hl_demand       = Hl_demandss;
Lh_demand       = Lh_demandss;
Ll_demand       = Ll_demandss;
Hh_demand_star  = Hh_demandss_star;
Hl_demand_star  = Hl_demandss_star;
Lh_demand_star  = Lh_demandss_star;
Ll_demand_star  = Ll_demandss_star;
h_supplyH       = h_supplyHss;
h_supplyL       = h_supplyLss;
l_supplyH       = l_supplyHss;
l_supplyL       = l_supplyLss;
h_supplyH_star  = h_supplyHss_star;
h_supplyL_star  = h_supplyLss_star;
l_supplyH_star  = l_supplyHss_star;
l_supplyL_star  = l_supplyLss_star;
agg_P           = agg_Pss;
agg_P_star      = agg_Pss_star;
BOP             = BOPss;
T_agg           = T_aggss;
T_agg_star      = T_aggss_star;
TL_agg          = TL_aggss;
TH_agg          = TH_aggss;
TL_agg_star     = TL_aggss_star;
TH_agg_star     = TH_aggss_star;
Z               = Zss;
Z_star          = Zss_star;
CHh             = CHhss;
CHl             = CHlss;
CLh             = CLhss;
CLl             = CLlss;
CHh_star        = CHhss_star;
CHl_star        = CHlss_star;
CLh_star        = CLhss_star;
CLl_star        = CLlss_star;
SDFHh           = beta;
SDFHl           = beta;
SDFLh           = beta;
SDFLl           = beta;
SDFHh_star      = beta;
SDFHl_star      = beta;
SDFLh_star      = beta;
SDFLl_star      = beta;
SDF             = beta;
SDF_star        = beta;
THh             = 0;
THl             = 0;
TLh             = 0;
TLl             = 0;
THh_star        = 0;
THl_star        = 0;
TLh_star        = 0;
TLl_star        = 0;
BHh             = 0;
BHl             = 0;
BLh             = 0;
BLl             = 0;
BHh_star        = 0;
BHl_star        = 0;
BLh_star        = 0;
BLl_star        = 0;
VHh             = VHhss;
VHl             = VHlss;
VLh             = VLhss;
VLl             = VLlss;
VHh_star        = VHhss_star;
VHl_star        = VHlss_star;
VLh_star        = VLhss_star;
VLl_star        = VLlss_star;
HhE_supply      = HhE_supplyss;
HlE_supply      = HlE_supplyss;
LhE_supply      = LhE_supplyss;
LlE_supply      = LlE_supplyss;
HhE_supply_star = HhE_supplyss_star;
HlE_supply_star = HlE_supplyss_star;
LhE_supply_star = LhE_supplyss_star;
LlE_supply_star = LlE_supplyss_star;
psiL            = psiLss;
psiH            = psiHss;
psiL_star       = psiLss_star;
psiH_star       = psiHss_star;
r               = rss;
r_star          = rss_star;
profits_percapita       = profits_percapitass;
profits_percapita_star  = profits_percapitass_star;
epsh            = epshss;
epsh_star       = epshss_star;
epsl            = epslss;
epsl_star       = epslss_star;
BOP_FCL         = BOP_FCLss;
BOP_FCH         = BOP_FCHss;
BOP_TBL         = BOP_TBLss;
BOP_TBH         = BOP_TBHss;
BOP_FC          = BOP_FCss;
BOP_TB          = BOP_TBss;

VAH             = VAHss;
VAL             = VALss;
VAH_star        = VAHss_star;
VAL_star        = VALss_star;

YH             = YHss;
YL             = YLss;
YH_star        = YHss_star;
YL_star        = YLss_star;

wtil           = wtilss;
wtil_star      = wtilss_star;
gini           = giniss;
gini_star      = giniss_star;

tauIMH          = tauIMHss;
tauIML          = tauIMLss;
tau_offshoringH = tauss_offshoringH;
tau_offshoringL = tauss_offshoringL;
s_DL            = s_DLss;
s_DH            = s_DHss;
s_EL            = s_ELss;
s_EH            = s_EHss;

tauIMH_star          = tauIMHss_star;
tauIML_star          = tauIMLss_star;
tau_offshoringH_star = tauss_offshoringH_star;
tau_offshoringL_star = tauss_offshoringL_star;
s_DL_star            = s_DLss_star;
s_DH_star            = s_DHss_star;
s_EL_star            = s_ELss_star;
s_EH_star            = s_EHss_star;

agg_offsh           = agg_offshss;
agg_offsh_star      = agg_offsh_starss;

end;


 

///////////////////////////////////////////////////////////////////////////
// SHOCKS AND COMMANDS
///////////////////////////////////////////////////////////////////////////
shocks;
var eps_tauIMH; stderr 0.01* 0.9170/0.0576;
var eps_s_DH; stderr 0.01* 0.9170/0.9001;
var eps_s_EH; stderr 0.01* 0.9170/0.9468;
var eps_tau_offshoringH; stderr 0.00001;

var eps_tauIML_star; stderr sigma_pol;
var eps_s_DL_star; stderr sigma_pol;
var eps_s_EL_star; stderr sigma_pol;
var eps_tau_offshoringL_star; stderr sigma_pol;
end;

model_diagnostics;

steady(tolf = 1e-1);
check(qz_zero_threshold = 1e-10);
resid;
 
stoch_simul(order=1,nomoments,noprint,nograph,irf=500,periods=5000);

