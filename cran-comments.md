# CRAN submission comments — boe 0.3.0

## Feature release on top of boe 0.2.0 (currently on CRAN)

### New functionality

* `boe_curve()` gains `from`, `to`, `frequency`, and `cache_ttl_h`
  arguments. Setting any of `from` / `to`, or `frequency = "monthly"`,
  routes the request to the BoE archive zips, which extend coverage
  back to ~1979 (nominal gilts), ~1985 (real / inflation), ~2000
  (commercial bank liability curve), and ~2009 (overnight index swap).
  Default behaviour with no arguments is unchanged: still returns the
  latest published month from `latest-yield-curve-data.zip`.
* `boe_curve()` adds a fifth curve type, `"blc"` (commercial bank
  liability curve). Because BLC is not published in the latest-month
  zip, it always routes through the archive path.
* New `boe_curve_panel(curve, measure, frequency, from, to, maturities)`:
  wide-format wrapper that returns one row per date and one numeric
  column per pillar maturity. Default pillars are
  `c(0.5, 1, 2, 5, 10, 20)`.

### Provenance and caching

* `boe_tbl` queries from `boe_curve()` now record `source` (`"latest"`
  or `"archive"`) and `source_url` so returned data carries an audit
  trail.
* Archive zips cache for 30 days by default versus 24 hours for the
  latest-month zip; the per-period workbooks within each archive zip
  are concatenated transparently.
* Maturity-row detection is now content-based, so older Excel layouts
  (pre-2007) parse cleanly via the same code path.

### Documentation

* New vignette `yield-curves.Rmd` walks through three worked examples:
  the 10-year nominal spot rate since 2000, 5y5y forward implied
  inflation since 2010, and OIS spot pillars joined to MPC decisions
  across the 2020 to present rate cycle.
* Vignette chunks gate on `Sys.getenv("NOT_CRAN") == "true"` so CRAN
  rebuilds skip the network calls.

### Dependencies

* Adds `knitr` and `rmarkdown` to Suggests for the new vignette.
* No changes to Imports or to `readxl` (already in Suggests).

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
