# Monetary Policy Report forecast data

Downloads the Bank of England's Monetary Policy Report (MPR) and parses
headline projections from the Projections Databank workbook. Returns a
long-format data frame where each row is one (publication date, forecast
horizon, series) triple.

## Usage

``` r
boe_mpr_forecasts(
  series = c("cpi_inflation", "gdp_growth", "gdp_level", "unemployment", "bank_rate"),
  month = NULL,
  year = NULL,
  cache = TRUE
)
```

## Source

<https://www.bankofengland.co.uk/monetary-policy>

## Arguments

- series:

  Character vector. One or more of: `"cpi_inflation"`, `"gdp_growth"`,
  `"gdp_level"`, `"unemployment"`, `"bank_rate"`. Defaults to all five.

- month:

  Character. Publication month of the report, e.g. `"february"` or
  `"may"`. The report is published roughly quarterly, but the exact
  month drifts between years (for example, the second 2026 report
  appeared in April, not May), so any month name is accepted and its
  existence is verified against the Bank's website. Supply with `year`.
  If both are `NULL`, the most recent compatible release is selected
  automatically.

- year:

  Integer. MPR year, 2019 or later. Supply with `month`. If both are
  `NULL`, the most recent compatible release is selected automatically.

- cache:

  Logical. Use cached download if available (default `TRUE`). Older
  releases never change so the cache never expires; the latest release
  is refreshed if older than 24 hours.

## Value

A `boe_tbl` data frame with columns:

- date:

  Date. Publication date of the MPR (start of quarter the report
  covers).

- horizon:

  Character. Forecast horizon label (e.g. `"2026 Q1"`).

- horizon_date:

  Date. Start of the forecast quarter.

- series:

  Character. Series identifier (e.g. `"cpi_inflation"`).

- value:

  Numeric. Forecast value (percent for rates and growth; index for
  `gdp_level`).

## Details

Coverage runs quarterly from November 2019 (when the report was renamed
from Inflation Report) to the latest published release.

Requires the readxl package. The MPR is published as a zip archive
containing a Projections Databank workbook plus chart data and slides;
this function only reads the projection sheets.

Each row of a projection sheet is one MPR publication; columns are
forecast quarters. The same publication therefore contributes multiple
rows here, one per forecast horizon.

## Release format and automatic fallback

From the April 2026 report the Bank moved to a scenario-based "Scenario
Projections Databank" with a transposed layout (following the Bernanke
review of forecasting). That format is not parsed by this function yet.
When automatic selection encounters such a release it skips it, falls
back to the most recent compatible release (the classic "Projections
Databank" workbook), and warns. Requesting a scenario-format release
explicitly via `month`/`year` raises a clear error. Pre-2020 MPRs that
predate the single "Projections Databank" workbook may also error.

## See also

[`boe_mpc_decisions()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_decisions.md),
[`boe_mpc_votes()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_votes.md)

Other monetary policy:
[`boe_mpc_decisions()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_decisions.md),
[`boe_mpc_votes()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_votes.md)

## Examples

``` r
# \donttest{
if (requireNamespace("readxl", quietly = TRUE)) {
  op <- options(boe.cache_dir = tempdir())

  # Latest CPI inflation projections
  cpi <- boe_mpr_forecasts(series = "cpi_inflation")
  head(cpi)

  options(op)
}
#> ℹ Downloading April 2026 MPR archive
#> ✔ Downloading April 2026 MPR archive [150ms]
#> 
#> ℹ Downloading February 2026 MPR archive
#> ✔ Downloading February 2026 MPR archive [154ms]
#> 
#> Warning: ! Skipping newer MPR release(s) in the Bank of England's new scenario-based
#>   format, not parsed by `boe_mpr_forecasts()` yet: "April 2026".
#> ℹ Returning the most recent compatible release: February 2026.
# }
```
