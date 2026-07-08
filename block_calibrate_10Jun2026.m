function [params_out, history] = block_calibrate_10Jun2026(par, parL, parH, parL_star, parH_star, par_star, tar, cal0, cal_ind, wage)

MAX_SWEEPS = 100;
TOL        = 1e-4;

param_names = {'fV_L', 'fV_H', 'fV_L*', 'fV_H*', ...
               'fX_L', 'fX_H', 'fX_L*', 'fX_H*', ...
               'tau_L', 'tau_H', 'tau_L*', 'tau_H*', ...
               'psiL*'};
targets = [tar.fracV * ones(1,4), tar.fracX * ones(1,4), tar.Xint * ones(1,4), tar.comp_adv]';

% Known monotonicity direction: -1 means moment DECREASES with param
mono_dir = [-1*ones(1,4), -1*ones(1,4), -1*ones(1,4), 0]';

lb = zeros(13,1);
lb(9:12) = 1.001;
lb(1:8) = 1e-15;
lb(13) = 0.01;

fsolve_opts = optimset('MaxFunEvals', 5000, 'MaxIter', 5000, 'Display', 'off');
fzero_opts  = optimset('TolX', 1e-6, 'Display', 'off');

% Warm-start cache for fsolve
conj_cache = [1 1 1 1 1];
eval_count = 0;

params = cal0(:);
history.resnorm     = [];
history.params      = [];
history.residuals   = [];
history.sweep_times = [];

% Track the best parameters seen (in case later sweeps degrade)
best_params  = params;
best_resnorm = inf;
best_conj    = [1 1 1 1 1];
consec_fails = 0;

fprintf('\n=== BLOCK-COORDINATE CALIBRATION ===\n');
fprintf('Parameters: %d, Targets: %d\n', length(params), length(targets));
fprintf('Tolerance: %.1e, Max sweeps: %d\n\n', TOL, MAX_SWEEPS);

