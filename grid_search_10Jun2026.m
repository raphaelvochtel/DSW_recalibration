function [best_cal, results] = grid_search_10Jun2026(par, parL, parH, parL_star, parH_star, par_star, tar, cal_base, cal_ind, wage)
% 6-dimensional grouped grid search.
%
% Dimensions:
%   1. level_fV   — overall scale for all 4 fV (multiplier on base)
%   2. level_fX   — overall scale for all 4 fX (multiplier on base)
%   3. HL_ratio   — tilt H-sector vs L-sector for fV AND fX (shared)
%   4. NS_ratio   — tilt South vs North for fV AND fX (shared)
%   5. mult_tau   — overall scale for all 4 tau
%   6. psiL_star  — absolute values
%
% Construction (fV example):
%   fV_L  = base(1) * level_fV                          (North L = reference)
%   fV_H  = base(2) * level_fV * HL_ratio               (North H)
%   fV_L* = base(3) * level_fV * NS_ratio               (South L)
%   fV_H* = base(4) * level_fV * HL_ratio * NS_ratio    (South H)
% Same structure for fX.

% --- Grid definitions ---
level_fV    = [1,    2,    3,    5];
level_fX    = [0.5,  1,    3,    7];
HL_ratio    = [0.2,  0.5,  1,    2,    5];
NS_ratio    = [0.2,  0.5,  1,    2,    5];
mult_tau    = [1.0,  1.05, 1.1,  1.25];
vals_psiLstar = [0.9, 1.2,  1.5,  2.0];

[G_fV, G_fX, G_HL, G_NS, G_tau, G_psi] = ndgrid( ...
    level_fV, level_fX, HL_ratio, NS_ratio, mult_tau, vals_psiLstar);
n_points = numel(G_fV);

fprintf('=== Grid search: %d points (%d x %d x %d x %d x %d x %d) ===\n', ...
    n_points, length(level_fV), length(level_fX), length(HL_ratio), ...
    length(NS_ratio), length(mult_tau), length(vals_psiLstar));
fprintf('Estimated time: ~%.0f minutes (at 0.17s/point)\n\n', n_points * 0.17 / 60);

if cal_ind == 1
    n_res = 13;
elseif cal_ind == 2
    n_res = 9;
end

obj_values      = inf(n_points, 1);
all_params      = zeros(n_points, 13);
all_residuals   = zeros(n_points, n_res);
flags           = zeros(n_points, 1);
grid_coords     = zeros(n_points, 6);

savefile = 'grid_search_results.mat';
res_labels = {'fracVL','fracVH','fracVL*','fracVH*', ...
              'fracXL','fracXH','fracXL*','fracXH*', ...
              'expIntL','expIntH','expIntL*','expIntH*', ...
              'comp_adv'};
param_labels = {'fV_L','fV_H','fV_L*','fV_H*','fX_L','fX_H','fX_L*','fX_H*', ...
                'tau_L','tau_H','tau_L*','tau_H*','psiL*'};
grid_labels = {'level_fV','level_fX','HL_ratio','NS_ratio','mult_tau','psiL_star'};

fsolve_opts = optimset('MaxFunEvals', 1000, 'MaxIter', 1000, 'Display', 'off');

tic_grid = tic;

