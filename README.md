# DSW Recalibration — README

This folder contains a recalibration of the two-sector, two-country DSGE model
in "Industrial Policy Wars and Inequality: Who Loses and When?" (Ding,
Spencer, Wang). It is a self-contained copy of the original codebase, dated
`10Jun2026`, with updated parameters and SMM targets.

## Quick start

1. Set the Dynare path for your machine (line 268).
2. Set `results_suffix` (line 174) to `'_eps1pc'` or `'_eps10pc'` to pick
   which of the two cached calibration runs to load — these correspond to
   two different values of the South wage-arbitrage perturbation `eps` in
   `ss_equilibrium_10Jun2026.m` (line 23, currently `0.1`). **The two must
   match**: if `results_suffix` says `_eps1pc` but `eps` in
   `ss_equilibrium_10Jun2026.m` is still `0.1` (or vice versa), the
   steady-state `fsolve` below will be solving the wrong candidate's
   parameters under the wrong `eps`, which can silently fail to converge or
   converge to a nonsensical point. See "Open items" below for why there
   are two calibrations at all.
3. Set `cand_idx` (line 186) to the candidate (1–8) from the printed table
   you want to run. To just inspect the table of candidates without solving
   the steady state or running Dynare, add a `return` after line 227.
4. Run the script. It stops on its own at line 316, having produced the 10
   IRF plots for that candidate (5 North + 5 South, from
   `figuresNorth_10Jun2026` / `figuresSouth_10Jun2026`). Along the way it
   prints the trial and solved policy-shock sizes if `use_pv_rescaling` is
   on (see "Shock sizing" below).
5. Two flags control what the figures show, both set just before the
   Dynare/figures block:
   - `use_pv_rescaling` (line 286, default `false`): flat `sigma_pol` for
     all 8 shocks vs. PV-of-fiscal-effect rescaling for the 6 revenue
     shocks. See "Shock sizing" below.
   - `show_tauV` (line 311, default `false`): whether the offshoring-cost
     shock (`tau_V`/`eps_tau_offshoringH`/`eps_tau_offshoringL_star`) is
     plotted and included in the legend, in all 10 figures. `tau_V` is
     typically much larger in magnitude than the other 3 shocks in a given
     figure (see "Open items" below), so turning it off is useful for
     inspecting the other 3 shocks on a readable scale.

## What changed vs. the original calibration

The recalibration consists of four changes:

1. **Fixed parameters.** `alphaH` (0.45→0.731), `alphaL` (0.32→0.269), `k`
   (3.4→4.2), `s` (0.005→0.067) updated from Josh's estimation and the
   Philadelphia Fed job-to-job transition data.

2. **Wage setting.** North wages are pinned from two sector-specific skill
   premia (Josh's estimation): `wage.PH = 1.618` (H sector), `wage.PL = 1.792`
   (L sector) (mainscript lines 38–39), replacing the old single symmetric
   premium `tar.skilled_prem = 1.369` that had been applied to both sectors.
   South wages are still derived from the original
   offshoring-arbitrage/indifference formulas (`ss_equilibrium_10Jun2026.m`
   lines 20–27, unchanged from the pre-recalibration code) — only the size
   of the `eps` perturbation in those formulas has since been revisited (see
   "Open items" below).

   Note only the *high-skill* wage differs by sector in the North —
   `wHl = wLl` is pinned exactly equal (line 15), since `wage.PH`/`wage.PL`
   are within-sector skill premia, not a between-sector low-skill
   differential. One consequence: the implied preference-shock value gap
   for low-skill workers (`epsl`/`epsl_star` in `household_10Jun2026.m`,
   accessible as `eqlbm_ss0.hh(10)`/`hh(12)`) comes out near zero, since a
   low-skill worker's consumption barely differs between sectors — unlike
   `epsh`/`epsh_star` (`hh(9)`/`hh(11)`), which is large and clearly
   nonzero because `wage.PH ≠ wage.PL`. Not a bug; worth knowing before
   reading too much into `epsl ≈ 0` if you inspect `eqlbm_ss0.hh` directly
   (fields 9–12 are the value gaps, 15–18 the implied means of each group's
   preference-shock distribution).

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
can be re-run without repeating the (slow) search. Once a run is complete
and judged worth keeping, its two `.mat` files get manually renamed with an
`_epsXXpc` suffix (e.g. `block_calibrate_results_eps1pc.mat`) to archive it
before the next run overwrites the plain-named files — see "Open items"
below for why there are currently two such archived runs.

**Shock sizing (not in the original 4-item scope; supervisor-requested,
2026-08-09).** The recalibration's higher elasticities (see "Open items"
below) mean any given shock size produces much larger IRFs than in the
original paper. The supervisor's proposed alternative to recalibrating
further was to size shocks the way the EER companion paper does
(`reference/pvtaxes_13Nov2025.m`): for each revenue-generating policy
instrument — tariff, domestic-production subsidy, entry subsidy, North
H-sector and South L-sector (6 shocks total) — choose the standard
deviation so the present value of its effect on the government budget
equals a target share of steady-state world consumption, discounted with
the model's own stochastic discount factor.

