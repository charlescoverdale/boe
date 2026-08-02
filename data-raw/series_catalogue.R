## Catalogue of BoE series wrapped by this package.
## Run this script to regenerate `data/boe_series.rda`.
##
##   Rscript data-raw/series_catalogue.R
##
## Each row documents a BoE series code that the package can fetch
## either through a named convenience function or through `boe_get()`.
## Categories: interest_rates, exchange_rates, mortgage_market,
## consumer_credit, monetary_aggregates.

interest_rates <- data.frame(
  code = c(
    "IUDBEDR", "IUMABEDR",
    "IUDSOIA", "IUMASOIA", "IUAASOIA",
    "IUDSNPY", "IUDMNPY", "IUDLNPY",
    "IUDSNZC", "IUDMNZC", "IUDLNZC",
    "IUDSRZC", "IUDMRZC", "IUDLRZC"
  ),
  title = c(
    "Bank Rate (daily)",
    "Bank Rate (monthly average)",
    "SONIA (daily)",
    "SONIA (monthly average)",
    "SONIA (annual average)",
    "5-year nominal par yield (gilts)",
    "10-year nominal par yield (gilts)",
    "20-year nominal par yield (gilts)",
    "5-year nominal zero-coupon yield (gilts)",
    "10-year nominal zero-coupon yield (gilts)",
    "20-year nominal zero-coupon yield (gilts)",
    "5-year real zero-coupon yield (gilts)",
    "10-year real zero-coupon yield (gilts)",
    "20-year real zero-coupon yield (gilts)"
  ),
  category = "interest_rates",
  frequency = c(
    "daily", "monthly",
    "daily", "monthly", "annual",
    "daily", "daily", "daily",
    "daily", "daily", "daily",
    "daily", "daily", "daily"
  ),
  unit = "percent",
  start_date = as.Date(c(
    "1975-01-02", "1975-01-01",
    "1997-01-02", "1997-01-01", "1997-01-01",
    "2000-01-04", "2000-01-04", "2000-01-04",
    "1985-01-02", "1985-01-02", "1985-01-02",
    "1985-01-02", "1985-01-02", "1985-01-02"
  )),
  seasonal_adjustment = NA_character_,
  helper = c(
    "boe_bank_rate", "boe_bank_rate",
    "boe_sonia", "boe_sonia", "boe_sonia",
    rep("boe_yield_curve", 9L)
  ),
  stringsAsFactors = FALSE
)

fx_codes <- c(
  "USD" = "XUDLGBD", "EUR" = "XUDLERS", "JPY" = "XUDLJYS", "CHF" = "XUDLSFS",
  "AUD" = "XUDLADS", "CAD" = "XUDLCDS", "NZD" = "XUDLNDS", "SEK" = "XUDLSKS",
  "NOK" = "XUDLNKS", "DKK" = "XUDLDKS", "CNY" = "XUDLBK89", "INR" = "XUDLBK97",
  "HKD" = "XUDLHDS", "SGD" = "XUDLSGS", "KRW" = "XUDLBK93", "ZAR" = "XUDLZRS",
  "TRY" = "XUDLBK95", "PLN" = "XUDLBK47", "CZK" = "XUDLBK27", "HUF" = "XUDLBK35",
  "ILS" = "XUDLBK65", "SAR" = "XUDLSRS", "THB" = "XUDLBK87", "TWD" = "XUDLTWS",
  "BRL" = "XUDLB8KL", "MYR" = "XUDLBK83", "ERI" = "XUDLBK67"
)
fx_descs <- c(
  "USD" = "US Dollar", "EUR" = "Euro", "JPY" = "Japanese Yen",
  "CHF" = "Swiss Franc", "AUD" = "Australian Dollar", "CAD" = "Canadian Dollar",
  "NZD" = "New Zealand Dollar", "SEK" = "Swedish Krona", "NOK" = "Norwegian Krone",
  "DKK" = "Danish Krone", "CNY" = "Chinese Yuan", "INR" = "Indian Rupee",
  "HKD" = "Hong Kong Dollar", "SGD" = "Singapore Dollar", "KRW" = "South Korean Won",
  "ZAR" = "South African Rand", "TRY" = "Turkish Lira", "PLN" = "Polish Zloty",
  "CZK" = "Czech Koruna", "HUF" = "Hungarian Forint", "ILS" = "Israeli Shekel",
  "SAR" = "Saudi Riyal", "THB" = "Thai Baht", "TWD" = "Taiwan Dollar",
  "BRL" = "Brazilian Real", "MYR" = "Malaysian Ringgit",
  "ERI" = "Sterling Effective Exchange Rate Index"
)

