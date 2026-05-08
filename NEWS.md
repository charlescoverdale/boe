# boe 0.3.0

## Yield curves: historical archive and panel helper

* `boe_curve()` gains `from`, `to`, `frequency`, and `cache_ttl_h`
  arguments. Setting any of `from` / `to`, or `frequency = "monthly"`,
  routes the request through the BoE archive zips, which extend back to
  ~1979 for nominal gilts, ~1985 for real, ~2000 for the commercial bank
  liability curve, and ~2009 for OIS. Default behaviour
  (`from = NULL`, `to = NULL`, `frequency = "daily"`) is unchanged: the
  function still returns the latest published month from the
  `latest-yield-curve-data.zip` endpoint.
* `boe_curve()` gains a fifth curve type, `"blc"` (commercial bank
  liability curve). BLC is only published in the historical archive
  zip, so requests for it always route through the archive path
  regardless of `from` / `to`.
* New `boe_curve_panel(curve, measure, frequency, from, to, maturities)`:
  wide-format wrapper that returns one row per date and one numeric
  column per pillar maturity. The default pillar set is
  `c(0.5, 1, 2, 5, 10, 20)`, which aligns exactly with the BoE
  half-year grid. Pillars outside a curve's published range trigger a
  warning and are dropped.
* Provenance: `boe_tbl` queries from `boe_curve()` now record
  `source = "latest"` or `"archive"` and the `source_url` so the data
  carries its own audit trail.
* Internal: archive zips cache for 30 days (vs. 24 hours for the
  latest-month zip); per-period workbooks within an archive are
  concatenated transparently, with content-based maturity-row detection
  for older layouts.

# boe 0.2.0

## New: monetary policy data

* New `boe_mpc_decisions(from, to)`: history of MPC rate-change events
  derived from the daily Bank Rate series. Returns date, new rate,
  previous rate, change in basis points, and direction.
* New `boe_mpc_votes()`: full MPC voting record from June 1997, parsed
  from BoE's published `mpcvoting.xlsx`. Long format with one row per
  (meeting, member) including a `dissent` flag.
* New `boe_mpr_forecasts(series, month, year)`: Monetary Policy Report
  forecast paths for CPI inflation, GDP growth, GDP level, unemployment,
  and Bank Rate. Parses the Projections Databank workbook from the
  per-release MPR zip. Defaults to the latest published quarterly
  release; older releases are accessible via `month` / `year` (post-2025
  format only).

## New: search and discovery

* New `boe_series` exported dataset: a 52-row catalogue of every BoE
  series wrapped by the package, with code, title, category, frequency,
  unit, start date, and seasonal-adjustment flag.
* New `boe_search(query, category, frequency)`: keyword + filter search
  over `boe_series`. Case-insensitive substring match against title and
  code.
* New `boe_browse(category, frequency)`: filter-only view of
  `boe_series`. Equivalent to `boe_search()` with no keyword.

## New: yield-curve depth (Anderson-Sleath)

* New `boe_curve(curve, measure)`: full Anderson-Sleath fitted yield
  curves at all maturities (typically 0.5 to 25 or 40 years), covering
  nominal gilt, real gilt, implied inflation, and OIS curves. Both
  spot and forward measures available where published. Latest month of
  daily data; archive coverage planned.
* References Anderson and Sleath (2001, BoE Working Paper 126).
* Adds **readxl** to Suggests (used only by `boe_curve()`; lazily
  required at call time).

## New: cache helpers

* New `boe_cache_info()`: report cache directory, file count, total
  size, and modification timestamp range. Companion to `clear_cache()`.

## Provenance

* New `boe_tbl` S3 class. All `boe_*()` functions now return data
  frames carrying provenance metadata (series codes, date range,
  frequency, function called, fetch timestamp). Subclasses
  `data.frame` so downstream operations are unaffected.
* New `print.boe_tbl()` method shows a one-line provenance header
  above the data frame body, mirroring the `fred_tbl` pattern in the
  `fred` package.

# boe 0.1.2

* Removed non-existent pkgdown URL from DESCRIPTION.

# boe 0.1.1

* Examples now cache to `tempdir()` instead of the user's home directory,
  fixing CRAN policy compliance for `\donttest` examples.
* Cache directory is now configurable via `options(boe.cache_dir = ...)`.

# boe 0.1.0

* Initial release.
* `boe_get()`: fetch any series by code from the BoE Statistical Database.
* `boe_bank_rate()`: Bank Rate history (daily or monthly, from 1975).
* `boe_sonia()`: SONIA interest rate (daily, monthly, or annual, from 1997).
* `boe_yield_curve()`: nominal and real gilt yields at 5yr, 10yr, 20yr
  maturities (from 1985/1993).
* `boe_exchange_rate()`: daily sterling exchange rates for 27 currencies
  (from 1975).
* `list_exchange_rates()`: catalogue of available currency codes.
* `boe_mortgage_rates()`: quoted mortgage rates (2yr/3yr/5yr fixed, SVR,
  from 1995).
* `boe_mortgage_approvals()`: monthly mortgage approvals for house purchase
  (from 1993).
* `boe_consumer_credit()`: consumer credit outstanding by type (from 1993).
* `boe_money_supply()`: M4 broad money amounts outstanding (from 1982).
* `clear_cache()`: delete locally cached data files.
