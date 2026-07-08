% Computes the lifetime welfare gains from a policy change
function output = lifetime_welfare_Oct06_2024(solve, eqlbm_ss0, oo_, par, par_star)


for t=1:length(oo_.irfs.Q_eps_tauIMH)


    % NUMBER OF WORKERS
    % Steady state
    Hhss        = eqlbm_ss0.h_supplyH;
    Hlss        = eqlbm_ss0.l_supplyH;
    Lhss        = eqlbm_ss0.h_supplyL;
    Llss        = eqlbm_ss0.l_supplyL;
    Hhss_star   = eqlbm_ss0.h_supplyH_star;
    Hlss_star   = eqlbm_ss0.l_supplyH_star;
    Lhss_star   = eqlbm_ss0.h_supplyL_star;
    Llss_star   = eqlbm_ss0.l_supplyL_star;

    % Transition
    Hh_tauIMH(t)           = (Hhss + oo_.irfs.h_supplyH_eps_tauIMH(1,t));
    Hl_tauIMH(t)           = (Hlss + oo_.irfs.l_supplyH_eps_tauIMH(1,t));
    Lh_tauIMH(t)           = (Lhss + oo_.irfs.h_supplyL_eps_tauIMH(1,t));
    Ll_tauIMH(t)           = (Llss + oo_.irfs.l_supplyL_eps_tauIMH(1,t));
    Hh_star_tauIMH(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_tauIMH(1,t));
    Hl_star_tauIMH(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_tauIMH(1,t));
    Lh_star_tauIMH(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_tauIMH(1,t));
    Ll_star_tauIMH(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_tauIMH(1,t));

    Hh_tau_offshoringH(t)           = (Hhss + oo_.irfs.h_supplyH_eps_tau_offshoringH(1,t));
    Hl_tau_offshoringH(t)           = (Hlss + oo_.irfs.l_supplyH_eps_tau_offshoringH(1,t));
    Lh_tau_offshoringH(t)           = (Lhss + oo_.irfs.h_supplyL_eps_tau_offshoringH(1,t));
    Ll_tau_offshoringH(t)           = (Llss + oo_.irfs.l_supplyL_eps_tau_offshoringH(1,t));
    Hh_star_tau_offshoringH(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_tau_offshoringH(1,t));
    Hl_star_tau_offshoringH(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_tau_offshoringH(1,t));
    Lh_star_tau_offshoringH(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_tau_offshoringH(1,t));
    Ll_star_tau_offshoringH(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_tau_offshoringH(1,t));

    Hh_s_DH(t)           = (Hhss + oo_.irfs.h_supplyH_eps_s_DH(1,t));
    Hl_s_DH(t)           = (Hlss + oo_.irfs.l_supplyH_eps_s_DH(1,t));
    Lh_s_DH(t)           = (Lhss + oo_.irfs.h_supplyL_eps_s_DH(1,t));
    Ll_s_DH(t)           = (Llss + oo_.irfs.l_supplyL_eps_s_DH(1,t));
    Hh_star_s_DH(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_s_DH(1,t));
    Hl_star_s_DH(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_s_DH(1,t));
    Lh_star_s_DH(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_s_DH(1,t));
    Ll_star_s_DH(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_s_DH(1,t));

    Hh_s_EH(t)           = (Hhss + oo_.irfs.h_supplyH_eps_s_EH(1,t));
    Hl_s_EH(t)           = (Hlss + oo_.irfs.l_supplyH_eps_s_EH(1,t));
    Lh_s_EH(t)           = (Lhss + oo_.irfs.h_supplyL_eps_s_EH(1,t));
    Ll_s_EH(t)           = (Llss + oo_.irfs.l_supplyL_eps_s_EH(1,t));
    Hh_star_s_EH(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_s_EH(1,t));
    Hl_star_s_EH(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_s_EH(1,t));
    Lh_star_s_EH(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_s_EH(1,t));
    Ll_star_s_EH(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_s_EH(1,t));
   

    Hh_tauIMH_star(t)           = (Hhss + oo_.irfs.h_supplyH_eps_tauIML_star(1,t));
    Hl_tauIMH_star(t)           = (Hlss + oo_.irfs.l_supplyH_eps_tauIML_star(1,t));
    Lh_tauIMH_star(t)           = (Lhss + oo_.irfs.h_supplyL_eps_tauIML_star(1,t));
    Ll_tauIMH_star(t)           = (Llss + oo_.irfs.l_supplyL_eps_tauIML_star(1,t));
    Hh_star_tauIMH_star(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_tauIML_star(1,t));
    Hl_star_tauIMH_star(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_tauIML_star(1,t));
    Lh_star_tauIMH_star(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_tauIML_star(1,t));
    Ll_star_tauIMH_star(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_tauIML_star(1,t));

    Hh_tau_offshoringH_star(t)           = (Hhss + oo_.irfs.h_supplyH_eps_tau_offshoringL_star(1,t));
    Hl_tau_offshoringH_star(t)           = (Hlss + oo_.irfs.l_supplyH_eps_tau_offshoringL_star(1,t));
    Lh_tau_offshoringH_star(t)           = (Lhss + oo_.irfs.h_supplyL_eps_tau_offshoringL_star(1,t));
    Ll_tau_offshoringH_star(t)           = (Llss + oo_.irfs.l_supplyL_eps_tau_offshoringL_star(1,t));
    Hh_star_tau_offshoringH_star(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_tau_offshoringL_star(1,t));
    Hl_star_tau_offshoringH_star(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_tau_offshoringL_star(1,t));
    Lh_star_tau_offshoringH_star(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_tau_offshoringL_star(1,t));
    Ll_star_tau_offshoringH_star(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_tau_offshoringL_star(1,t));

    Hh_s_DH_star(t)           = (Hhss + oo_.irfs.h_supplyH_eps_s_DL_star(1,t));
    Hl_s_DH_star(t)           = (Hlss + oo_.irfs.l_supplyH_eps_s_DL_star(1,t));
    Lh_s_DH_star(t)           = (Lhss + oo_.irfs.h_supplyL_eps_s_DL_star(1,t));
    Ll_s_DH_star(t)           = (Llss + oo_.irfs.l_supplyL_eps_s_DL_star(1,t));
    Hh_star_s_DH_star(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_s_DL_star(1,t));
    Hl_star_s_DH_star(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_s_DL_star(1,t));
    Lh_star_s_DH_star(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_s_DL_star(1,t));
    Ll_star_s_DH_star(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_s_DL_star(1,t));

    Hh_s_EH_star(t)           = (Hhss + oo_.irfs.h_supplyH_eps_s_EL_star(1,t));
    Hl_s_EH_star(t)           = (Hlss + oo_.irfs.l_supplyH_eps_s_EL_star(1,t));
    Lh_s_EH_star(t)           = (Lhss + oo_.irfs.h_supplyL_eps_s_EL_star(1,t));
    Ll_s_EH_star(t)           = (Llss + oo_.irfs.l_supplyL_eps_s_EL_star(1,t));
    Hh_star_s_EH_star(t)      = (Hhss_star + oo_.irfs.h_supplyH_star_eps_s_EL_star(1,t));
    Hl_star_s_EH_star(t)      = (Hlss_star + oo_.irfs.l_supplyH_star_eps_s_EL_star(1,t));
    Lh_star_s_EH_star(t)      = (Lhss_star + oo_.irfs.h_supplyL_star_eps_s_EL_star(1,t));
    Ll_star_s_EH_star(t)      = (Llss_star + oo_.irfs.l_supplyL_star_eps_s_EL_star(1,t));




    % INSTANTANEOUS/PERIOD UTILITY
    % Steady state
    w_ss(1:4,t)         = [Hhss; Hlss; Lhss; Llss].*log(eqlbm_ss0.hh(1:4)')*par.beta^(t-1);
    w_star_ss(1:4,t)    = [Hhss_star; Hlss_star; Lhss_star; Llss_star].*log(eqlbm_ss0.hh(5:8)')*par.beta^(t-1);

    % Discount factor * 1 per period (used below in the derivations)
    disc(1:4,t)         = [Hhss; Hlss; Lhss; Llss].*par.beta^(t-1);
    disc_star(1:4,t)    = [Hhss_star; Hlss_star; Lhss_star; Llss_star].*par.beta^(t-1);


    % Transition (must add the level to the deviation)
    w_tauIMH(1,t)       = Hh_tauIMH(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_tauIMH(1,t))*par.beta^(t-1);
    w_tauIMH(2,t)       = Hl_tauIMH(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_tauIMH(1,t))*par.beta^(t-1);
    w_tauIMH(3,t)       = Lh_tauIMH(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_tauIMH(1,t))*par.beta^(t-1);
    w_tauIMH(4,t)       = Ll_tauIMH(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_tauIMH(1,t))*par.beta^(t-1);
    w_star_tauIMH(1,t)  = Hh_star_tauIMH(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_tauIMH(1,t))*par.beta^(t-1);
    w_star_tauIMH(2,t)  = Hl_star_tauIMH(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_tauIMH(1,t))*par.beta^(t-1);
    w_star_tauIMH(3,t)  = Lh_star_tauIMH(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_tauIMH(1,t))*par.beta^(t-1);
    w_star_tauIMH(4,t)  = Ll_star_tauIMH(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_tauIMH(1,t))*par.beta^(t-1);

    w_tau_offshoringH(1,t)       = Hh_tau_offshoringH(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_tau_offshoringH(2,t)       = Hl_tau_offshoringH(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_tau_offshoringH(3,t)       = Lh_tau_offshoringH(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_tau_offshoringH(4,t)       = Ll_tau_offshoringH(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH(1,t)  = Hh_star_tau_offshoringH(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH(2,t)  = Hl_star_tau_offshoringH(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH(3,t)  = Lh_star_tau_offshoringH(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_tau_offshoringH(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH(4,t)  = Ll_star_tau_offshoringH(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_tau_offshoringH(1,t))*par.beta^(t-1);

    w_s_EH(1,t)       = Hh_s_EH(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_s_EH(1,t))*par.beta^(t-1);
    w_s_EH(2,t)       = Hl_s_EH(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_s_EH(1,t))*par.beta^(t-1);
    w_s_EH(3,t)       = Lh_s_EH(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_s_EH(1,t))*par.beta^(t-1);
    w_s_EH(4,t)       = Ll_s_EH(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_s_EH(1,t))*par.beta^(t-1);
    w_star_s_EH(1,t)  = Hh_star_s_EH(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_s_EH(1,t))*par.beta^(t-1);
    w_star_s_EH(2,t)  = Hl_star_s_EH(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_s_EH(1,t))*par.beta^(t-1);
    w_star_s_EH(3,t)  = Lh_star_s_EH(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_s_EH(1,t))*par.beta^(t-1);
    w_star_s_EH(4,t)  = Ll_star_s_EH(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_s_EH(1,t))*par.beta^(t-1);

    w_s_DH(1,t)       = Hh_s_DH(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_s_DH(1,t))*par.beta^(t-1);
    w_s_DH(2,t)       = Hl_s_DH(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_s_DH(1,t))*par.beta^(t-1);
    w_s_DH(3,t)       = Lh_s_DH(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_s_DH(1,t))*par.beta^(t-1);
    w_s_DH(4,t)       = Ll_s_DH(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_s_DH(1,t))*par.beta^(t-1);
    w_star_s_DH(1,t)  = Hh_star_s_DH(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_s_DH(1,t))*par.beta^(t-1);
    w_star_s_DH(2,t)  = Hl_star_s_DH(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_s_DH(1,t))*par.beta^(t-1);
    w_star_s_DH(3,t)  = Lh_star_s_DH(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_s_DH(1,t))*par.beta^(t-1);
    w_star_s_DH(4,t)  = Ll_star_s_DH(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_s_DH(1,t))*par.beta^(t-1);



    w_tauIMH_star(1,t)       = Hh_tauIMH_star(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_tauIMH_star(2,t)       = Hl_tauIMH_star(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_tauIMH_star(3,t)       = Lh_tauIMH_star(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_tauIMH_star(4,t)       = Ll_tauIMH_star(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_star_tauIMH_star(1,t)  = Hh_star_tauIMH_star(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_star_tauIMH_star(2,t)  = Hl_star_tauIMH_star(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_star_tauIMH_star(3,t)  = Lh_star_tauIMH_star(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_tauIML_star(1,t))*par.beta^(t-1);
    w_star_tauIMH_star(4,t)  = Ll_star_tauIMH_star(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_tauIML_star(1,t))*par.beta^(t-1);

    w_tau_offshoringH_star(1,t)       = Hh_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_tau_offshoringH_star(2,t)       = Hl_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_tau_offshoringH_star(3,t)       = Lh_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_tau_offshoringH_star(4,t)       = Ll_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH_star(1,t)  = Hh_star_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH_star(2,t)  = Hl_star_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH_star(3,t)  = Lh_star_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);
    w_star_tau_offshoringH_star(4,t)  = Ll_star_tau_offshoringH_star(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_tau_offshoringL_star(1,t))*par.beta^(t-1);


    w_s_EH_star(1,t)       = Hh_s_EH_star(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_s_EH_star(2,t)       = Hl_s_EH_star(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_s_EH_star(3,t)       = Lh_s_EH_star(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_s_EH_star(4,t)       = Ll_s_EH_star(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_star_s_EH_star(1,t)  = Hh_star_s_EH_star(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_star_s_EH_star(2,t)  = Hl_star_s_EH_star(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_star_s_EH_star(3,t)  = Lh_star_s_EH_star(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_s_EL_star(1,t))*par.beta^(t-1);
    w_star_s_EH_star(4,t)  = Ll_star_s_EH_star(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_s_EL_star(1,t))*par.beta^(t-1);


    w_s_DH_star(1,t)       = Hh_s_DH_star(t)*log(eqlbm_ss0.hh(1) + oo_.irfs.CHh_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_s_DH_star(2,t)       = Hl_s_DH_star(t)*log(eqlbm_ss0.hh(2) + oo_.irfs.CHl_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_s_DH_star(3,t)       = Lh_s_DH_star(t)*log(eqlbm_ss0.hh(3) + oo_.irfs.CLh_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_s_DH_star(4,t)       = Ll_s_DH_star(t)*log(eqlbm_ss0.hh(4) + oo_.irfs.CLl_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_star_s_DH_star(1,t)  = Hh_star_s_DH_star(t)*log(eqlbm_ss0.hh(5) + oo_.irfs.CHh_star_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_star_s_DH_star(2,t)  = Hl_star_s_DH_star(t)*log(eqlbm_ss0.hh(6) + oo_.irfs.CHl_star_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_star_s_DH_star(3,t)  = Lh_star_s_DH_star(t)*log(eqlbm_ss0.hh(7) + oo_.irfs.CLh_star_eps_s_DL_star(1,t))*par.beta^(t-1);
    w_star_s_DH_star(4,t)  = Ll_star_s_DH_star(t)*log(eqlbm_ss0.hh(8) + oo_.irfs.CLl_star_eps_s_DL_star(1,t))*par.beta^(t-1);







    % CUMULATIVE WELFARE
    % Steady state
    wcu_ss(1,t)         = sum(w_ss(1,1:t));
    wcu_ss(2,t)         = sum(w_ss(2,1:t));
    wcu_ss(3,t)         = sum(w_ss(3,1:t));
    wcu_ss(4,t)         = sum(w_ss(4,1:t));
    wcu_ss_star(1,t)    = sum(w_star_ss(1,1:t));
    wcu_ss_star(2,t)    = sum(w_star_ss(2,1:t));
    wcu_ss_star(3,t)    = sum(w_star_ss(3,1:t));
    wcu_ss_star(4,t)    = sum(w_star_ss(4,1:t));

    % Transition
    wcu_tauIMH(1,t)             = sum(w_tauIMH(1,1:t));
    wcu_tauIMH(2,t)             = sum(w_tauIMH(2,1:t));
    wcu_tauIMH(3,t)             = sum(w_tauIMH(3,1:t));
    wcu_tauIMH(4,t)             = sum(w_tauIMH(4,1:t));
    wcu_star_tauIMH(1,t)        = sum(w_star_tauIMH(1,1:t));
    wcu_star_tauIMH(2,t)        = sum(w_star_tauIMH(2,1:t));
    wcu_star_tauIMH(3,t)        = sum(w_star_tauIMH(3,1:t));
    wcu_star_tauIMH(4,t)        = sum(w_star_tauIMH(4,1:t));

    wcu_tau_offshoringH(1,t)             = sum(w_tau_offshoringH(1,1:t));
    wcu_tau_offshoringH(2,t)             = sum(w_tau_offshoringH(2,1:t));
    wcu_tau_offshoringH(3,t)             = sum(w_tau_offshoringH(3,1:t));
    wcu_tau_offshoringH(4,t)             = sum(w_tau_offshoringH(4,1:t));
    wcu_star_tau_offshoringH(1,t)        = sum(w_star_tau_offshoringH(1,1:t));
    wcu_star_tau_offshoringH(2,t)        = sum(w_star_tau_offshoringH(2,1:t));
    wcu_star_tau_offshoringH(3,t)        = sum(w_star_tau_offshoringH(3,1:t));
    wcu_star_tau_offshoringH(4,t)        = sum(w_star_tau_offshoringH(4,1:t));

    wcu_s_EH(1,t)             = sum(w_s_EH(1,1:t));
    wcu_s_EH(2,t)             = sum(w_s_EH(2,1:t));
    wcu_s_EH(3,t)             = sum(w_s_EH(3,1:t));
    wcu_s_EH(4,t)             = sum(w_s_EH(4,1:t));
    wcu_star_s_EH(1,t)        = sum(w_star_s_EH(1,1:t));
    wcu_star_s_EH(2,t)        = sum(w_star_s_EH(2,1:t));
    wcu_star_s_EH(3,t)        = sum(w_star_s_EH(3,1:t));
    wcu_star_s_EH(4,t)        = sum(w_star_s_EH(4,1:t));

    wcu_s_DH(1,t)             = sum(w_s_DH(1,1:t));
    wcu_s_DH(2,t)             = sum(w_s_DH(2,1:t));
    wcu_s_DH(3,t)             = sum(w_s_DH(3,1:t));
    wcu_s_DH(4,t)             = sum(w_s_DH(4,1:t));
    wcu_star_s_DH(1,t)        = sum(w_star_s_DH(1,1:t));
    wcu_star_s_DH(2,t)        = sum(w_star_s_DH(2,1:t));
    wcu_star_s_DH(3,t)        = sum(w_star_s_DH(3,1:t));
    wcu_star_s_DH(4,t)        = sum(w_star_s_DH(4,1:t));




    wcu_tauIMH_star(1,t)             = sum(w_tauIMH_star(1,1:t));
    wcu_tauIMH_star(2,t)             = sum(w_tauIMH_star(2,1:t));
    wcu_tauIMH_star(3,t)             = sum(w_tauIMH_star(3,1:t));
    wcu_tauIMH_star(4,t)             = sum(w_tauIMH_star(4,1:t));
    wcu_star_tauIMH_star(1,t)        = sum(w_star_tauIMH_star(1,1:t));
    wcu_star_tauIMH_star(2,t)        = sum(w_star_tauIMH_star(2,1:t));
    wcu_star_tauIMH_star(3,t)        = sum(w_star_tauIMH_star(3,1:t));
    wcu_star_tauIMH_star(4,t)        = sum(w_star_tauIMH_star(4,1:t));

    wcu_tau_offshoringH_star(1,t)             = sum(w_tau_offshoringH_star(1,1:t));
    wcu_tau_offshoringH_star(2,t)             = sum(w_tau_offshoringH_star(2,1:t));
    wcu_tau_offshoringH_star(3,t)             = sum(w_tau_offshoringH_star(3,1:t));
    wcu_tau_offshoringH_star(4,t)             = sum(w_tau_offshoringH_star(4,1:t));
    wcu_star_tau_offshoringH_star(1,t)        = sum(w_star_tau_offshoringH_star(1,1:t));
    wcu_star_tau_offshoringH_star(2,t)        = sum(w_star_tau_offshoringH_star(2,1:t));
    wcu_star_tau_offshoringH_star(3,t)        = sum(w_star_tau_offshoringH_star(3,1:t));
    wcu_star_tau_offshoringH_star(4,t)        = sum(w_star_tau_offshoringH_star(4,1:t));

    wcu_s_EH_star(1,t)             = sum(w_s_EH_star(1,1:t));
    wcu_s_EH_star(2,t)             = sum(w_s_EH_star(2,1:t));
    wcu_s_EH_star(3,t)             = sum(w_s_EH_star(3,1:t));
    wcu_s_EH_star(4,t)             = sum(w_s_EH_star(4,1:t));
    wcu_star_s_EH_star(1,t)        = sum(w_star_s_EH_star(1,1:t));
    wcu_star_s_EH_star(2,t)        = sum(w_star_s_EH_star(2,1:t));
    wcu_star_s_EH_star(3,t)        = sum(w_star_s_EH_star(3,1:t));
    wcu_star_s_EH_star(4,t)        = sum(w_star_s_EH_star(4,1:t));

    wcu_s_DH_star(1,t)             = sum(w_s_DH_star(1,1:t));
    wcu_s_DH_star(2,t)             = sum(w_s_DH_star(2,1:t));
    wcu_s_DH_star(3,t)             = sum(w_s_DH_star(3,1:t));
    wcu_s_DH_star(4,t)             = sum(w_s_DH_star(4,1:t));
    wcu_star_s_DH_star(1,t)        = sum(w_star_s_DH_star(1,1:t));
    wcu_star_s_DH_star(2,t)        = sum(w_star_s_DH_star(2,1:t));
    wcu_star_s_DH_star(3,t)        = sum(w_star_s_DH_star(3,1:t));
    wcu_star_s_DH_star(4,t)        = sum(w_star_s_DH_star(4,1:t));



    % Discounting
    disc_s(1,t)                 = sum(disc(1,1:t));
    disc_s(2,t)                 = sum(disc(2,1:t));
    disc_s(3,t)                 = sum(disc(3,1:t));
    disc_s(4,t)                 = sum(disc(4,1:t));

    disc_star_s(1,t)            = sum(disc_star(1,1:t));
    disc_star_s(2,t)            = sum(disc_star(2,1:t));
    disc_star_s(3,t)            = sum(disc_star(3,1:t));
    disc_star_s(4,t)            = sum(disc_star(4,1:t));

    
    % CONSUMPTION EQUIVALENTS 
    % As a percentage of the initial ss consumption
    cev_tauIMH(1,t)                     = (exp((wcu_tauIMH(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_tauIMH(2,t)                     = (exp((wcu_tauIMH(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_tauIMH(3,t)                     = (exp((wcu_tauIMH(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_tauIMH(4,t)                     = (exp((wcu_tauIMH(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_tauIMH(1,t)                = (exp((wcu_star_tauIMH(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_tauIMH(2,t)                = (exp((wcu_star_tauIMH(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_tauIMH(3,t)                = (exp((wcu_star_tauIMH(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_tauIMH(4,t)                = (exp((wcu_star_tauIMH(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;

    cev_tau_offshoringH(1,t)                     = (exp((wcu_tau_offshoringH(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_tau_offshoringH(2,t)                     = (exp((wcu_tau_offshoringH(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_tau_offshoringH(3,t)                     = (exp((wcu_tau_offshoringH(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_tau_offshoringH(4,t)                     = (exp((wcu_tau_offshoringH(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_tau_offshoringH(1,t)                = (exp((wcu_star_tau_offshoringH(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_tau_offshoringH(2,t)                = (exp((wcu_star_tau_offshoringH(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_tau_offshoringH(3,t)                = (exp((wcu_star_tau_offshoringH(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_tau_offshoringH(4,t)                = (exp((wcu_star_tau_offshoringH(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;
    
    cev_s_EH(1,t)                     = (exp((wcu_s_EH(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_s_EH(2,t)                     = (exp((wcu_s_EH(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_s_EH(3,t)                     = (exp((wcu_s_EH(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_s_EH(4,t)                     = (exp((wcu_s_EH(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_s_EH(1,t)                = (exp((wcu_star_s_EH(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_s_EH(2,t)                = (exp((wcu_star_s_EH(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_s_EH(3,t)                = (exp((wcu_star_s_EH(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_s_EH(4,t)                = (exp((wcu_star_s_EH(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;

    cev_s_DH(1,t)                     = (exp((wcu_s_DH(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_s_DH(2,t)                     = (exp((wcu_s_DH(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_s_DH(3,t)                     = (exp((wcu_s_DH(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_s_DH(4,t)                     = (exp((wcu_s_DH(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_s_DH(1,t)                = (exp((wcu_star_s_DH(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_s_DH(2,t)                = (exp((wcu_star_s_DH(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_s_DH(3,t)                = (exp((wcu_star_s_DH(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_s_DH(4,t)                = (exp((wcu_star_s_DH(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;



    cev_tauIMH_star(1,t)                     = (exp((wcu_tauIMH_star(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_tauIMH_star(2,t)                     = (exp((wcu_tauIMH_star(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_tauIMH_star(3,t)                     = (exp((wcu_tauIMH_star(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_tauIMH_star(4,t)                     = (exp((wcu_tauIMH_star(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_tauIMH_star(1,t)                = (exp((wcu_star_tauIMH_star(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_tauIMH_star(2,t)                = (exp((wcu_star_tauIMH_star(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_tauIMH_star(3,t)                = (exp((wcu_star_tauIMH_star(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_tauIMH_star(4,t)                = (exp((wcu_star_tauIMH_star(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;

    cev_tau_offshoringH_star(1,t)                     = (exp((wcu_tau_offshoringH_star(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_tau_offshoringH_star(2,t)                     = (exp((wcu_tau_offshoringH_star(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_tau_offshoringH_star(3,t)                     = (exp((wcu_tau_offshoringH_star(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_tau_offshoringH_star(4,t)                     = (exp((wcu_tau_offshoringH_star(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_tau_offshoringH_star(1,t)                = (exp((wcu_star_tau_offshoringH_star(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_tau_offshoringH_star(2,t)                = (exp((wcu_star_tau_offshoringH_star(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_tau_offshoringH_star(3,t)                = (exp((wcu_star_tau_offshoringH_star(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_tau_offshoringH_star(4,t)                = (exp((wcu_star_tau_offshoringH_star(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;

    cev_s_EH_star(1,t)                     = (exp((wcu_s_EH_star(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_s_EH_star(2,t)                     = (exp((wcu_s_EH_star(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_s_EH_star(3,t)                     = (exp((wcu_s_EH_star(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_s_EH_star(4,t)                     = (exp((wcu_s_EH_star(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_s_EH_star(1,t)                = (exp((wcu_star_s_EH_star(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_s_EH_star(2,t)                = (exp((wcu_star_s_EH_star(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_s_EH_star(3,t)                = (exp((wcu_star_s_EH_star(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_s_EH_star(4,t)                = (exp((wcu_star_s_EH_star(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;

    cev_s_DH_star(1,t)                     = (exp((wcu_s_DH_star(1,t) - wcu_ss(1,t))/disc_s(1,t)) - 1)*100;
    cev_s_DH_star(2,t)                     = (exp((wcu_s_DH_star(2,t) - wcu_ss(2,t))/disc_s(2,t)) - 1)*100;
    cev_s_DH_star(3,t)                     = (exp((wcu_s_DH_star(3,t) - wcu_ss(3,t))/disc_s(3,t)) - 1)*100;
    cev_s_DH_star(4,t)                     = (exp((wcu_s_DH_star(4,t) - wcu_ss(4,t))/disc_s(4,t)) - 1)*100;
    cev_star_s_DH_star(1,t)                = (exp((wcu_star_s_DH_star(1,t) - wcu_ss_star(1,t))/disc_star_s(1,t)) - 1)*100;
    cev_star_s_DH_star(2,t)                = (exp((wcu_star_s_DH_star(2,t) - wcu_ss_star(2,t))/disc_star_s(2,t)) - 1)*100;
    cev_star_s_DH_star(3,t)                = (exp((wcu_star_s_DH_star(3,t) - wcu_ss_star(3,t))/disc_star_s(3,t)) - 1)*100;
    cev_star_s_DH_star(4,t)                = (exp((wcu_star_s_DH_star(4,t) - wcu_ss_star(4,t))/disc_star_s(4,t)) - 1)*100;









end

make_it_tight   = true;
subplot         = @(m,n,p) subtightplot (m, n, p, [0.07 0.07], [0.08 0.08], [0.04 0.04]);
if ~make_it_tight,  clear subplot;  end
axis_tight      = 1;


% North tauIM
figure(1)
subplot(2,4,1)
plot(cev_tauIMH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_tauIMH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tauIMH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tauIMH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}')
title('$\tau_{IM}$','FontSize',9,'Interpreter','latex')

subplot(2,4,2)
plot(cev_tau_offshoringH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_tau_offshoringH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tau_offshoringH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tau_offshoringH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}')
title('$\tau_{V}$','FontSize',9,'Interpreter','latex')

subplot(2,4,3)
plot(cev_s_DH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_s_DH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_DH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_DH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}')
title('$s_{D}$','FontSize',9,'Interpreter','latex')

subplot(2,4,4)
plot(cev_s_EH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_s_EH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_EH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_EH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}', 'location', 'SouthEast')
title('$s_{E}$','FontSize',9,'Interpreter','latex')




subplot(2,4,5)
plot(cev_tauIMH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_tauIMH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tauIMH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tauIMH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}')
title('$\tau_{IM}^{*}$','FontSize',9,'Interpreter','latex')
 
subplot(2,4,6)
plot(cev_tau_offshoringH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_tau_offshoringH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tau_offshoringH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_tau_offshoringH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}')
title('$\tau_{V}^{*}$','FontSize',9,'Interpreter','latex')

subplot(2,4,7)
plot(cev_s_DH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_s_DH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_DH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_DH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}')
title('$s_{D}^{*}$','FontSize',9,'Interpreter','latex')


subplot(2,4,8)
plot(cev_s_EH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_s_EH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_EH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_s_EH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh}', 'U^{Hl}', 'U^{Lh}', 'U^{Ll}', 'location', 'SouthEast')
title('$s_{E}^{*}$','FontSize',9,'Interpreter','latex')

legend('$\nu^{Hh}$', '$\nu^{Hl}$', '$\nu^{Lh}$','$\nu^{Ll}$','Interpreter','latex','position',[0.49 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
saveas(figure(1), [pwd '/Figures/UNorth.eps'],'epsc');














figure(2)
subplot(2,4,1)
plot(cev_star_tauIMH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_tauIMH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tauIMH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tauIMH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$\tau_{IM}$','FontSize',9,'Interpreter','latex')

subplot(2,4,2)
plot(cev_star_tau_offshoringH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_tau_offshoringH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tau_offshoringH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tau_offshoringH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$\tau_{V}$','FontSize',9,'Interpreter','latex')

subplot(2,4,3)
plot(cev_star_s_DH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_s_DH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_DH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_DH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$s_{D}$','FontSize',9,'Interpreter','latex')

subplot(2,4,4)
plot(cev_star_s_EH(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_s_EH(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_EH(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_EH(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$s_{E}$','FontSize',9,'Interpreter','latex')



subplot(2,4,5)
plot(cev_star_tauIMH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_tauIMH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tauIMH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tauIMH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$\tau_{IM}^{*}$','FontSize',9,'Interpreter','latex')

subplot(2,4,6)
plot(cev_star_tau_offshoringH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_tau_offshoringH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tau_offshoringH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_tau_offshoringH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$\tau_{V}^{*}$','FontSize',9,'Interpreter','latex')

subplot(2,4,7)
plot(cev_star_s_DH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_s_DH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_DH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_DH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$s_{D}^{*}$','FontSize',9,'Interpreter','latex')

subplot(2,4,8)
plot(cev_star_s_EH_star(1,1:40), '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:9:40);
hold on
plot(cev_star_s_EH_star(2,1:40), '-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_EH_star(3,1:40), '-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:9:40);
plot(cev_star_s_EH_star(4,1:40), '-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:9:40);
%legend('U^{Hh*}', 'U^{Hl*}', 'U^{Lh*}', 'U^{Ll*}')
title('$s_{E}^{*}$','FontSize',9,'Interpreter','latex')

legend('$\nu^{Hh*}$', '$\nu^{Hl*}$', '$\nu^{Lh*}$','$\nu^{Ll*}$','Interpreter','latex','position',[0.49 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
saveas(figure(2), [pwd '/Figures/USouth.eps'],'epsc');








end