for i = 1:n_points

    lv_fV = G_fV(i);  lv_fX = G_fX(i);  hl = G_HL(i);  ns = G_NS(i);
    t_m   = G_tau(i);  psi_val = G_psi(i);
    grid_coords(i,:) = [lv_fV, lv_fX, hl, ns, t_m, psi_val];

    % --- Construct 13-parameter vector ---
    cal_i = zeros(13, 1);

    % fV: level × base, with HL and NS tilts
    cal_i(1) = cal_base(1) * lv_fV;                % fV_L  (North L)
    cal_i(2) = cal_base(2) * lv_fV * hl;           % fV_H  (North H)
    cal_i(3) = cal_base(3) * lv_fV * ns;           % fV_L* (South L)
    cal_i(4) = cal_base(4) * lv_fV * hl * ns;      % fV_H* (South H)

    % fX: same structure
    cal_i(5) = cal_base(5) * lv_fX;                % fX_L  (North L)
    cal_i(6) = cal_base(6) * lv_fX * hl;           % fX_H  (North H)
    cal_i(7) = cal_base(7) * lv_fX * ns;           % fX_L* (South L)
    cal_i(8) = cal_base(8) * lv_fX * hl * ns;      % fX_H* (South H)

    % tau: uniform multiplier
    cal_i(9:12) = cal_base(9:12) * t_m;

    % psiL_star: absolute value
    cal_i(13) = psi_val;

    all_params(i, :) = cal_i';

    % --- Unpack into sector structs ---
    parL_i = parL;  parH_i = parH;  parL_star_i = parL_star;  parH_star_i = parH_star;

    if cal_ind == 1
        parL_i.fV      = cal_i(1);   parH_i.fV      = cal_i(2);
        parL_star_i.fV = cal_i(3);   parH_star_i.fV = cal_i(4);
        parL_i.fX      = cal_i(5);   parH_i.fX      = cal_i(6);
        parL_star_i.fX = cal_i(7);   parH_star_i.fX = cal_i(8);
        parL_i.tau     = cal_i(9);   parH_i.tau     = cal_i(10);
        parL_star_i.tau= cal_i(11);  parH_star_i.tau= cal_i(12);
        psiL           = 1;
        psiL_star      = cal_i(13);
    elseif cal_ind == 2
        parL_i.fV = 10;  parH_i.fV = 10;  parL_star_i.fV = 10;  parH_star_i.fV = 10;
        parL_i.fX      = cal_i(1);   parH_i.fX      = cal_i(2);
        parL_star_i.fX = cal_i(3);   parH_star_i.fX = cal_i(4);
        parL_i.tau     = cal_i(5);   parH_i.tau     = cal_i(6);
        parL_star_i.tau= cal_i(7);   parH_star_i.tau= cal_i(8);
        psiL           = 1;
        psiL_star      = cal_i(9);
    end

    % --- Feasibility check ---
    if any(cal_i < 0)
        continue
    end
    if (parL_i.tau < 1) || (parH_i.tau < 1) || (parL_star_i.tau < 1) || (parH_star_i.tau < 1)
        continue
    end

    % --- Solve steady state ---
    conj0 = [1 1 1 1 1];
    fun   = @(x) ss_equilibrium_10Jun2026(par, par_star, parL_i, parH_i, parL_star_i, parH_star_i, x, 0, tar, psiL, psiL_star, wage);

    [solve_out, ~, flag_i] = fsolve(fun, conj0, fsolve_opts);
    flags(i) = flag_i;

    if flag_i <= 0
        continue
    end

    eqlbm = ss_equilibrium_10Jun2026(par, par_star, parL_i, parH_i, parL_star_i, parH_star_i, solve_out, 1, tar, psiL, psiL_star, wage);

    % --- Compute signed residuals ---
    res_all        = zeros(13, 1);
    res_all(1)     = eqlbm.mom.fracVL      - tar.fracV;
    res_all(2)     = eqlbm.mom.fracVH      - tar.fracV;
    res_all(3)     = eqlbm.mom.fracVL_star - tar.fracV;
    res_all(4)     = eqlbm.mom.fracVH_star - tar.fracV;
    res_all(5)     = eqlbm.mom.fracXL      - tar.fracX;
    res_all(6)     = eqlbm.mom.fracXH      - tar.fracX;
    res_all(7)     = eqlbm.mom.fracXL_star - tar.fracX;
    res_all(8)     = eqlbm.mom.fracXH_star - tar.fracX;
    res_all(9)     = eqlbm.mom.exp_intL      - tar.Xint;
    res_all(10)    = eqlbm.mom.exp_intH      - tar.Xint;
    res_all(11)    = eqlbm.mom.exp_intL_star - tar.Xint;
    res_all(12)    = eqlbm.mom.exp_intH_star - tar.Xint;
    res_all(13)    = eqlbm.mom.comp_adv      - tar.comp_adv;

    if cal_ind == 1
        res = res_all(1:13);
    elseif cal_ind == 2
        res = res_all(5:13);
    end

    obj_values(i)        = sum(res.^2);
    all_residuals(i, :)  = res';

    % --- Progress: every successful point ---
    fprintf('  %4d/%d | fV×%-4.1f fX×%-4.1f HL×%-4.1f NS×%-4.1f tau×%-5.3f psi*=%-4.2f | obj=%.4e\n', ...
        i, n_points, lv_fV, lv_fX, hl, ns, t_m, psi_val, obj_values(i));

    if mod(i, 200) == 0
        elapsed   = toc(tic_grid);
        rate      = elapsed / i;
        remaining = rate * (n_points - i);
        best_so_far = min(obj_values(1:i));
        fprintf('  --- [%.0fs elapsed | ~%.0fs left | best obj = %.6e | saving...] ---\n', ...
            elapsed, remaining, best_so_far);
        save(savefile, 'obj_values','all_params','all_residuals','grid_coords','flags', ...
             'res_labels','param_labels','grid_labels','i','n_points');
    end
