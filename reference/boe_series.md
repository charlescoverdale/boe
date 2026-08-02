# Catalogue of BoE series wrapped by this package

A reference data frame of Bank of England Statistical Database series
codes for which the package provides a named convenience function. Used
by
[`boe_search()`](https://charlescoverdale.github.io/boe/reference/boe_search.md)
and
[`boe_browse()`](https://charlescoverdale.github.io/boe/reference/boe_browse.md).

## Usage

``` r
boe_series
```

## Format

A data frame with 8 columns:

- code:

  Character. BoE series code (e.g. `"IUDBEDR"`).

- title:

  Character. Human-readable description.

- category:

  Character. Topic grouping. One of `"interest_rates"`,
  `"exchange_rates"`, `"mortgage_market"`, `"consumer_credit"`,
  `"monetary_aggregates"`.

- frequency:

  Character. Native publication frequency (`"daily"`, `"monthly"`,
  `"annual"`).

- unit:

  Character. Unit of measurement (`"percent"`, `"millions_gbp"`,
  `"currency_per_gbp"`, `"index"`, `"count"`).

- start_date:

  Date. Earliest available observation date.

- seasonal_adjustment:

  Character or `NA`. `"SA"`, `"NSA"`, or `NA` if not applicable.

- helper:

  Character. Convenience function in the package that wraps the series.

## Source

<https://www.bankofengland.co.uk/boeapps/database/>

## Examples

``` r
head(boe_series)
#>      code                                                                 title
#> 1 LPMB4TS                Consumer credit outstanding excl student loans (other)
#> 2 LPMBI2O                Consumer credit outstanding excl student loans (total)
#> 3 LPMVZRI Consumer credit outstanding incl student loans (total, annual update)
#> 4 LPMVZRJ                            Consumer credit outstanding (credit cards)
#> 5 LPMVZRK Consumer credit outstanding incl student loans (other, annual update)
#> 6 XUDLADS                                 GBP/AUD spot rate (Australian Dollar)
#>          category frequency             unit start_date seasonal_adjustment
#> 1 consumer_credit   monthly     millions_gbp 1993-04-01                  SA
#> 2 consumer_credit   monthly     millions_gbp 1993-04-01                  SA
#> 3 consumer_credit   monthly     millions_gbp 1993-04-01                  SA
#> 4 consumer_credit   monthly     millions_gbp 1993-04-01                  SA
#> 5 consumer_credit   monthly     millions_gbp 1993-04-01                  SA
#> 6  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#>                helper
#> 1 boe_consumer_credit
#> 2 boe_consumer_credit
#> 3 boe_consumer_credit
#> 4 boe_consumer_credit
#> 5 boe_consumer_credit
#> 6   boe_exchange_rate
table(boe_series$category)
#> 
#>     consumer_credit      exchange_rates      interest_rates monetary_aggregates 
#>                   5                  27                  14                   2 
#>     mortgage_market 
#>                   6 
```
