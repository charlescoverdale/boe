# Wide panel of BoE yield curve at chosen pillar maturities

Convenience wrapper around
[`boe_curve()`](https://charlescoverdale.github.io/boe/reference/boe_curve.md)
that returns a wide-format panel: one row per date, one column per
requested pillar maturity. This is the form most users want for
time-series modelling and quick plotting.

## Usage

``` r
boe_curve_panel(
  curve = c("nominal", "real", "inflation", "ois", "blc"),
  measure = c("spot", "forward"),
  frequency = c("daily", "monthly"),
  from = NULL,
  to = NULL,
  maturities = c(0.5, 1, 2, 5, 10, 20),
  cache = TRUE,
  cache_ttl_h = NULL
)
```

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

- maturities:

  Numeric vector of pillar maturities in years. Defaults to
  `c(0.5, 1, 2, 5, 10, 20)`.

- cache:

  Logical. Use cached download if available and within the TTL window
  (default `TRUE`).

- cache_ttl_h:

  Numeric. Cache time-to-live in hours. When `NULL` (default) the TTL is
  24 hours for the latest-month zip and 720 hours (30 days) for archive
  zips.

## Value

A `boe_tbl` data frame with columns `date` and one numeric column per
pillar named like `m0.5`, `m1`, `m2`, `m5`, `m10`, `m20`.

## Details

For each requested pillar, the function picks the published maturity
closest to the request (within a 0.05-year tolerance) and uses that. The
published BoE grid steps in 0.5-year increments, so pillars at integer
or half-integer years align exactly.

## See also

Other interest rates:
[`boe_bank_rate()`](https://charlescoverdale.github.io/boe/reference/boe_bank_rate.md),
[`boe_curve()`](https://charlescoverdale.github.io/boe/reference/boe_curve.md),
[`boe_sonia()`](https://charlescoverdale.github.io/boe/reference/boe_sonia.md),
[`boe_yield_curve()`](https://charlescoverdale.github.io/boe/reference/boe_yield_curve.md)

## Examples

``` r
# \donttest{
if (requireNamespace("readxl", quietly = TRUE)) {
  op <- options(boe.cache_dir = tempdir())
  panel <- boe_curve_panel(
    curve   = "nominal",
    measure = "spot",
    from    = "2020-01-01",
    maturities = c(2, 5, 10, 20)
  )
  head(panel)
  options(op)
}
#> ℹ Using cached nominal daily yield-curve archive
#> ✔ Using cached nominal daily yield-curve archive [6ms]
#> 
# }
```