This is implemented in `pvtaxes_10Jun2026.m` and gated by the
`use_pv_rescaling` flag in the mainscript, right after the Dynare run (see
"Quick start" and the walkthrough below):

- `use_pv_rescaling = false` (default): all 8 shocks — including the 2
  offshoring-cost shocks, which have no fiscal-budget effect and so were
  never eligible for PV sizing regardless of this flag — stay flat at
  `par.sigma_pol` (currently `0.01`, i.e. a uniform 1% shock), matching the
  paper draft's own "1% to each instrument" convention.
- `use_pv_rescaling = true`: the 6 revenue shocks are resized as described
  above; `eps_tau_offshoringH`/`eps_tau_offshoringL_star` still stay at
  `sigma_pol`, since they never enter `T_agg`/`T_agg_star`.

Tested 2026-08-09 with `target_pv = 0.01` (before this flag existed, when
the block was toggled by hand): the exact-PV shock sizes came out at
~1e-6–1e-7, too small to be economically meaningful, and by construction
the method can't touch the offshoring shock — which turned out to be the
dominant driver of the original amplification anyway. Kept in the code
(now behind `use_pv_rescaling`) because it was implemented and verified as
specified, not because it currently produces usable output; see "Open
items" below.

*How `pvtaxes_10Jun2026.m` finds the exact shock size.* Dynare solves the
`.mod` file at first order, so every variable's impulse response is
*exactly proportional* to the shock's `stderr` — the decision rule itself
doesn't depend on shock size, only the length of the impulse does. That
means a single Dynare run, with every shock set to one common trial size
(`sigma_pol`), already contains the complete per-unit response of every
variable to every shock; no second Dynare call is needed to try a
different size.

For each of the 6 revenue shocks, the function pulls that trial run's IRF
of the relevant government-budget flow (`T_agg`/`T_agg_star`) and of the
model's own stochastic discount factor (`SDF`/`SDF_star`), plus two
steady-state levels read from `eqlbm_ss0`: the fiscal flow's SS level
(`gov(1)`/`gov(2)`) and world consumption (`hh(13) + hh(14)*Q` from the
North/South SS consumption and the real exchange rate). It then defines
the present value of the fiscal flow as a function of a *candidate* shock
size `eps`:

```
scale   = eps / eps0                          % eps0 = the trial size
T(t)    = (flow_irf(t)*scale + gov_ss) * SDF_cum(t)
SDF_cum(t) = (sdf_irf(t)*scale + beta) * SDF_cum(t-1),  SDF_cum(0) = 1
PV(eps) = sum_t T(t) / world_consn
```

