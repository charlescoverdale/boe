# CRAN submission comments — boe 0.4.0

## Feature and bug-fix release on top of boe 0.3.0 (currently on CRAN)

### Monetary Policy Report: scenario and hybrid formats

* `boe_mpr_forecasts()` now parses all three Projections Databank
  layouts the Bank of England has published since its Bernanke review
  of forecasting: the classic format (February 2026 and earlier), the
  scenario-based "Scenario Projections Databank" (April 2026), and the
  hybrid workbook introduced with the July 2026 report, which combines
  the classic central-projection sheets with a "Quarterly scenarios"
  section. The format is detected automatically from the release and
  all three share one output schema.
* New `scenario` column labels scenario paths (e.g. `"Adverse
  Scenario"`); central projections carry `NA`.
* The `series` argument gains four series published in the scenario
  sheets from April 2026: `"output_gap"`, `"energy_prices"`,
  `"average_earnings"`, and `"world_export_prices"`. The default
  series set is unchanged.
* Series a release does not publish are skipped with a warning rather
  than erroring.

### Consumer credit: monthly headline measure

* `boe_consumer_credit()` now defaults to the Bank's headline consumer
  credit measure excluding the Student Loans Company, which is updated
  every month. The previous default series including student loans are
  only updated annually and had fallen several months behind. A new
  `include_student_loans` argument restores the previous selection.
  The change is documented prominently in NEWS.md.
* The `boe_series` catalogue now lists both measures (54 series).

### Caching

* Statistical database responses now expire after 30 days rather than
  being cached indefinitely, so revisions eventually reach queries
  pinned to a fixed date range. Configurable via
  `options(boe.cache_ttl_h = )`.

## Test environments

* macOS Sequoia 15.6.1, R 4.5.2 (aarch64-apple-darwin20) — local

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

None — no reverse dependencies.

## Notes for CRAN reviewers

* Network examples are wrapped in `\donttest{}` (lightweight calls) or
  `\dontrun{}` (slow multi-decade archive downloads); tests use
  `skip_on_cran()` + `skip_if_offline()`.
* Data is fetched from the Bank of England Interactive Statistical
  Database CSV endpoint and the BoE website
  (`https://www.bankofengland.co.uk/`).
* Local caching uses `tools::R_user_dir("boe", "cache")` (base R, no
  additional dependencies). In examples, caching is redirected to
  `tempdir()` so that no files are written to the user's home
  filespace.
