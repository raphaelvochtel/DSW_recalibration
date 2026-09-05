% Early June 2024
% Two sector model
% This script sets parameters and calls functions that solve for the steady
% state

clear; clc;

cd(fileparts(mfilename('fullpath')));

% Parameters (declare for N and S separately)
% Common to N and S
par.beta            = 0.99;             %discount factor
par.r               = 1/par.beta - 1;   %interest rate on bonds
par.eta             = 0.5;              %adjustment cost of bonds
par.s               = 0.067;            %retirement rate (Philadelphia Fed job-to-job transition data)
par.delta           = 0.025;            %exogenous death rate
par.theta           = 3.8;              %elasticity of substitution
par.k               = 4.2;              %Pareto shape parameter (alternative paper)
par.z_min           = 1;                %Pareto minimum parameter
par.gamma           = 1;                %CRRA parameter MUST BE ONE!!!
par.pers            = 0.9;              %Persistence of the TFP shock
par.pers_pol        = 0.56;             %Persistence of policy shock
par.sigma_Z         = 0.01;             %Standard deviation of the TFP shock
par.sigma_pol       = 0.01;              %Standard deviation of the tariff policy shock
par.sigmah          = 1;                %Standard deviation of skilled worker's idiosyncratic sector preferences
par.sigmal          = par.sigmah;       %Standard deviation of low-skilled worker's idiosyncratic sector preferences
par_star            = par;

