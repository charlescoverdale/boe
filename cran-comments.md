# CRAN submission comments — boe 0.1.0

## Test environments

* macOS Sequoia 15.6.1, R 4.5.2 (aarch64-apple-darwin20) — local

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

None — this is a new package with no reverse dependencies.

## Notes for CRAN reviewers

* All functions that make network requests are wrapped in `\donttest{}` in
  examples and `skip_on_cran()` + `skip_if_offline()` in tests.
* Data is fetched from the Bank of England Interactive Statistical Database
  CSV endpoint at `https://www.bankofengland.co.uk/boeapps/database/`.
* Local caching uses `tools::R_user_dir("boe", "cache")` (base R, no
  additional dependencies).