for sweep = 1:MAX_SWEEPS
    tic_sweep = tic;
    fprintf('\n==================== SWEEP %d/%d ====================\n', sweep, MAX_SWEEPS);

    % Verify we can evaluate the current point before starting the sweep
    [moments_check, flag_check] = eval_moments(params);
    if flag_check <= 0
        % Cache is stale — reset it and retry
        conj_cache = [1 1 1 1 1];
        [moments_check, flag_check] = eval_moments(params);
    end
    if flag_check <= 0
        % Try a few more diverse initial guesses
        for guess = [0.5 0.5 0.5 0.5 0.5; 2 2 2 2 2; 1 0.5 0.5 1 1; 0.5 1 1 0.5 0.5]'
            conj_cache = guess';
            [moments_check, flag_check] = eval_moments(params);
            if flag_check > 0, break; end
        end
    end
    if flag_check <= 0
        consec_fails = consec_fails + 1;
        fprintf('  SWEEP %d: cannot evaluate current point (tried 6 initial guesses)\n', sweep);
        if consec_fails >= 3
            fprintf('  *** 3 consecutive failed sweeps — reverting to best known params ***\n');
            params = best_params;
            conj_cache = [1 1 1 1 1];
            consec_fails = 0;
            % Try once more from best params
            [moments_check, flag_check] = eval_moments(params);
            if flag_check <= 0
                fprintf('  *** Best params also infeasible — stopping ***\n');
                break
            end
        else
            continue
        end
    end
    consec_fails = 0;

    for i = 1:13
        % Evaluate current state (cache should be warm from previous param or sweep start)
        [moments_now, flag_now] = eval_moments(params);
        if flag_now <= 0
            fprintf('  [%2d] %-6s: fsolve failed, skipping\n', i, param_names{i});
            continue
        end

        % Save cache state before bracket search (so we can restore after)
        conj_cache_backup = conj_cache;

        res_i = moments_now(i) - targets(i);
        fprintf('  [%2d] %-6s: val=%.3e, mom=%.5f, tar=%.5f, res=%+.5f', ...
            i, param_names{i}, params(i), moments_now(i), targets(i), res_i);

        if abs(res_i) < sqrt(TOL/13)
            fprintf(' -> OK\n');
            continue
        end
        fprintf('\n');

        f_1d = @(x) eval_1d(x, i, params);

        [a, b, fa, fb, found] = find_bracket(f_1d, params(i), res_i, i);

        if ~found
            % Restore cache — bracket search may have pushed it to a bad region
            conj_cache = conj_cache_backup;
            fprintf('         BRACKET NOT FOUND, skipping\n');
            continue
        end

        fprintf('         bracket: [%.3e, %.3e], f=[%+.4f, %+.4f]\n', a, b, fa, fb);

        try
            x_new = fzero(f_1d, [a, b], fzero_opts);
            params(i) = x_new;
            fprintf('         -> root: %.4e\n', x_new);
            % Re-evaluate at updated params to ensure cache is at the current point
            [~, ~] = eval_moments(params);
        catch ME
            % Restore cache on failure
            conj_cache = conj_cache_backup;
            fprintf('         -> fzero FAILED: %s\n', ME.message);
        end
    end

    % End-of-sweep diagnostics
    [moments_final, flag_final] = eval_moments(params);
    if flag_final <= 0
        conj_cache = [1 1 1 1 1];
        [moments_final, flag_final] = eval_moments(params);
    end
    if flag_final <= 0
        fprintf('\n  SWEEP %d: fsolve failed at final evaluation!\n', sweep);
        continue
    end
    residuals = moments_final - targets;
    resnorm = sum(residuals.^2);
    elapsed = toc(tic_sweep);

    history.resnorm(end+1)      = resnorm;
    history.params(:, end+1)    = params;
    history.residuals(:, end+1) = residuals;
    history.sweep_times(end+1)  = elapsed;

    if resnorm < best_resnorm
        best_resnorm = resnorm;
        best_params  = params;
        best_conj    = conj_cache;
    end

    fprintf('\n  SWEEP %d RESULT: resnorm = %.6e (%.0fs, %d evals total)\n', ...
        sweep, resnorm, elapsed, eval_count);
    fprintf('  %-8s %12s %10s %10s %10s\n', 'Param', 'Value', 'Moment', 'Target', 'Residual');
    for i = 1:13
        fprintf('  %-8s %12.4e %10.5f %10.5f %+10.5f\n', ...
            param_names{i}, params(i), moments_final(i), targets(i), residuals(i));
    end

    save('block_calibrate_results.mat', 'params', 'history', 'sweep');

    if resnorm < TOL
        fprintf('\n  *** CONVERGED at sweep %d (resnorm=%.2e < %.2e) ***\n', sweep, resnorm, TOL);
        break
    end

    if length(history.resnorm) >= 3
        recent = history.resnorm(end-2:end);
        if max(recent) - min(recent) < 1e-6 * mean(recent)
            fprintf('\n  *** STAGNATED: resnorm unchanged for 3 sweeps ***\n');
            break
        end
    end
end

params_out = best_params;
history.best_conj = best_conj;
fprintf('\n=== BLOCK-COORDINATE CALIBRATION COMPLETE ===\n');
if ~isempty(history.resnorm)
    fprintf('Best resnorm: %.6e after %d successful sweeps (%d total evals)\n', ...
        best_resnorm, length(history.resnorm), eval_count);
else
    fprintf('No successful sweeps completed (%d total evals)\n', eval_count);
end


