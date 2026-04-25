# Search the BoE series catalogue

Filters the
[boe_series](https://charlescoverdale.github.io/boe/reference/boe_series.md)
catalogue by keyword and optional category and frequency. Useful for
finding a series code without leaving R. Equivalent to a `grepl` against
the title and code columns.

## Usage

``` r
boe_search(query = NULL, category = NULL, frequency = NULL)
```

## Arguments

- query:

  Character. Keyword(s) to match against the `title` and `code` columns.
  Case-insensitive substring match. If `NULL`, returns all rows (subject
  to other filters).

- category:

  Character. Optional filter on the `category` column, one or more of
  `"interest_rates"`, `"exchange_rates"`, `"mortgage_market"`,
  `"consumer_credit"`, `"monetary_aggregates"`.

- frequency:

  Character. Optional filter on the `frequency` column, one or more of
  `"daily"`, `"monthly"`, `"annual"`.

## Value

A data frame with the same columns as
[boe_series](https://charlescoverdale.github.io/boe/reference/boe_series.md),
restricted to matching rows.

## See also

[`boe_browse()`](https://charlescoverdale.github.io/boe/reference/boe_browse.md),
[boe_series](https://charlescoverdale.github.io/boe/reference/boe_series.md)

Other discovery:
[`boe_browse()`](https://charlescoverdale.github.io/boe/reference/boe_browse.md)

## Examples

``` r
# Find mortgage-related series
boe_search("mortgage")
#>      code                                       title        category frequency
#> 1 IUMBV34 Quoted 2-year fixed-rate mortgage (75% LTV) mortgage_market   monthly
#> 2 IUMBV37 Quoted 3-year fixed-rate mortgage (75% LTV) mortgage_market   monthly
#> 3 IUMBV42 Quoted 5-year fixed-rate mortgage (75% LTV) mortgage_market   monthly
#> 4 IUMTLMV      Quoted standard variable rate mortgage mortgage_market   monthly
#> 5 LPMVTVU Mortgage approvals for house purchase (NSA) mortgage_market   monthly
#> 6 LPMVTVX  Mortgage approvals for house purchase (SA) mortgage_market   monthly
#>      unit start_date seasonal_adjustment                 helper
#> 1 percent 1995-01-01                <NA>     boe_mortgage_rates
#> 2 percent 1995-01-01                <NA>     boe_mortgage_rates
#> 3 percent 1995-01-01                <NA>     boe_mortgage_rates
#> 4 percent 1995-01-01                <NA>     boe_mortgage_rates
#> 5   count 1993-04-01                 NSA boe_mortgage_approvals
#> 6   count 1993-04-01                  SA boe_mortgage_approvals

# All daily interest-rate series
boe_search(category = "interest_rates", frequency = "daily")
#>       code                                     title       category frequency
#> 1  IUDBEDR                         Bank Rate (daily) interest_rates     daily
#> 2  IUDLNPY         20-year nominal par yield (gilts) interest_rates     daily
#> 3  IUDLNZC 20-year nominal zero-coupon yield (gilts) interest_rates     daily
#> 4  IUDLRZC    20-year real zero-coupon yield (gilts) interest_rates     daily
#> 5  IUDMNPY         10-year nominal par yield (gilts) interest_rates     daily
#> 6  IUDMNZC 10-year nominal zero-coupon yield (gilts) interest_rates     daily
#> 7  IUDMRZC    10-year real zero-coupon yield (gilts) interest_rates     daily
#> 8  IUDSNPY          5-year nominal par yield (gilts) interest_rates     daily
#> 9  IUDSNZC  5-year nominal zero-coupon yield (gilts) interest_rates     daily
#> 10 IUDSOIA                             SONIA (daily) interest_rates     daily
#> 11 IUDSRZC     5-year real zero-coupon yield (gilts) interest_rates     daily
#>       unit start_date seasonal_adjustment          helper
#> 1  percent 1975-01-02                <NA>   boe_bank_rate
#> 2  percent 2000-01-04                <NA> boe_yield_curve
#> 3  percent 1985-01-02                <NA> boe_yield_curve
#> 4  percent 1985-01-02                <NA> boe_yield_curve
#> 5  percent 2000-01-04                <NA> boe_yield_curve
#> 6  percent 1985-01-02                <NA> boe_yield_curve
#> 7  percent 1985-01-02                <NA> boe_yield_curve
#> 8  percent 2000-01-04                <NA> boe_yield_curve
#> 9  percent 1985-01-02                <NA> boe_yield_curve
#> 10 percent 1997-01-02                <NA>       boe_sonia
#> 11 percent 1985-01-02                <NA> boe_yield_curve

# Locate the Bank Rate code
boe_search("bank rate")
#>       code                       title       category frequency    unit
#> 1  IUDBEDR           Bank Rate (daily) interest_rates     daily percent
#> 2 IUMABEDR Bank Rate (monthly average) interest_rates   monthly percent
#>   start_date seasonal_adjustment        helper
#> 1 1975-01-02                <NA> boe_bank_rate
#> 2 1975-01-01                <NA> boe_bank_rate
```