exchange_rates <- data.frame(
  code = unname(fx_codes),
  title = paste0(
    "GBP/", names(fx_codes), " spot rate (",
    fx_descs[names(fx_codes)], ")"
  ),
  category = "exchange_rates",
  frequency = "daily",
  unit = ifelse(names(fx_codes) == "ERI", "index", "currency_per_gbp"),
  start_date = as.Date("1975-01-02"),
  seasonal_adjustment = NA_character_,
  helper = "boe_exchange_rate",
  stringsAsFactors = FALSE
)

mortgage_rates <- data.frame(
  code = c("IUMBV34", "IUMBV37", "IUMBV42", "IUMTLMV"),
  title = c(
    "Quoted 2-year fixed-rate mortgage (75% LTV)",
    "Quoted 3-year fixed-rate mortgage (75% LTV)",
    "Quoted 5-year fixed-rate mortgage (75% LTV)",
    "Quoted standard variable rate mortgage"
  ),
  category = "mortgage_market",
  frequency = "monthly",
  unit = "percent",
  start_date = as.Date("1995-01-01"),
  seasonal_adjustment = NA_character_,
  helper = "boe_mortgage_rates",
  stringsAsFactors = FALSE
)

mortgage_approvals <- data.frame(
  code = c("LPMVTVX", "LPMVTVU"),
  title = c(
    "Mortgage approvals for house purchase (SA)",
    "Mortgage approvals for house purchase (NSA)"
  ),
  category = "mortgage_market",
  frequency = "monthly",
  unit = "count",
  start_date = as.Date("1993-04-01"),
  seasonal_adjustment = c("SA", "NSA"),
  helper = "boe_mortgage_approvals",
  stringsAsFactors = FALSE
)

consumer_credit <- data.frame(
  code = c("LPMBI2O", "LPMVZRJ", "LPMB4TS", "LPMVZRI", "LPMVZRK"),
  title = c(
    "Consumer credit outstanding excl student loans (total)",
    "Consumer credit outstanding (credit cards)",
    "Consumer credit outstanding excl student loans (other)",
    "Consumer credit outstanding incl student loans (total, annual update)",
    "Consumer credit outstanding incl student loans (other, annual update)"
  ),
  category = "consumer_credit",
  frequency = "monthly",
  unit = "millions_gbp",
  start_date = as.Date("1993-04-01"),
  seasonal_adjustment = "SA",
  helper = "boe_consumer_credit",
  stringsAsFactors = FALSE
)

money_supply <- data.frame(
  code = c("LPMAUYN", "LPMAUYM"),
  title = c(
    "M4 amounts outstanding (SA)",
    "M4 amounts outstanding (NSA)"
  ),
  category = "monetary_aggregates",
  frequency = "monthly",
  unit = "millions_gbp",
  start_date = as.Date("1982-06-01"),
  seasonal_adjustment = c("SA", "NSA"),
  helper = "boe_money_supply",
  stringsAsFactors = FALSE
)

boe_series <- rbind(
  interest_rates,
  exchange_rates,
  mortgage_rates,
  mortgage_approvals,
  consumer_credit,
  money_supply
)
boe_series <- boe_series[order(boe_series$category, boe_series$code), ]
rownames(boe_series) <- NULL

usethis::use_data(boe_series, overwrite = TRUE)

cat(sprintf("Wrote %d series across %d categories.\n",
            nrow(boe_series),
            length(unique(boe_series$category))))
