# CRAN submission comments — boe 0.2.0

## Resubmission

This is a feature release on top of boe 0.1.2 (currently on CRAN).

### New functionality

* `boe_tbl` S3 class. All `boe_*()` functions now return data frames
  carrying provenance metadata (series codes, date range, frequency,
  function called, fetch timestamp). Subclasses `data.frame` so
  downstream operations are unaffected. Adds a one-line provenance
  header via `print.boe_tbl()`.
* `boe_search()` and `boe_browse()`: keyword and filter search over
  the new `boe_series` catalogue dataset (52 rows covering every
  series wrapped by the package).
* `boe_curve()`: full Anderson-Sleath fitted yield curves at all
  maturities (nominal gilt, real gilt, implied inflation, OIS),
  spot and forward measures. Lazily requires `readxl`.
* `boe_mpc_decisions()`, `boe_mpc_votes()`, `boe_mpr_forecasts()`:
  monetary policy data — rate-change events, MPC voting record from
  June 1997, and Monetary Policy Report forecast paths.
* `boe_cache_info()`: report cache directory, file count, total size,
  and modification timestamp range.

### Dependencies

* Adds `readxl` to Suggests (used only by `boe_curve()`,
  `boe_mpc_votes()`, and `boe_mpr_forecasts()`; lazily required at
  call time so installation without `readxl` is unaffected).

## Test environments

* macOS Sequoia 15.6.1, R 4.5.2 (aarch64-apple-darwin20) — local

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

None — no reverse dependencies.

## Notes for CRAN reviewers

* All functions that make network requests are wrapped in `\donttest{}`
  in examples and `skip_on_cran()` + `skip_if_offline()` in tests.
* Data is fetched from the Bank of England Interactive Statistical
  Database CSV endpoint and the BoE website
  (`https://www.bankofengland.co.uk/`).
* Local caching uses `tools::R_user_dir("boe", "cache")` (base R, no
  additional dependencies). In examples, caching is redirected to
  `tempdir()` so that no files are written to the user's home
  filespace.
