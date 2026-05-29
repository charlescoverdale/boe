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

  Character. `"february"`, `"may"`, `"august"`, or `"november"`. If
  `NULL`, the most recent quarterly release is used.

- year:

  Integer. MPR year, 2019 or later. If `NULL`, the most recent quarterly
  release is used.

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

## Older releases

Pre-2025 MPRs are packaged differently and do not contain a single
"Projections Databank" workbook. This function targets the post-2025
format and may error on older releases.

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
#> ℹ Downloading may 2026 MPR archive
#> Error in value[[3L]](cond): Download failed.
#> ℹ Check the "may" 2026 release exists, and your network connection.
#> ✖ HTTP 404 Not Found.
#> ✖ Downloading may 2026 MPR archive [284ms]
#> 
# }
```