% Targets in the data
tar.trade_share     = 0.20;             %US trade share
tar.fracX           = 0.35;             %fraction of exporters (Bernard et al. 2018 Table 3)
tar.fracV           = 0.20;             %fraction of offshorers (Bernard et al. 2018 Table 3)
tar.Xint            = 0.17;             %export intensity (Bernard et al. 2018 Table 1 col. 3)
tar.comp_adv        = 0.305;            %comparative advantage measure (Josh's estimation)

% North skill premia (sector-specific, Josh's estimation)
% South wages derived endogenously from offshoring arbitrage in ss_equilibrium
wage.PH      = 1.618;   % skill premium North H sector
wage.PL      = 1.792;   % skill premium North L sector


% Steady State Aggregate Productivity (both normalized to 1 (asymmetry captured by wages and sector parameters)
par.Z                       = 1;
par_star.Z                  = 1;

% Setup sector specific parameters; sector is upper case, skill is lower case
% H sector North
parH.alpha          = 0.731;            %high-skill cost share (Josh's estimation)
parH.tau            = 1.0;              %iceberg trading cost (placeholder)
parH.tauIM          = 0;                %policy inst: import tarif on H products coming from South
parH.tau_offshoring = 1;                %policy inst: iceberg cost specific to offshoring
parH.s_D            = 0;                %policy inst: domestic production subsidy
parH.s_E            = 0;                %policy inst: entry subsidy
parH.fE             = 0;                %fixed cost of entry
parH.fV             = 0.0000001;        %fixed cost of offshoring (placeholder)
parH.fX             = 0.0000001;        %fixed cost of exporting (placeholder)
parH.gamma          = 0.6;              %expenditure share

% L sector North
parL = parH;
parL.alpha = 0.269;
parL.gamma = 1-parH.gamma;

% H sector South
parH_star           = parH;

% L sector South
parL_star           = parL;


% check Pareto distr finite mean
if (par.k <= par.theta -1)
    keyboard
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CALIBRATE STEADY STATE TO MATCH TARGETS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cal_ind                     = 1; %without offshoring (2) or with offshoring (1)


% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEP 1: GRID SEARCH (-> results saved in grid_search_results.mat)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% cal                 = zeros(13,1);
% cal(1,1)            = 1e-7;             % fV: L
% cal(2,1)            = 1e-9;             % fV: H
% cal(3,1)            = 6e-9;             % fV: L*
% cal(4,1)            = 6e-9;             % fV: H*
% cal(5,1)            = 2e-7;             % fX: L
% cal(6,1)            = 1e-8;             % fX: H
% cal(7,1)            = 1e-5;             % fX: L*
% cal(8,1)            = 1e-8;             % fX: H*
% cal(9,1)            = 2.5;              % tau: L
% cal(10,1)           = 2.0;              % tau: H
% cal(11,1)           = 1.2;              % tau: L*
% cal(12,1)           = 2.0;              % tau: H*
% cal(13,1)           = 0.9;              % psiL_star
%
% [best_cal, grid_results] = grid_search_10Jun2026(par, parL, parH, parL_star, parH_star, par_star, tar, cal, cal_ind, wage);
% cal = best_cal;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEP 2: Block-coordinate calibration from top N grid search points (-> results saved in block_calibrate_results.mat)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('grid_search_results.mat', 'obj_values', 'all_params');
% [~, sort_idx] = sort(obj_values);
% N_starts = 100;
%
% best_resnorm = inf;
% best_params  = [];
% best_conj    = [1 1 1 1 1];
% all_results  = struct('start_idx', {}, 'grid_obj', {}, 'final_resnorm', {}, ...
%                       'params_out', {}, 'history', {});
%
% fprintf('=== MULTI-START BLOCK-COORDINATE CALIBRATION ===\n');
% fprintf('Running from top %d grid search points\n\n', N_starts);
%
% tic_total = tic;
% for s = 1:N_starts
%     idx = sort_idx(s);
%     cal = all_params(idx, :)';
%
%     fprintf('\n########## START %d/%d (grid obj=%.4e) ##########\n', s, N_starts, obj_values(idx));
%     fprintf('  fV=[%.1e %.1e %.1e %.1e] fX=[%.1e %.1e %.1e %.1e]\n', cal(1:8));
%     fprintf('  tau=[%.3f %.3f %.3f %.3f] psiL*=%.3f\n', cal(9:13));
%
%     [p_out, hist] = block_calibrate_10Jun2026( ...
%         par, parL, parH, parL_star, parH_star, par_star, tar, cal, cal_ind, wage);
%
%     if ~isempty(hist.resnorm)
%         final_rn = hist.resnorm(end);
%     else
%         final_rn = inf;
%     end
%     all_results(s).start_idx     = idx;
%     all_results(s).grid_obj      = obj_values(idx);
%     all_results(s).final_resnorm = final_rn;
%     all_results(s).params_out    = p_out;
%     all_results(s).history       = hist;
%
%     if final_rn < best_resnorm
%         best_resnorm = final_rn;
%         best_params  = p_out;
%         best_conj    = hist.best_conj;
%         fprintf('  *** NEW OVERALL BEST: resnorm = %.6e ***\n', final_rn);
%     end
%
%     save('block_calibrate_results.mat', 'best_resnorm', 'best_params', 'best_conj', 'all_results');
% end
% t_total = toc(tic_total);
%
% params_out = best_params;
% save('block_calibrate_results.mat', 'params_out', 'best_resnorm', 'best_conj', 'all_results');
%
% fprintf('\n\n============================================================\n');
% fprintf('MULTI-START SUMMARY (%d starts, %.0fs total)\n', N_starts, t_total);
% fprintf('============================================================\n');
% fprintf('  %5s %12s %12s\n', 'Start', 'Grid obj', 'Final resnorm');
% for s = 1:N_starts
%     marker = '';
%     if all_results(s).final_resnorm == best_resnorm, marker = ' ***'; end
%     fprintf('  %5d %12.4e %12.6e%s\n', s, all_results(s).grid_obj, all_results(s).final_resnorm, marker);
% end
% fprintf('\nBest resnorm: %.6e\n', best_resnorm);

% =========================================================
% Change only this to switch which calibration run to display/use below
% =========================================================
% results_suffix = '_eps1pc';    % eps=0.01 run
results_suffix   = '_eps10pc';   % eps=0.1 run
% =========================================================

% Display overview
load(['block_calibrate_results', results_suffix, '.mat']);

rn = [all_results.final_resnorm];
[rn_sorted, idx] = sort(rn);
N_show = min(8, length(idx));

% =========================================================
% Change only this number (1–8) to select the candidate
cand_idx = 1;
% =========================================================
params_out = all_results(idx(cand_idx)).params_out;
best_conj  = all_results(idx(cand_idx)).history.best_conj;

targets = [tar.fracV*ones(4,1); tar.fracX*ones(4,1); tar.Xint*ones(4,1); tar.comp_adv];

% Header
fprintf('\n%4s %4s %10s', 'Rank', '#', 'Resnorm');
fprintf('   %7s %7s %7s %7s', 'fracVL', 'fracVH', 'frcVL*', 'frcVH*');
fprintf('   %7s %7s %7s %7s', 'fracXL', 'fracXH', 'frcXL*', 'frcXH*');
fprintf('   %7s %7s %7s %7s %7s', 'XintL', 'XintH', 'XntL*', 'XntH*', 'cmpAdv');
fprintf('   %9s %9s %9s %9s', 'fV_L', 'fV_H', 'fV_L*', 'fV_H*');
fprintf('   %9s %9s %9s %9s', 'fX_L', 'fX_H', 'fX_L*', 'fX_H*');
fprintf('   %7s %7s %7s %7s %7s\n', 'tau_L', 'tau_H', 'tau_L*', 'tau_H*', 'psiL*');

% Target row
fprintf('%4s %4s %10s', '', '', 'TARGET');
fprintf('   %7.3f %7.3f %7.3f %7.3f', tar.fracV, tar.fracV, tar.fracV, tar.fracV);
fprintf('   %7.3f %7.3f %7.3f %7.3f', tar.fracX, tar.fracX, tar.fracX, tar.fracX);
fprintf('   %7.3f %7.3f %7.3f %7.3f %7.3f', tar.Xint, tar.Xint, tar.Xint, tar.Xint, tar.comp_adv);
fprintf('   %9s %9s %9s %9s', '', '', '', '');
fprintf('   %9s %9s %9s %9s', '', '', '', '');
fprintf('   %7s %7s %7s %7s %7s\n', '', '', '', '', '');

fprintf('%s\n', repmat('-', 1, 280));

for r = 1:N_show
    s = idx(r);
    p = all_results(s).params_out;
    h = all_results(s).history;
    if isempty(h.residuals), continue; end
    mom = h.residuals(:, end) + targets;

    fprintf('%4d %4d %10.4e', r, s, rn_sorted(r));
    fprintf('   %7.4f %7.4f %7.4f %7.4f', mom(1:4));
    fprintf('   %7.4f %7.4f %7.4f %7.4f', mom(5:8));
    fprintf('   %7.4f %7.4f %7.4f %7.4f %7.4f', mom(9:13));
    fprintf('   %9.2e %9.2e %9.2e %9.2e', p(1:4));
    fprintf('   %9.2e %9.2e %9.2e %9.2e', p(5:8));
    fprintf('   %7.4f %7.4f %7.4f %7.4f %7.4f\n', p(9:13));
end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPUTE CALIBRATED STEADY STATE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASSIGN CALIBRATED PARAMETERS
parL.fV             = params_out(1);
parH.fV             = params_out(2);
parL_star.fV        = params_out(3);
parH_star.fV        = params_out(4);

parL.fX             = params_out(5);
parH.fX             = params_out(6);
parL_star.fX        = params_out(7);
parH_star.fX        = params_out(8);

parL.tau            = params_out(9);
parH.tau            = params_out(10);
parL_star.tau       = params_out(11);
parH_star.tau       = params_out(12);

psiL                = 1;              % normalised
psiL_star           = params_out(13); % calibrated

conjectures0        = best_conj;
options             = optimset('MaxFunEvals', 500000, 'MaxIter', 500000);
solve_ind           = 0;
fun                 = @(x)ss_equilibrium_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, x, solve_ind, tar, psiL, psiL_star, wage);
[solve,~,flag]      = fsolve(fun, conjectures0, options);

solve_ind           = 1;
eqlbm_ss0           = ss_equilibrium_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, solve, solve_ind, tar, psiL, psiL_star, wage);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN DYNARE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dynare
if strcmp(getenv('USER'), 'raphaelvochtel')
    addpath('/Applications/Dynare/6.4-arm64/matlab');
else
    addpath('C:\dynare\6.2\matlab');  % TODO: update this path for your machine
end

dynare DSW_2Sector_10Jun2026.mod

% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIZE POLICY SHOCKS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% use_pv_rescaling = false: all 8 shocks stay flat at par.sigma_pol, as set
%   in the .mod file -- the paper draft's own "1% to each instrument"
%   convention.
% use_pv_rescaling = true:  the 6 revenue-generating shocks (tariffs, D/E
%   subsidies, North+South) are resized so the PV of their fiscal effect
%   equals target_pv as a share of world consumption (pvtaxes_10Jun2026.m).
%   The 2 offshoring-cost shocks (tau_V) have no fiscal-budget effect and
%   always stay at sigma_pol regardless of this flag.
use_pv_rescaling = false;

if use_pv_rescaling
    target_pv                   = 0.01;
    [shock_stderr, trial_ratio] = pvtaxes_10Jun2026(oo_, eqlbm_ss0, par, solve(1), par.sigma_pol, target_pv);

    disp('Trial (sigma_pol) PV-of-fiscal-effect ratios:'); trial_ratio
    disp('Solved stderr (PV of fiscal effect = 1% of world consumption):'); shock_stderr

    rescale_tags = fieldnames(shock_stderr);
    for i = 1:numel(rescale_tags)
        tag    = rescale_tags{i};
        scale  = shock_stderr.(tag) / par.sigma_pol;
        fields = fieldnames(oo_.irfs);
        match  = fields(endsWith(fields, ['_' tag]));
        for m = 1:numel(match)
            oo_.irfs.(match{m}) = oo_.irfs.(match{m}) * scale;
        end
    end
end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
show_tauV = false;  % set either true or false to show the tau_V (offshoring) shock in every IRF panel/legend

figuresNorth_10Jun2026
figuresSouth_10Jun2026

return

% Impact consumption deviation held constant:
size_tauIM      = abs(oo_.irfs.C_eps_tauIMH(1)/eqlbm_ss0.hh(13))*100
size_tau_offsh  = abs(oo_.irfs.C_eps_tau_offshoringH(1)/eqlbm_ss0.hh(13))*100
size_s_D        = abs(oo_.irfs.C_eps_s_DH(1)/eqlbm_ss0.hh(13))*100
size_s_E        = abs(oo_.irfs.C_eps_s_EH(1)/eqlbm_ss0.hh(13))*100


save w.mat

return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SHUT-DOWN OFFSHORING

cal2                = zeros(9,1);
% cal2(1:4,1)         = cal(5:8,1);
% cal2(5:8,1)         = cal(9:12,1);
% cal2(9,1)           = cal(13,1);

parL.fX             = 0.000002987300621;
parH.fX             = 0.000000098394330;
parL_star.fX        = 0.000003062778543;
parH_star.fX        = 0.000000099882682;

parL.tau            = 1.940492939611868;
parH.tau            = 1.846892827173535;
parL_star.tau       = 1.880418030960522;
parH_star.tau       = 1.788677781109606;

psiL                = 1;              % normalised
psiL_star           = 1.1;            % initial guess

cal2(1,1)           = parL.fX;
cal2(2,1)           = parH.fX;
cal2(3,1)           = parL_star.fX;
cal2(4,1)           = parH_star.fX;

cal2(5,1)           = parL.tau;
cal2(6,1)           = parH.tau;
cal2(7,1)           = parL_star.tau;
cal2(8,1)           = parH_star.tau;

cal2(9,1)           = psiL_star;      % psiL_star now calibrated (param 9)



cal_ind                     = 2; %without offshoring (2), with (1)
options                     = optimset('MaxFunEvals', 50000);
f                           = @(cal_params)calibration_10Jun2026(par, parL, parH, parL_star, parH_star, par_star, tar, cal_params, cal_ind, wage);
[params_out,tmp1,tmp2]      = fminsearch(f, cal2);

if (flag <= 0)
    return
end


% FIND THE INITIAL VALUES FOR DYNARE
parL.fV             = 10;
parH.fV             = 10;
parL_star.fV        = 10;
parH_star.fV        = 10;

parL.fX             = cal2(1,1);
parH.fX             = cal2(2,1);
parL_star.fX        = cal2(3,1);
parH_star.fX        = cal2(4,1);

parL.tau            = cal2(5,1);
parH.tau            = cal2(6,1);
parL_star.tau       = cal2(7,1);
parH_star.tau       = cal2(8,1);

psiL                = 1;              % normalised
psiL_star           = cal2(9,1);      % calibrated


conjectures0 = [ 1 1 1 1 1];
options             = optimset('MaxFunEvals', 500000, 'MaxIter', 500000);
fun                 = @(x)ss_equilibrium_10Jun2026(par,par_star,parL,parH,parL_star,parH_star, x, 0,tar, psiL, psiL_star, wage);
[solve,~,flag]      = fsolve(fun, conjectures0, options);

solve_ind           = 1;
eqlbm_ss0           = ss_equilibrium_10Jun2026(par, par_star, parL, parH, parL_star, parH_star, solve, solve_ind, tar, psiL, psiL_star, wage);

if (flag <= 0)
    return
end

 
return
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN DYNARE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dynare
if isfolder('/Applications/Dynare/6.4-arm64/matlab')
    addpath('/Applications/Dynare/6.4-arm64/matlab');
else
    addpath('C:\dynare\6.2\matlab');
end
dynare DSW_2Sector_10Jun2026_v2.mod

% Impact consumption deviation held constant:
size_tauIM      = abs(oo_.irfs.C_eps_tauIMH(1)/eqlbm_ss0.hh(13))*100
size_tau_offsh  = abs(oo_.irfs.C_eps_tau_offshoringH(1)/eqlbm_ss0.hh(13))*100
size_s_D        = abs(oo_.irfs.C_eps_s_DH(1)/eqlbm_ss0.hh(13))*100
size_s_E        = abs(oo_.irfs.C_eps_s_EH(1)/eqlbm_ss0.hh(13))*100

save wo.mat







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES

load w.mat
figuresNorth
close all

figuresNorth_wo_v2


 
% Consumption North
clear
clc
load w.mat
plot(oo_.irfs.C_eps_tauIMH(1:20)/eqlbm_ss0.hh(13)*100, 'b')
hold on
plot(oo_.irfs.C_eps_s_DH(1:20)/eqlbm_ss0.hh(13)*100, 'b--')
plot(oo_.irfs.C_eps_s_EH(1:20)/eqlbm_ss0.hh(13)*100, 'b:')

clear
clc
load wo.mat
plot(oo_.irfs.C_eps_tauIMH(1:20)/eqlbm_ss0.hh(13)*100, 'r')
%plot(oo_.irfs.C_eps_s_DH(1:20)/eqlbm_ss0.hh(13)*100, 'r--')
%plot(oo_.irfs.C_eps_s_EH(1:20)/eqlbm_ss0.hh(13)*100, 'r:')
legend('Tariff w', 'Subs w', 'SubsE w', 'Tariff wo')
title('Consumption (% deviations from ss x100)')
ax = gca;
exportgraphics(ax,'Consumption_10Sep2025.eps')


