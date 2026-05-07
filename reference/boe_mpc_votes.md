# Monetary Policy Committee voting history

Downloads the Bank of England's published MPC voting record and returns
it in long format. Each row is one (meeting, member) pair showing the
rate the member voted for and whether that constituted a dissent from
the committee's decision.

## Usage

``` r
boe_mpc_votes(cache = TRUE)
```

## Source

<https://www.bankofengland.co.uk/monetary-policy>

## Arguments

- cache:

  Logical. Use cached download if less than 24 hours old (default
  `TRUE`). The voting workbook is small (~110 KB).

## Value

A `boe_tbl` data frame with columns:

- date:

  Date. Meeting date.

- member:

  Character. MPC member name.

- member_vote_pct:

  Numeric. The Bank Rate the member voted for (percent).

- decision_pct:

  Numeric. The committee's decision (percent).

- dissent:

  Logical. `TRUE` if the member's vote differed from the committee
  decision.

## Details

Coverage runs from the first MPC meeting in June 1997 through the most
recent published minutes. Both current and past committee members are
included.

Requires the readxl package.

## See also

[`boe_mpc_decisions()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_decisions.md)

Other monetary policy:
[`boe_mpc_decisions()`](https://charlescoverdale.github.io/boe/reference/boe_mpc_decisions.md),
[`boe_mpr_forecasts()`](https://charlescoverdale.github.io/boe/reference/boe_mpr_forecasts.md)

## Examples

``` r
# \donttest{
if (requireNamespace("readxl", quietly = TRUE)) {
  op <- options(boe.cache_dir = tempdir())
  votes <- boe_mpc_votes()

  # Recent dissents
  recent <- subset(votes, dissent & date >= as.Date("2024-01-01"))
  head(recent)

  options(op)
}
#> ℹ Downloading MPC voting record from Bank of England
#> ✔ Downloading MPC voting record from Bank of England [465ms]
#> 
# }
```