end

% Final save (all points)
save(savefile, 'obj_values','all_params','all_residuals','grid_coords','flags', ...
     'res_labels','param_labels','grid_labels','i','n_points');
fprintf('Results saved to %s\n', savefile);

elapsed = toc(tic_grid);

% --- Sort and report ---
[~, idx]         = sort(obj_values);
results.obj      = obj_values(idx);
results.params   = all_params(idx, :);
results.residuals= all_residuals(idx, :);
results.flags    = flags(idx);
results.grid_coords = grid_coords(idx, :);

n_feasible  = sum(isfinite(obj_values) & obj_values < 999);

fprintf('\n============================================\n');
fprintf('Grid search complete: %d points in %.1f seconds (%.2fs/point)\n', ...
    n_points, elapsed, elapsed/n_points);
fprintf('  Feasible: %d | fsolve failed or infeasible: %d\n', ...
    n_feasible, n_points - n_feasible);
fprintf('============================================\n\n');

fprintf('Top 10 starting points:\n');
fprintf('%-5s  %-12s  %-6s %-6s %-6s %-6s %-6s %-6s\n', ...
    'Rank', 'Objective', 'fV', 'fX', 'HL', 'NS', 'tau', 'psiL*');
for j = 1:min(10, n_feasible)
    gc = results.grid_coords(j, :);
    fprintf('%-5d  %-12.6e  %-6.1f %-6.1f %-6.1f %-6.1f %-6.3f %-6.2f\n', ...
        j, results.obj(j), gc(1), gc(2), gc(3), gc(4), gc(5), gc(6));
end

best_cal = results.params(1, :)';

fprintf('\nBest starting point (obj = %.6e):\n', results.obj(1));
labels = {'fV_L','fV_H','fV_L*','fV_H*','fX_L','fX_H','fX_L*','fX_H*', ...
          'tau_L','tau_H','tau_L*','tau_H*','psiL*'};
for j = 1:13
    fprintf('  %-8s = %.6e\n', labels{j}, best_cal(j));
end

% --- Plot: heatmap of individual residuals for top N points ---
N_plot = min(30, n_feasible);
if N_plot >= 2
    figure('Name','Grid Search: Top 30 Residuals','Position',[100 100 900 600]);

    res_matrix = results.residuals(1:N_plot, :);

    imagesc(res_matrix);
    colorbar;
    n_cm = 256;
    cm_blue = [linspace(0,1,n_cm/2)', linspace(0,1,n_cm/2)', ones(n_cm/2,1)];
    cm_red  = [ones(n_cm/2,1), linspace(1,0,n_cm/2)', linspace(1,0,n_cm/2)'];
    colormap([cm_blue; cm_red]);
    caxis(max(abs(res_matrix(:))) * [-1 1]);

    set(gca, 'XTick', 1:n_res, 'XTickLabel', res_labels, 'XTickLabelRotation', 45);
    ylabel('Rank (sorted by total objective)');

    ylabels = cell(N_plot, 1);
    for j = 1:N_plot
        gc = results.grid_coords(j,:);
        ylabels{j} = sprintf('#%d (%.3f)', j, results.obj(j));
    end
    set(gca, 'YTick', 1:N_plot, 'YTickLabel', ylabels, 'FontSize', 7);

    title('Signed residuals (simulated - target) for top grid points');

    % --- Plot: which grid dimensions matter most? ---
    figure('Name','Grid Search: Top 30 Coordinates','Position',[100 100 900 600]);

    gc_matrix = results.grid_coords(1:N_plot, :);

    subplot(2,3,1); bar(gc_matrix(:,1)); title('level\_fV'); ylabel('multiplier');
    subplot(2,3,2); bar(gc_matrix(:,2)); title('level\_fX'); ylabel('multiplier');
    subplot(2,3,3); bar(gc_matrix(:,3)); title('HL\_ratio'); ylabel('multiplier');
    subplot(2,3,4); bar(gc_matrix(:,4)); title('NS\_ratio'); ylabel('multiplier');
    subplot(2,3,5); bar(gc_matrix(:,5)); title('mult\_tau'); ylabel('multiplier');
    subplot(2,3,6); bar(gc_matrix(:,6)); title('psiL*'); ylabel('value');
    sgtitle('Grid coordinates of top 30 points (sorted by objective)');
end

end
