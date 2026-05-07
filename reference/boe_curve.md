# Download BoE Anderson-Sleath fitted yield curves

Downloads the Bank of England's published fitted yield curves at all
maturities (typically 0.5 to 25 or 40 years) using the Anderson and
Sleath (2001) smoothing methodology. Five curves are supported: nominal
gilt, real (index-linked) gilt, implied inflation, overnight index swap
(OIS), and the commercial bank liability curve (BLC).

## Usage

``` r
boe_curve(
  curve = c("nominal", "real", "inflation", "ois", "blc"),
  measure = c("spot", "forward"),
  frequency = c("daily", "monthly"),
  from = NULL,
  to = NULL,
  cache = TRUE,
  cache_ttl_h = NULL
)
```

## Source

<https://www.bankofengland.co.uk/statistics/yield-curves>

## Arguments

- curve:

  Character. Which curve to fetch. One of `"nominal"`, `"real"`,
  `"inflation"`, `"ois"`, or `"blc"`. Defaults to `"nominal"`. The
  commercial bank liability curve (`"blc"`) is only published in the
  historical archive zip, so requests for it always route through the
  archive path regardless of `from` / `to`.

- measure:

  Character. `"spot"` (default) or `"forward"`.

- frequency:

  Character. `"daily"` (default) or `"monthly"`. Monthly archives are
  end-of-month observations and are much smaller files.

- from, to:

  Date or character ("YYYY-MM-DD"). Optional inclusive bounds. When
  either is set, the function uses the BoE archive zip (multi-decade
  history) and filters by date.

- cache:

  Logical. Use cached download if available and within the TTL window
  (default `TRUE`).

- cache_ttl_h:

  Numeric. Cache time-to-live in hours. When `NULL` (default) the TTL is
  24 hours for the latest-month zip and 720 hours (30 days) for archive
  zips.

## Value

A `boe_tbl` data frame with columns:

- date:

  Date. Observation date.

- maturity_years:

  Numeric. Maturity in years.

- rate_pct:

  Numeric. Yield or implied rate (percent).

## Details

By default (`from = NULL`, `to = NULL`, `frequency = "daily"`) returns
the latest published month of daily data, matching the behaviour of
earlier releases of this package. Setting `from`, `to`, or `frequency`
switches to the BoE's full archive, which goes back to 1979 for nominal
gilts, 1985 for real, 2000 for BLC, and 2009 for OIS.

Requires the readxl package. Data is published as Excel workbooks inside
zip archives at
<https://www.bankofengland.co.uk/statistics/yield-curves>. Each archive
zip contains multiple per-period workbooks; this function concatenates
them transparently.

## References

Anderson, N. and Sleath, J. (2001). New estimates of the UK real and
nominal yield curves. *Bank of England Working Paper No. 126.*
<https://www.bankofengland.co.uk/working-paper/2001/new-estimates-of-the-uk-real-and-nominal-yield-curves>

## See also

Other interest rates:
[`boe_bank_rate()`](https://charlescoverdale.github.io/boe/reference/boe_bank_rate.md),
[`boe_curve_panel()`](https://charlescoverdale.github.io/boe/reference/boe_curve_panel.md),
[`boe_sonia()`](https://charlescoverdale.github.io/boe/reference/boe_sonia.md),
[`boe_yield_curve()`](https://charlescoverdale.github.io/boe/reference/boe_yield_curve.md)

## Examples

``` r
# \donttest{
if (requireNamespace("readxl", quietly = TRUE)) {
  op <- options(boe.cache_dir = tempdir())
  # Latest nominal spot curve at all maturities (default behaviour)
  curve <- boe_curve(curve = "nominal", measure = "spot")
  head(curve)

  # Historical: 10-year nominal spot back to 2010
  long <- boe_curve(curve = "nominal", from = "2010-01-01")
  range(long$date)

  # End-of-month real curve since 1990 (small download)
  real_m <- boe_curve(curve = "real", frequency = "monthly",
                      from = "1990-01-01")
  options(op)
}
#> ℹ Downloading yield curve archive from Bank of England
#> ✔ Downloading yield curve archive from Bank of England [176ms]
#> 
#> ℹ Downloading nominal daily yield-curve archive from Bank of England
#> ✔ Downloading nominal daily yield-curve archive from Bank of England [211ms]
#> 
#> ℹ Downloading real monthly yield-curve archive from Bank of England
#> ✔ Downloading real monthly yield-curve archive from Bank of England [71ms]
#> 
# }
```
