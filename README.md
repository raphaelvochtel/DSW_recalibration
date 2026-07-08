# DSW Recalibration — README

This folder contains a recalibration of the two-sector, two-country DSGE model
in "Industrial Policy Wars and Inequality: Who Loses and When?" (Ding,
Spencer, Wang). It is a self-contained copy of the original codebase, dated
`10Jun2026`, with updated parameters and SMM targets.

## Quick start

1. Set the Dynare path for your machine (line 263).
2. Set `cand_idx` (line 181) to the candidate (1–8) from the printed table
   you want to run. To just inspect the table of candidates without solving
   the steady state or running Dynare, add a `return` after line 222.
3. Run the script. It stops on its own at line 277, having produced the 10
   IRF plots for that candidate (5 North + 5 South, from
   `figuresNorth_10Jun2026` / `figuresSouth_10Jun2026`).

## What changed vs. the original calibration

The recalibration consists of four changes:

1. **Fixed parameters.** `alphaH` (0.45→0.731), `alphaL` (0.32→0.269), `k`
   (3.4→4.2), `s` (0.005→0.067) updated from Josh's estimation and the
   Philadelphia Fed job-to-job transition data.

2. **Wage setting.** North wages are pinned from two sector-specific skill
   premia (Josh's estimation): `wage.PH = 1.618` (H sector), `wage.PL = 1.792`
   (L sector) (mainscript lines 38–39), replacing the old single symmetric
   premium `tar.skilled_prem = 1.369` that had been applied to both sectors.
   South wages are unchanged from the original —
   `ss_equilibrium_10Jun2026.m` lines 20–27 use the same
   offshoring-arbitrage/indifference formulas, including the same `eps`
   perturbation, as the pre-recalibration code.

3. **SMM targets.** Offshoring/exporting participation targets updated to
   Bernard et al. (2018): `tar.fracV = 0.20`, `tar.fracX = 0.35`,
   `tar.Xint = 0.17`. The old trade-share target is replaced by a
   comparative-advantage measure, `tar.comp_adv = 0.305` (Josh's estimation),
   computed in `moments_10Jun2026.m` from import/export flows added to
   `agg_10Jun2026.m` (`output(36:39)`).

4. **`psiL` ↔ `psiL_star` role swap.** `psiL` is now normalised to 1;
   `psiL_star` is the free parameter calibrated to match `tar.comp_adv`.

**Methodological change (not in the original 4-item scope):** the harder
targets made the old single-shot `fminsearch` calibration
(`calibration_09Sep2025.m`) unreliable, so it was replaced with a two-stage
procedure: a coarse grid search (`grid_search_10Jun2026.m`) followed by
block-coordinate refinement from the best grid points
(`block_calibrate_10Jun2026.m`), run multi-start from the top ~100 grid
candidates. Results of both stages are cached to disk
(`grid_search_results.mat`, `block_calibrate_results.mat`) so the mainscript
can be re-run without repeating the (slow) search.

## Open items

Three things remain before this calibration is finished. The first two
require redoing the calibration once implemented (they change the
parameter → moment mapping used by `grid_search_10Jun2026.m` /
`block_calibrate_10Jun2026.m`); the third is independent of the other two
but also requires a fresh calibration. Since a full calibration pass is
slow, these are best tackled together in one pass rather than one at a
time.

1. **Labour endowment back-out.** Labour endowments are still cleared as
   equilibrium quantities in `masses_10Jun2026.m` (unchanged from the
   original code), rather than backed out analytically from labour demand
   at the pinned wages, as the recalibration mail specifies. This applies
   to all 8 skill-sector-country combinations, including the 4 North ones
   where wages are already pinned.

2. **Preference-shock mean recalibration.** `household_10Jun2026.m`'s
   `meanh`/`meanl`/`meanh_star`/`meanl_star` formulas are unchanged from
   the original — they were never reset to be consistent with the new
   pinned wages and (not yet backed-out) endowments, as the mail specifies.
   This depends on item 1 above.

3. **Structural offshoring-cutoff problem.** The `fracV = 20%` target
   (Bernard et al. 2018) forces the offshoring cutoff `z_VL` down to 1.45,
   next to `z_min = 1`. At that point the Pareto density is 617× higher
   than in the original calibration, so firm mass becomes extremely
   sensitive to shocks and Dynare's linearised IRFs break down (negative
   firm masses, ~300% swings). This is a structural tension between
   `fracV = 20%` and the Pareto shape
   constraint `k > theta - 1 = 2.8`, independent of items 1–2. Needs a
   decision on approach (e.g. imposing IRF-shape moments in the SMM
   objective, or revisiting the `fracV` target) before it can be resolved.

## `mainscript_DSW_10Jun2026.m` walkthrough

| Lines | Block | What it does |
|---|---|---|
| 1–8 | Header | Clears workspace, `cd`s to the script's own folder so relative file loads/saves work regardless of MATLAB's current directory. |
| 12–27 | Common parameters | `par` struct (discount factor, elasticity, Pareto shape, shock persistence/variance, etc.), copied to `par_star` for the South. |
| 29–34 | SMM targets | `tar` struct — the Bernard et al. (2018) participation/intensity targets and the comparative-advantage target (item 3 above). |
| 36–39 | Wage constants | `wage` struct with the two North sector-specific skill premia (item 2 above). |
| 42–44 | Aggregate TFP | `par.Z`, `par_star.Z` normalised to 1. |
| 46–68 | Sector parameters | `parH`/`parL` (North) built with `alphaH`/`alphaL` (item 1), policy instruments zeroed out, placeholder `fV`/`fX`/`tau` (overwritten by calibration below). `parH_star`/`parL_star` initialised as copies. |
| 71–74 | Sanity check | Halts (`keyboard`) if the Pareto shape violates `k > theta - 1` (would give infinite mean productivity). |
| 82 | `cal_ind` | Selects with-offshoring (1) vs. without-offshoring (2) calibration — currently set to 1. |
| 85–170 | Steps 1–2, commented out | The grid search (calls `grid_search_10Jun2026.m`) and multi-start block-coordinate calibration (calls `block_calibrate_10Jun2026.m`) that produced the cached `.mat` results. Commented out because both are slow; uncomment to regenerate from scratch. |
| 172–222 | Candidate selection & display | Loads `block_calibrate_results.mat`, sorts all multi-start runs by final resnorm, and prints a comparison table of the top 8 candidates (moments achieved vs. targets, and the calibrated parameters). **Line 181 (`cand_idx`) is where you choose which of the top-8 candidates to carry forward** — change this number (1–8) to inspect/use a different local optimum. |
| 229–246 | Assign calibrated parameters | Unpacks the chosen candidate's `params_out` (13 values: 4×`fV`, 4×`fX`, 4×`tau`, `psiL_star`) into `parL`/`parH`/`parL_star`/`parH_star`. `psiL` fixed at 1 (item 4 above). |
| 248–255 | Solve steady state | `fsolve` on `ss_equilibrium_10Jun2026.m` from the candidate's saved conjecture (`best_conj`), first for residuals (`solve_ind=0`) then for the full equilibrium object `eqlbm_ss0` (`solve_ind=1`). |
| 259–269 | Dynare setup | Adds the Dynare path (branches on OS username; see Quick start) then runs `DSW_2Sector_10Jun2026.mod`. |
| 271–275 | Figures | Calls `figuresNorth_10Jun2026.m` and `figuresSouth_10Jun2026.m`. |
| 277 | `return` | **The script stops here in its current form.** Everything below is unreachable. |
| 279–end | Dead code | Leftover from the original `mainscript_DSW_09Sep2025.m` (welfare-size calculations, a "shut-down offshoring" counterfactual block, and a figures/plotting tail). Not updated for the new calibration — it calls `calibration_10Jun2026(...)`, a function that does not exist in this folder (superseded by `grid_search_10Jun2026.m` / `block_calibrate_10Jun2026.m`), and references old filenames (`figuresNorth`, `Consumption_10Sep2025.eps`). Left in place for now for reference; **do not run past line 277.**