# Browse the BoE series catalogue

Returns the catalogue with optional category or frequency filters.
Equivalent to `boe_search(query = NULL, category, frequency)` but framed
as a browse / inspect action rather than a keyword search.

## Usage

``` r
boe_browse(category = NULL, frequency = NULL)
```

## Arguments

- category:

  Character. Optional filter on the `category` column, one or more of
  `"interest_rates"`, `"exchange_rates"`, `"mortgage_market"`,
  `"consumer_credit"`, `"monetary_aggregates"`.

- frequency:

  Character. Optional filter on the `frequency` column, one or more of
  `"daily"`, `"monthly"`, `"annual"`.

## Value

A data frame with the same columns as
[boe_series](https://charlescoverdale.github.io/boe/reference/boe_series.md).

## See also

[`boe_search()`](https://charlescoverdale.github.io/boe/reference/boe_search.md),
[boe_series](https://charlescoverdale.github.io/boe/reference/boe_series.md)

Other discovery:
[`boe_search()`](https://charlescoverdale.github.io/boe/reference/boe_search.md)

## Examples

``` r
# The whole catalogue
nrow(boe_browse())
#> [1] 52

# All exchange rate series
boe_browse(category = "exchange_rates")
#>        code                                                      title
#> 1   XUDLADS                      GBP/AUD spot rate (Australian Dollar)
#> 2  XUDLB8KL                         GBP/BRL spot rate (Brazilian Real)
#> 3  XUDLBK27                           GBP/CZK spot rate (Czech Koruna)
#> 4  XUDLBK35                       GBP/HUF spot rate (Hungarian Forint)
#> 5  XUDLBK47                           GBP/PLN spot rate (Polish Zloty)
#> 6  XUDLBK65                         GBP/ILS spot rate (Israeli Shekel)
#> 7  XUDLBK67 GBP/ERI spot rate (Sterling Effective Exchange Rate Index)
#> 8  XUDLBK83                      GBP/MYR spot rate (Malaysian Ringgit)
#> 9  XUDLBK87                              GBP/THB spot rate (Thai Baht)
#> 10 XUDLBK89                           GBP/CNY spot rate (Chinese Yuan)
#> 11 XUDLBK93                       GBP/KRW spot rate (South Korean Won)
#> 12 XUDLBK95                           GBP/TRY spot rate (Turkish Lira)
#> 13 XUDLBK97                           GBP/INR spot rate (Indian Rupee)
#> 14  XUDLCDS                        GBP/CAD spot rate (Canadian Dollar)
#> 15  XUDLDKS                           GBP/DKK spot rate (Danish Krone)
#> 16  XUDLERS                                   GBP/EUR spot rate (Euro)
#> 17  XUDLGBD                              GBP/USD spot rate (US Dollar)
#> 18  XUDLHDS                       GBP/HKD spot rate (Hong Kong Dollar)
#> 19  XUDLJYS                           GBP/JPY spot rate (Japanese Yen)
#> 20  XUDLNDS                     GBP/NZD spot rate (New Zealand Dollar)
#> 21  XUDLNKS                        GBP/NOK spot rate (Norwegian Krone)
#> 22  XUDLSFS                            GBP/CHF spot rate (Swiss Franc)
#> 23  XUDLSGS                       GBP/SGD spot rate (Singapore Dollar)
#> 24  XUDLSKS                          GBP/SEK spot rate (Swedish Krona)
#> 25  XUDLSRS                            GBP/SAR spot rate (Saudi Riyal)
#> 26  XUDLTWS                          GBP/TWD spot rate (Taiwan Dollar)
#> 27  XUDLZRS                     GBP/ZAR spot rate (South African Rand)
#>          category frequency             unit start_date seasonal_adjustment
#> 1  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 2  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 3  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 4  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 5  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 6  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 7  exchange_rates     daily            index 1975-01-02                <NA>
#> 8  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 9  exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 10 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 11 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 12 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 13 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 14 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 15 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 16 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 17 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 18 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 19 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 20 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 21 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 22 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 23 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 24 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 25 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 26 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#> 27 exchange_rates     daily currency_per_gbp 1975-01-02                <NA>
#>               helper
#> 1  boe_exchange_rate
#> 2  boe_exchange_rate
#> 3  boe_exchange_rate
#> 4  boe_exchange_rate
#> 5  boe_exchange_rate
#> 6  boe_exchange_rate
#> 7  boe_exchange_rate
#> 8  boe_exchange_rate
#> 9  boe_exchange_rate
#> 10 boe_exchange_rate
#> 11 boe_exchange_rate
#> 12 boe_exchange_rate
#> 13 boe_exchange_rate
#> 14 boe_exchange_rate
#> 15 boe_exchange_rate
#> 16 boe_exchange_rate
#> 17 boe_exchange_rate
#> 18 boe_exchange_rate
#> 19 boe_exchange_rate
#> 20 boe_exchange_rate
#> 21 boe_exchange_rate
#> 22 boe_exchange_rate
#> 23 boe_exchange_rate
#> 24 boe_exchange_rate
#> 25 boe_exchange_rate
#> 26 boe_exchange_rate
#> 27 boe_exchange_rate

# All monthly series
boe_browse(frequency = "monthly")
#>        code                                       title            category
#> 1   LPMVZRI         Consumer credit outstanding (total)     consumer_credit
#> 2   LPMVZRJ  Consumer credit outstanding (credit cards)     consumer_credit
#> 3   LPMVZRK         Consumer credit outstanding (other)     consumer_credit
#> 4  IUMABEDR                 Bank Rate (monthly average)      interest_rates
#> 5  IUMASOIA                     SONIA (monthly average)      interest_rates
#> 6   LPMAUYM                M4 amounts outstanding (NSA) monetary_aggregates
#> 7   LPMAUYN                 M4 amounts outstanding (SA) monetary_aggregates
#> 8   IUMBV34 Quoted 2-year fixed-rate mortgage (75% LTV)     mortgage_market
#> 9   IUMBV37 Quoted 3-year fixed-rate mortgage (75% LTV)     mortgage_market
#> 10  IUMBV42 Quoted 5-year fixed-rate mortgage (75% LTV)     mortgage_market
#> 11  IUMTLMV      Quoted standard variable rate mortgage     mortgage_market
#> 12  LPMVTVU Mortgage approvals for house purchase (NSA)     mortgage_market
#> 13  LPMVTVX  Mortgage approvals for house purchase (SA)     mortgage_market
#>    frequency         unit start_date seasonal_adjustment                 helper
#> 1    monthly millions_gbp 1993-04-01                  SA    boe_consumer_credit
#> 2    monthly millions_gbp 1993-04-01                  SA    boe_consumer_credit
#> 3    monthly millions_gbp 1993-04-01                  SA    boe_consumer_credit
#> 4    monthly      percent 1975-01-01                <NA>          boe_bank_rate
#> 5    monthly      percent 1997-01-01                <NA>              boe_sonia
#> 6    monthly millions_gbp 1982-06-01                 NSA       boe_money_supply
#> 7    monthly millions_gbp 1982-06-01                  SA       boe_money_supply
#> 8    monthly      percent 1995-01-01                <NA>     boe_mortgage_rates
#> 9    monthly      percent 1995-01-01                <NA>     boe_mortgage_rates
#> 10   monthly      percent 1995-01-01                <NA>     boe_mortgage_rates
#> 11   monthly      percent 1995-01-01                <NA>     boe_mortgage_rates
#> 12   monthly        count 1993-04-01                 NSA boe_mortgage_approvals
#> 13   monthly        count 1993-04-01                  SA boe_mortgage_approvals
```
