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
#>       code                                      title        category frequency
#> 1  LPMVZRI        Consumer credit outstanding (total) consumer_credit   monthly
#> 2  LPMVZRJ Consumer credit outstanding (credit cards) consumer_credit   monthly
#> 3  LPMVZRK        Consumer credit outstanding (other) consumer_credit   monthly
#> 4  XUDLADS      GBP/AUD spot rate (Australian Dollar)  exchange_rates     daily
#> 5 XUDLB8KL         GBP/BRL spot rate (Brazilian Real)  exchange_rates     daily
#> 6 XUDLBK27           GBP/CZK spot rate (Czech Koruna)  exchange_rates     daily
#>               unit start_date seasonal_adjustment              helper
#> 1     millions_gbp 1993-04-01                  SA boe_consumer_credit
#> 2     millions_gbp 1993-04-01                  SA boe_consumer_credit
#> 3     millions_gbp 1993-04-01                  SA boe_consumer_credit
#> 4 currency_per_gbp 1975-01-02                <NA>   boe_exchange_rate
#> 5 currency_per_gbp 1975-01-02                <NA>   boe_exchange_rate
#> 6 currency_per_gbp 1975-01-02                <NA>   boe_exchange_rate
table(boe_series$category)
#> 
#>     consumer_credit      exchange_rates      interest_rates monetary_aggregates 
#>                   3                  27                  14                   2 
#>     mortgage_market 
#>                   6 
```