%% ===== NESTED FUNCTIONS =====

    function [moments, flag] = eval_moments(p)
        eval_count = eval_count + 1;

        parL_loc = parL; parH_loc = parH;
        parL_star_loc = parL_star; parH_star_loc = parH_star;

        if cal_ind == 1
            parL_loc.fV = p(1); parH_loc.fV = p(2);
            parL_star_loc.fV = p(3); parH_star_loc.fV = p(4);
            parL_loc.fX = p(5); parH_loc.fX = p(6);
            parL_star_loc.fX = p(7); parH_star_loc.fX = p(8);
            parL_loc.tau = p(9); parH_loc.tau = p(10);
            parL_star_loc.tau = p(11); parH_star_loc.tau = p(12);
            psiL_loc = 1;
            psiL_star_loc = p(13);
        elseif cal_ind == 2
            parL_loc.fV = 10; parH_loc.fV = 10;
            parL_star_loc.fV = 10; parH_star_loc.fV = 10;
            parL_loc.fX = p(1); parH_loc.fX = p(2);
            parL_star_loc.fX = p(3); parH_star_loc.fX = p(4);
            parL_loc.tau = p(5); parH_loc.tau = p(6);
            parL_star_loc.tau = p(7); parH_star_loc.tau = p(8);
            psiL_loc = 1;
            psiL_star_loc = p(9);
        end

        if any(p(1:8) <= 0) || any(p(9:12) < 1)
            moments = NaN(13,1); flag = -1; return
        end

        fun = @(x) ss_equilibrium_10Jun2026(par, par_star, parL_loc, parH_loc, ...
            parL_star_loc, parH_star_loc, x, 0, tar, psiL_loc, psiL_star_loc, wage);
        [solve, ~, flag] = fsolve(fun, conj_cache, fsolve_opts);

        if flag <= 0
            [solve, ~, flag] = fsolve(fun, [1 1 1 1 1], fsolve_opts);
        end

        if flag <= 0
            moments = NaN(13,1); return
        end

        conj_cache = solve;

        eqlbm = ss_equilibrium_10Jun2026(par, par_star, parL_loc, parH_loc, ...
            parL_star_loc, parH_star_loc, solve, 1, tar, psiL_loc, psiL_star_loc, wage);

        moments = [eqlbm.mom.fracVL; eqlbm.mom.fracVH; eqlbm.mom.fracVL_star; eqlbm.mom.fracVH_star;
                   eqlbm.mom.fracXL; eqlbm.mom.fracXH; eqlbm.mom.fracXL_star; eqlbm.mom.fracXH_star;
                   eqlbm.mom.exp_intL; eqlbm.mom.exp_intH; eqlbm.mom.exp_intL_star; eqlbm.mom.exp_intH_star;
                   eqlbm.mom.comp_adv];
    end


    function val = eval_1d(x, idx, params_current)
        params_trial = params_current;
        params_trial(idx) = x;
        [moments, flag] = eval_moments(params_trial);
        if flag <= 0 || any(isnan(moments))
            dir = mono_dir(idx);
            if dir == 0
                val = NaN;
            else
                if x > params_current(idx)
                    val = dir * 1000;
                else
                    val = -dir * 1000;
                end
            end
            return
        end
        val = moments(idx) - targets(idx);
    end


    function [a, b, fa, fb, found] = find_bracket(f_handle, x0, f0, param_idx)
        found = false;
        a = x0; fa = f0; b = x0; fb = f0;

        dir = mono_dir(param_idx);
        if dir ~= 0
            if f0 > 0 && dir < 0
                search_up_first = true;
            elseif f0 < 0 && dir < 0
                search_up_first = false;
            elseif f0 > 0 && dir > 0
                search_up_first = false;
            else
                search_up_first = true;
            end
        else
            search_up_first = true;
        end

        up_mults   = [1.5, 2, 3, 5, 10, 30, 100];
        down_mults = [0.7, 0.5, 0.3, 0.1, 0.03, 0.01];

        if search_up_first
            directions = {up_mults, down_mults};
        else
            directions = {down_mults, up_mults};
        end

        for d = 1:2
            mults = directions{d};
            for m = mults
                x_try = x0 * m;
                x_try = max(x_try, lb(param_idx));

                f_try = f_handle(x_try);
                if isnan(f_try), continue; end

                if f0 * f_try < 0
                    a = x0; fa = f0;
                    b = x_try; fb = f_try;
                    if a > b
                        [a, b] = deal(b, a);
                        [fa, fb] = deal(fb, fa);
                    end
                    found = true;
                    return
                end
            end
        end
    end

end
