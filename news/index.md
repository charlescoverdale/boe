# Changelog

## boe 0.2.0

CRAN release: 2026-04-27

### New: monetary policy data

- New `boe_mpc_decisions(from, to)`: history of MPC rate-change events
  derived from the daily Bank Rate series. Returns date, new rate,
  previous rate, change in basis points, and direction.
- New
  [`boe_mpc_votes()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_votes.md):
  full MPC voting record from June 1997, parsed from BoE’s published
  `mpcvoting.xlsx`. Long format with one row per (meeting, member)
  including a `dissent` flag.
- New `boe_mpr_forecasts(series, month, year)`: Monetary Policy Report
  forecast paths for CPI inflation, GDP growth, GDP level, unemployment,
  and Bank Rate. Parses the Projections Databank workbook from the
  per-release MPR zip. Defaults to the latest published quarterly
  release; older releases are accessible via `month` / `year` (post-2025
  format only).

### New: search and discovery

- New `boe_series` exported dataset: a 52-row catalogue of every BoE
  series wrapped by the package, with code, title, category, frequency,
  unit, start date, and seasonal-adjustment flag.
- New `boe_search(query, category, frequency)`: keyword + filter search
  over `boe_series`. Case-insensitive substring match against title and
  code.
- New `boe_browse(category, frequency)`: filter-only view of
  `boe_series`. Equivalent to
  [`boe_search()`](https://charlescoverdale.github.io/boe/reference/boe_search.md)
  with no keyword.

### New: yield-curve depth (Anderson-Sleath)

- New `boe_curve(curve, measure)`: full Anderson-Sleath fitted yield
  curves at all maturities (typically 0.5 to 25 or 40 years), covering
  nominal gilt, real gilt, implied inflation, and OIS curves. Both spot
  and forward measures available where published. Latest month of daily
  data; archive coverage planned.
- References Anderson and Sleath (2001, BoE Working Paper 126).
- Adds **readxl** to Suggests (used only by
  [`boe_curve()`](https://charlescoverdale.github.io/boe/reference/boe_curve.md);
  lazily required at call time).

### New: cache helpers

- New
  [`boe_cache_info()`](https://charlescoverdale.github.io/boe/reference/boe_cache_info.md):
  report cache directory, file count, total size, and modification
  timestamp range. Companion to
  [`clear_cache()`](https://charlescoverdale.github.io/boe/reference/clear_cache.md).

### Provenance

- New `boe_tbl` S3 class. All `boe_*()` functions now return data frames
  carrying provenance metadata (series codes, date range, frequency,
  function called, fetch timestamp). Subclasses `data.frame` so
  downstream operations are unaffected.
- New
  [`print.boe_tbl()`](https://charlescoverdale.github.io/boe/reference/print.boe_tbl.md)
  method shows a one-line provenance header above the data frame body,
  mirroring the `fred_tbl` pattern in the `fred` package.

## boe 0.1.2

CRAN release: 2026-03-17

- Removed non-existent pkgdown URL from DESCRIPTION.

## boe 0.1.1

- Examples now cache to
  [`tempdir()`](https://rdrr.io/r/base/tempfile.html) instead of the
  user’s home directory, fixing CRAN policy compliance for `\donttest`
  examples.
- Cache directory is now configurable via
  `options(boe.cache_dir = ...)`.

## boe 0.1.0

CRAN release: 2026-03-12

- Initial release.
- [`boe_get()`](https://charlescoverdale.github.io/boe/reference/boe_get.md):
  fetch any series by code from the BoE Statistical Database.
- [`boe_bank_rate()`](https://charlescoverdale.github.io/boe/reference/boe_bank_rate.md):
  Bank Rate history (daily or monthly, from 1975).
- [`boe_sonia()`](https://charlescoverdale.github.io/boe/reference/boe_sonia.md):
  SONIA interest rate (daily, monthly, or annual, from 1997).
- [`boe_yield_curve()`](https://charlescoverdale.github.io/boe/reference/boe_yield_curve.md):
  nominal and real gilt yields at 5yr, 10yr, 20yr maturities (from
  1985/1993).
- [`boe_exchange_rate()`](https://charlescoverdale.github.io/boe/reference/boe_exchange_rate.md):
  daily sterling exchange rates for 27 currencies (from 1975).
- [`list_exchange_rates()`](https://charlescoverdale.github.io/boe/reference/list_exchange_rates.md):
  catalogue of available currency codes.
- [`boe_mortgage_rates()`](https://charlescoverdale.github.io/boe/reference/boe_mortgage_rates.md):
  quoted mortgage rates (2yr/3yr/5yr fixed, SVR, from 1995).
- [`boe_mortgage_approvals()`](https://charlescoverdale.github.io/boe/reference/boe_mortgage_approvals.md):
  monthly mortgage approvals for house purchase (from 1993).
- [`boe_consumer_credit()`](https://charlescoverdale.github.io/boe/reference/boe_consumer_credit.md):
  consumer credit outstanding by type (from 1993).
- [`boe_money_supply()`](https://charlescoverdale.github.io/boe/reference/boe_money_supply.md):
  M4 broad money amounts outstanding (from 1982).
- [`clear_cache()`](https://charlescoverdale.github.io/boe/reference/clear_cache.md):
  delete locally cached data files.
