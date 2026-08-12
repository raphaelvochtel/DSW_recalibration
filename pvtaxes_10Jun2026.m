function [stderr_out, ratio_trial] = pvtaxes_10Jun2026(oo_, eqlbm_ss0, par, Q, eps0, target)

% Sizes the revenue-generating policy shocks so that the present value of
% their effect on the government budget equals |target| as a share of world
% consumption -- the approach used in the EER companion paper
% (reference/pvtaxes_13Nov2025.m), applied here to the North (H-sector) and
% South (L-sector) tariff and subsidy shocks.
%
% Assumes oo_ comes from a Dynare run in which every shock in shock_tags had
% stderr = eps0 (a single trial size, e.g. par.sigma_pol). Because Dynare
% solves at first order, every variable's IRF is exactly proportional to
% shock size, so this one trial run is enough to solve, for each shock, the
% exact stderr hitting the target -- no second Dynare call is needed.
%
% Excludes eps_tau_offshoringH / eps_tau_offshoringL_star: iceberg
% offshoring costs never enter the government budget constraint (T_agg),
% so there is no PV-of-fiscal-effect target for them.
%
% Outputs:
%   stderr_out  - struct, one field per shock tag, the solved stderr
%   ratio_trial - struct, the PV-of-fiscal-effect/world-consumption ratio
%                 realised by the trial run (eps0), before rescaling

world_consn         = eqlbm_ss0.hh(13) + eqlbm_ss0.hh(14)*Q;

shock_tags          = {'eps_tauIMH', 'eps_s_DH', 'eps_s_EH', ...
                        'eps_tauIML_star', 'eps_s_DL_star', 'eps_s_EL_star'};
flow_var            = {'T_agg', 'T_agg', 'T_agg', 'T_agg_star', 'T_agg_star', 'T_agg_star'};
sdf_var             = {'SDF', 'SDF', 'SDF', 'SDF_star', 'SDF_star', 'SDF_star'};
gov_ss              = [eqlbm_ss0.gov(1), eqlbm_ss0.gov(1), eqlbm_ss0.gov(1), ...
                        eqlbm_ss0.gov(2), eqlbm_ss0.gov(2), eqlbm_ss0.gov(2)];

stderr_out          = struct();
ratio_trial         = struct();

for i = 1:numel(shock_tags)
    tag             = shock_tags{i};
    flow_irf        = oo_.irfs.([flow_var{i} '_' tag]);
    sdf_irf         = oo_.irfs.([sdf_var{i}  '_' tag]);

    npv_ratio       = @(eps) pv_ratio(eps, eps0, flow_irf, sdf_irf, gov_ss(i), par.beta, world_consn);

    r0                  = npv_ratio(eps0);
    ratio_trial.(tag)   = r0;

    % Match |target| in whichever direction this instrument's fiscal effect
    % naturally moves (tariffs raise revenue, subsidies cost revenue), so
    % the fzero seed below is always positive.
    target_i        = sign(r0) * abs(target);
    guess           = eps0 * target_i / r0;

    stderr_out.(tag) = fzero(@(eps) npv_ratio(eps) - target_i, guess);
end

end


function r = pv_ratio(eps, eps0, flow_irf, sdf_irf, gov_ss, beta, world_consn)
% Present value of the fiscal flow at shock size eps -- the trial IRF
% deviations rescaled by eps/eps0, plus the steady-state level, discounted
% by the model's own (shock-scaled) stochastic discount factor -- as a
% share of steady-state world consumption. Mirrors the loop structure of
% reference/pvtaxes_13Nov2025.m, generalised to an arbitrary shock size.
scale               = eps/eps0;
SDF_cum             = 1;
T                   = zeros(length(flow_irf), 1);
for t_ind = 1:length(flow_irf)
    T(t_ind, 1)     = (flow_irf(t_ind)*scale + gov_ss) * SDF_cum;
    SDF_cum         = (sdf_irf(t_ind)*scale + beta) * SDF_cum;
end
r                   = sum(T)/world_consn;
end
