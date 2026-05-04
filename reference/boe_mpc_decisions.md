# Bank Rate decision history

Returns the history of Monetary Policy Committee decisions to change
Bank Rate, derived from the daily Bank Rate series. Each row is one
rate-change event, showing the effective date, the new rate, the
previous rate, and the change in basis points. Holds (meetings where the
rate was unchanged) are not included; for the full meeting-level record
including holds, see
[`boe_mpc_votes()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_votes.md).

## Usage

``` r
boe_mpc_decisions(from = "1997-06-06", to = Sys.Date(), cache = TRUE)
```

## Source

Derived from BoE series `IUDBEDR` (daily Bank Rate). See
<https://www.bankofengland.co.uk/monetary-policy>.

## Arguments

- from:

  Date or character. Start date. Defaults to `"1997-06-06"` (the first
  MPC meeting).

- to:

  Date or character. End date. Defaults to today.

- cache:

  Logical. Use cached Bank Rate data if available (default `TRUE`).

## Value

A `boe_tbl` data frame with columns:

- date:

  Date. Effective date of the rate change.

- new_rate_pct:

  Numeric. Bank Rate after the decision (percent).

- prev_rate_pct:

  Numeric. Bank Rate before the decision (percent).

- change_bps:

  Integer. Change in basis points (positive = hike, negative = cut).

- direction:

  Character. `"hike"` or `"cut"`.

## See also

[`boe_bank_rate()`](https://charlescoverdale.github.io/boe/reference/boe_bank_rate.md),
[`boe_mpc_votes()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_votes.md)

Other monetary policy:
[`boe_mpc_votes()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_votes.md),
[`boe_mpr_forecasts()`](https://charlescoverdale.github.io/boe/reference/boe_mpr_forecasts.md)

## Examples

``` r
# \donttest{
op <- options(boe.cache_dir = tempdir())
# All MPC decisions since the global financial crisis
boe_mpc_decisions(from = "2007-01-01")
#> ℹ Downloading from Bank of England
#> ✔ Downloading from Bank of England [666ms]
#> 
#> # BoE [boe_mpc_decisions]: 1 series [IUDBEDR] · 37 obs · 2007-01-01 to 2026-05-04 · freq=decision
#>          date new_rate_pct prev_rate_pct change_bps direction
#> 1  2007-01-11         5.25          5.00         25      hike
#> 2  2007-05-10         5.50          5.25         25      hike
#> 3  2007-07-05         5.75          5.50         25      hike
#> 4  2007-12-06         5.50          5.75        -25       cut
#> 5  2008-02-07         5.25          5.50        -25       cut
#> 6  2008-04-10         5.00          5.25        -25       cut
#> 7  2008-10-08         4.50          5.00        -50       cut
#> 8  2008-11-06         3.00          4.50       -150       cut
#> 9  2008-12-04         2.00          3.00       -100       cut
#> 10 2009-01-08         1.50          2.00        -50       cut
#> 11 2009-02-05         1.00          1.50        -50       cut
#> 12 2009-03-05         0.50          1.00        -50       cut
#> 13 2016-08-04         0.25          0.50        -25       cut
#> 14 2017-11-02         0.50          0.25         25      hike
#> 15 2018-08-02         0.75          0.50         25      hike
#> 16 2020-03-11         0.25          0.75        -50       cut
#> 17 2020-03-19         0.10          0.25        -15       cut
#> 18 2021-12-16         0.25          0.10         15      hike
#> 19 2022-02-03         0.50          0.25         25      hike
#> 20 2022-03-17         0.75          0.50         25      hike
#> 21 2022-05-05         1.00          0.75         25      hike
#> 22 2022-06-16         1.25          1.00         25      hike
#> 23 2022-08-04         1.75          1.25         50      hike
#> 24 2022-09-22         2.25          1.75         50      hike
#> 25 2022-11-03         3.00          2.25         75      hike
#> 26 2022-12-15         3.50          3.00         50      hike
#> 27 2023-02-02         4.00          3.50         50      hike
#> 28 2023-03-23         4.25          4.00         25      hike
#> 29 2023-05-11         4.50          4.25         25      hike
#> 30 2023-06-22         5.00          4.50         50      hike
#> 31 2023-08-03         5.25          5.00         25      hike
#> 32 2024-08-01         5.00          5.25        -25       cut
#> 33 2024-11-07         4.75          5.00        -25       cut
#> 34 2025-02-06         4.50          4.75        -25       cut
#> 35 2025-05-08         4.25          4.50        -25       cut
#> 36 2025-08-07         4.00          4.25        -25       cut
#> 37 2025-12-18         3.75          4.00        -25       cut

# Just decisions in 2024 to date
boe_mpc_decisions(from = "2024-01-01")
#> ℹ Downloading from Bank of England
#> ✔ Downloading from Bank of England [343ms]
#> 
#> # BoE [boe_mpc_decisions]: 1 series [IUDBEDR] · 6 obs · 2024-01-01 to 2026-05-04 · freq=decision
#>         date new_rate_pct prev_rate_pct change_bps direction
#> 1 2024-08-01         5.00          5.25        -25       cut
#> 2 2024-11-07         4.75          5.00        -25       cut
#> 3 2025-02-06         4.50          4.75        -25       cut
#> 4 2025-05-08         4.25          4.50        -25       cut
#> 5 2025-08-07         4.00          4.25        -25       cut
#> 6 2025-12-18         3.75          4.00        -25       cut
options(op)
# }
```