This is not a straight-line rescale of the trial run: `PV(eps)` is a
polynomial in `eps`, because a shock-scaled flow deviation gets multiplied
period-by-period by a *separately* shock-scaled, compounding discount
factor before being summed over the ~40-period horizon. A naive
"trial ratio × target/trial" rescale would therefore be off. Instead, the
function solves `PV(eps) = target_pv` **exactly** with `fzero`, seeded
from that naive linear-rescale guess (`eps0 * target_pv / PV(eps0)`) purely
for speed. The target's sign is matched to whichever direction each
instrument's fiscal effect naturally moves — tariffs raise `T_agg`,
subsidies lower it — so the seed is always positive. The mainscript then
applies the solved size to every `oo_.irfs` field for that shock by simple
proportion (`solved_stderr / sigma_pol`), which is now exact rather than
approximate, since the trial run's IRFs are truly linear in shock size.

## Open items

One thing remains before this calibration is finished, and it requires a
fresh calibration pass:

1. **Structural offshoring-cutoff problem.** The `fracV = 20%` target
   (Bernard et al. 2018) forces the offshoring cutoff `z_VL` down to 1.45,
   next to `z_min = 1`. At that point the Pareto density is 617× higher
   than in the original calibration, so firm mass becomes extremely
   sensitive to shocks and Dynare's linearised IRFs break down (negative
   firm masses, ~300% swings). This is a structural tension between
   `fracV = 20%` and the Pareto shape
   constraint `k > theta - 1 = 2.8`. Needs a decision on approach (e.g.
   imposing IRF-shape moments in the SMM objective, or revisiting the
   `fracV` target) before it can be resolved.

   *Update, 2026-08-09:* the supervisor's steer was to try shock sizing
   (above) before further recalibration. Tested: PV-of-fiscal-effect
   sizing doesn't work for the 3 North revenue shocks (solved sizes ~1e-7,
   too small to plot) and by construction can't touch `tau_V`, the
   dominant driver of the amplification. The current default
   (`use_pv_rescaling = false`, flat 1% for all 8 shocks, matching the
   paper draft's own convention) produced plausible-looking IRFs and was
   the version assessed as fine to proceed with — but that's a reversion
   to the pre-existing flat-shock convention, not a fix for the structural
   tension above. Flat 1% may simply be small enough to stay inside the
   region where the linearisation still behaves; the underlying
   sensitivity is unchanged and unverified at larger shock sizes.

   *Update, 2026-09-05 — is `eps` (not `fracV`) actually the tight
   constraint?* The supervisor's read was that the South wage-arbitrage
   perturbation `eps` in `ss_equilibrium_10Jun2026.m` (line 23) might be
   set too tight, but cautioned that simply loosening it could break
   target-matching. Tested at `eps = 0.1` (up from `0.01`) using the
   `eps1pc`-calibrated `fV`/`fX`/`tau`/`psiL*` unchanged: `fracVL`,
   `fracVH`, `fracVL*`, `fracVH*` all saturated at exactly `1.0` (target
   `0.2`) — a corner solution (offshoring cutoff `z_V` at or below
   `z_min`), confirming the caution was warranted for the *existing*
   candidate.

   This turned out to be at least partly a search-range artifact, not
   purely structural: `grid_search_10Jun2026.m`'s grid arrays (`level_fV`,
   `level_fX`, `NS_ratio`, `mult_tau`, `vals_psiLstar`) and the
   mainscript's grid base values (`cal(1:4)`, the `fV` bases) were both
   widened and re-run at `eps = 0.1` (3,072 grid points, then multi-start
   block-coordinate refinement from the top 100). A candidate was found —
   resnorm `3.83e-3`, actually *lower* (better target match) than the
   `eps1pc` candidate's `5.76e-3` — though escaping the `fracVL*` corner
   came with a visible tension against `fracXL*` in the grid-search
   diagnostics along the way (widening `NS_ratio` to unstick one pulls the
   other off target, since it's a shared multiplier for both). Both
   calibrations are now kept side by side (`*_eps1pc.mat` /
   `*_eps10pc.mat`, see "Quick start" for the `results_suffix` toggle).
   The grid/base values currently in `grid_search_10Jun2026.m` and the
   mainscript are shaped for `eps = 0.1` specifically — regenerating an
   `eps1pc` run from scratch would need different (narrower) ranges; see
   git history for the values that produced the archived `eps1pc` result.

   **Status: still open.** This shows an interior calibration is *possible*
   at `eps = 0.1` with a wider search, not that `eps = 0.1` is the right
   value to use, nor that the structural tension in item 1 above is
   resolved — it's a different candidate sitting somewhere else in the
   same 13-parameter space, found for one specific `eps`. No decision has
   been made on which `eps`/candidate to actually carry forward into the
   paper's figures; that's a call for you and the supervisor, not
   something to infer from either `.mat` file being "the current default."

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
| 85–168 | Steps 1–2, commented out | The grid search (calls `grid_search_10Jun2026.m`) and multi-start block-coordinate calibration (calls `block_calibrate_10Jun2026.m`) that produced the cached `.mat` results, including the base `cal(1:13)` values a fresh grid search would start from. Commented out because both are slow; uncomment to regenerate from scratch — note these base values and the ranges in `grid_search_10Jun2026.m` are currently tuned for `eps = 0.1` (see "Open items"). |
| 170–178 | Results-file selection | `results_suffix` (line 174) picks which archived calibration run to load — `'_eps1pc'` or `'_eps10pc'` (see "Quick start" and "Open items"). |
| 180–227 | Candidate selection & display | Sorts all multi-start runs in the loaded file by final resnorm, and prints a comparison table of the top 8 candidates (moments achieved vs. targets, and the calibrated parameters). **Line 186 (`cand_idx`) is where you choose which of the top-8 candidates to carry forward** — change this number (1–8) to inspect/use a different local optimum. |
| 234–251 | Assign calibrated parameters | Unpacks the chosen candidate's `params_out` (13 values: 4×`fV`, 4×`fX`, 4×`tau`, `psiL_star`) into `parL`/`parH`/`parL_star`/`parH_star`. `psiL` fixed at 1 (item 4 above). |
| 253–260 | Solve steady state | `fsolve` on `ss_equilibrium_10Jun2026.m` from the candidate's saved conjecture (`best_conj`), first for residuals (`solve_ind=0`) then for the full equilibrium object `eqlbm_ss0` (`solve_ind=1`). This is also where you'd read off `eqlbm_ss0.hh` for the preference-shock objects noted under "Wage setting" above. |
| 263–273 | Dynare setup | Adds the Dynare path (branches on OS username; see Quick start) then runs `DSW_2Sector_10Jun2026.mod`. |
| 275–305 | Shock sizing | `use_pv_rescaling` flag (line 286, default `false`). If `true`, calls `pvtaxes_10Jun2026.m` to solve the exact stderr for the 6 revenue-generating shocks (PV of fiscal effect = `target_pv`, currently 1%, of world consumption) and rescales their IRFs in `oo_.irfs` accordingly; if `false`, this block is skipped and all 8 shocks stay at the flat `sigma_pol` set in the `.mod` file. See "Shock sizing" above. |
| 308–314 | Figures | `show_tauV` flag (line 311, default `false`) controls whether the `tau_V`/offshoring shock is plotted/legended in every figure (see "Quick start"). Calls `figuresNorth_10Jun2026.m` and `figuresSouth_10Jun2026.m`. |
| 316 | `return` | **The script stops here in its current form.** Everything below is unreachable. |
| 318–end | Dead code | Leftover from the original `mainscript_DSW_09Sep2025.m` (welfare-size calculations, a "shut-down offshoring" counterfactual block, and a figures/plotting tail). Not updated for the new calibration — it calls `calibration_10Jun2026(...)`, a function that does not exist in this folder (superseded by `grid_search_10Jun2026.m` / `block_calibrate_10Jun2026.m`), and references old filenames (`figuresNorth`, `Consumption_10Sep2025.eps`). Left in place for now for reference; **do not run past line 316.**