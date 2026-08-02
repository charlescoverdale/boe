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

  Character vector of series to return. The five traditional series are
  the default: `"cpi_inflation"`, `"gdp_growth"`, `"gdp_level"`,
  `"unemployment"`, and `"bank_rate"`. From the April 2026 report the
  Bank also publishes scenario paths for `"output_gap"`,
  `"energy_prices"`, `"average_earnings"`, and `"world_export_prices"`,
  which can be requested explicitly. Series not published in a given
  release are skipped with a warning: the scenario-only series are
  absent from classic releases (February 2026 and earlier), and the
  April 2026 scenario-format release drops `"gdp_level"` and
  `"bank_rate"`. Hybrid releases (July 2026 onward) publish all nine.

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

  Date. Publication date of the MPR release.

- horizon:

  Character. Quarter label (e.g. `"2026 Q1"`).

- horizon_date:

  Date. Start of the quarter.

- series:

  Character. Series identifier (e.g. `"cpi_inflation"`).

- scenario:

  Character. Scenario or vintage label in the scenario-based format
  (e.g. `"April 2026 Scenario A"`); `NA` in the classic format, which
  carries a single central projection.

- value:

  Numeric. Forecast value (percent for rates and growth; index for
  `gdp_level`).

## Details

Coverage runs quarterly from November 2019 (when the report was renamed
from Inflation Report) to the latest published release.

Requires the readxl package. The MPR is published as a zip archive
containing a projections databank workbook plus chart data and slides;
this function reads only the projection sheets.

In the classic format (up to February 2026) each row of a projection
sheet is one MPR publication and the columns are forecast quarters, so
the function returns one row per publication and horizon with a single
central projection (`scenario` is `NA`). In the scenario-based format
(April 2026) each sheet holds one series with the quarters down the rows
and one column per scenario, so the function returns the full quarterly
path (history and projection) for every scenario, tagged in the
`scenario` column. Hybrid releases (July 2026 onward) carry both:
central projections for all publications (`scenario` is `NA`) plus the
current report's scenario paths (labelled, e.g. `"Adverse Scenario"`),
in one output.

## Release format

Following the Bernanke review of forecasting, the Bank replaced the
single central projection of the classic "Projections Databank" with a
scenario-based "Scenario Projections Databank" in the April 2026 report,
then merged the two from the July 2026 report into one hybrid workbook
holding both the classic central-projection sheets (GDP level and Bank
Rate restored) and a "Quarterly scenarios" section. All three layouts
are parsed and share the same output columns; the format is detected
automatically from the release. The April 2026 release alone lacks a GDP
level and Bank Rate sheet (Bank Rate was published as a conditioning
assumption), so those two series are skipped with a warning for that
release. Pre-2020 MPRs that predate the single databank workbook may
error.

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

  # Latest CPI inflation projections. In the scenario-based format
  # this returns one path per scenario (see the `scenario` column).
  cpi <- boe_mpr_forecasts(series = "cpi_inflation")
  head(cpi)

  options(op)
}
#> ℹ Downloading July 2026 MPR archive
#> ✔ Downloading July 2026 MPR archive [3.4s]
#> 
# }
```
