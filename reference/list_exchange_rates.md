# List available exchange rate currencies

Returns a data frame of currency codes and descriptions available from
the Bank of England exchange rate series.

## Usage

``` r
list_exchange_rates()
```

## Value

A data frame with columns:

- currency:

  Character. ISO currency code.

- description:

  Character. Currency name.

- boe_code:

  Character. BoE series code.

## Examples

``` r
list_exchange_rates()
#>    currency                            description boe_code
#> 1       USD                              US Dollar  XUDLGBD
#> 2       EUR                                   Euro  XUDLERS
#> 3       JPY                           Japanese Yen  XUDLJYS
#> 4       CHF                            Swiss Franc  XUDLSFS
#> 5       AUD                      Australian Dollar  XUDLADS
#> 6       CAD                        Canadian Dollar  XUDLCDS
#> 7       NZD                     New Zealand Dollar  XUDLNDS
#> 8       SEK                          Swedish Krona  XUDLSKS
#> 9       NOK                        Norwegian Krone  XUDLNKS
#> 10      DKK                           Danish Krone  XUDLDKS
#> 11      CNY                           Chinese Yuan XUDLBK89
#> 12      INR                           Indian Rupee XUDLBK97
#> 13      HKD                       Hong Kong Dollar  XUDLHDS
#> 14      SGD                       Singapore Dollar  XUDLSGS
#> 15      KRW                       South Korean Won XUDLBK93
#> 16      ZAR                     South African Rand  XUDLZRS
#> 17      TRY                           Turkish Lira XUDLBK95
#> 18      PLN                           Polish Zloty XUDLBK47
#> 19      CZK                           Czech Koruna XUDLBK27
#> 20      HUF                       Hungarian Forint XUDLBK35
#> 21      ILS                         Israeli Shekel XUDLBK65
#> 22      SAR                            Saudi Riyal  XUDLSRS
#> 23      THB                              Thai Baht XUDLBK87
#> 24      TWD                          Taiwan Dollar  XUDLTWS
#> 25      BRL                         Brazilian Real XUDLB8KL
#> 26      MYR                      Malaysian Ringgit XUDLBK83
#> 27      ERI Sterling Effective Exchange Rate Index XUDLBK67
```
