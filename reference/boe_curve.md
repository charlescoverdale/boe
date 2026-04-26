# Download the BoE Anderson-Sleath fitted yield curves

Downloads the Bank of England's published fitted yield curves at all
maturities (typically 0.5 to 25 or 40 years) using the Anderson and
Sleath (2001) smoothing methodology. Returns the latest month's daily
data covering the four published curves: nominal gilt, real
(index-linked) gilt, implied inflation, and overnight index swap (OIS).

## Usage

``` r
boe_curve(
  curve = c("nominal", "real", "inflation", "ois"),
  measure = c("spot", "forward"),
  cache = TRUE
)
```

## Source

<https://www.bankofengland.co.uk/statistics/yield-curves>

## Arguments

- curve:

  Character. Which curve to fetch. One of `"nominal"`, `"real"`,
  `"inflation"`, or `"ois"`. Defaults to `"nominal"`.

- measure:

  Character. `"spot"` (default) or `"forward"`.

- cache:

  Logical. Use cached download if available and less than 24 hours old
  (default `TRUE`).

## Value

A `boe_tbl` data frame with columns:

- date:

  Date. Observation date.

- maturity_years:

  Numeric. Maturity in years.

- rate_pct:

  Numeric. Yield or implied rate (percent).

## Details

Coverage is limited to the latest published month. Historical archive
loading is planned for a subsequent release.

Requires the readxl package. The data is published as an Excel workbook
inside a zip archive at
<https://www.bankofengland.co.uk/statistics/yield-curves>.

## References

Anderson, N. and Sleath, J. (2001). New estimates of the UK real and
nominal yield curves. *Bank of England Working Paper No. 126.*
<https://www.bankofengland.co.uk/working-paper/2001/new-estimates-of-the-uk-real-and-nominal-yield-curves>

## See also

Other interest rates:
[`boe_bank_rate()`](https://charlescoverdale.github.io/boe/reference/boe_bank_rate.md),
[`boe_sonia()`](https://charlescoverdale.github.io/boe/reference/boe_sonia.md),
[`boe_yield_curve()`](https://charlescoverdale.github.io/boe/reference/boe_yield_curve.md)

## Examples

``` r
# \donttest{
if (requireNamespace("readxl", quietly = TRUE)) {
  op <- options(boe.cache_dir = tempdir())
  # Latest nominal spot curve at all maturities
  curve <- boe_curve(curve = "nominal", measure = "spot")
  head(curve)
  options(op)
}
#> ℹ Downloading yield curve archive from Bank of England
#> ✔ Downloading yield curve archive from Bank of England [220ms]
#> 
# }
```
