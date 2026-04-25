# Clear locally cached Bank of England data

Removes cached data files downloaded from the Bank of England.

## Usage

``` r
clear_cache(max_age_days = NULL)
```

## Arguments

- max_age_days:

  Numeric or `NULL`. If specified, only removes files older than this
  many days. If `NULL` (the default), removes all cached files.

## Value

Invisibly returns the number of files removed.

## See also

Other data access:
[`boe_get()`](https://charlescoverdale.github.io/boe/reference/boe_get.md)

## Examples

``` r
# \donttest{
op <- options(boe.cache_dir = tempdir())
# Remove files older than 7 days
clear_cache(max_age_days = 7)
#> ℹ No files older than 7 days.

# Remove everything
clear_cache()
#> ✔ Removed 23 cached files.
options(op)
# }
```
