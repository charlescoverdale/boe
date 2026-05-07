# Inspect the local BoE cache

Reports the cache directory, number of cached files, total size, and
oldest / newest modification timestamps. Prints a short summary and
returns the underlying values invisibly.

## Usage

``` r
boe_cache_info()
```

## Value

Invisibly, a list with elements:

- path:

  Character. Cache directory.

- n_files:

  Integer. Number of cached files.

- total_size_bytes:

  Numeric. Total size on disk (bytes).

- oldest:

  POSIXct. Modification time of oldest file (or `NA` if cache is empty).

- newest:

  POSIXct. Modification time of newest file (or `NA` if cache is empty).

## Details

The cache directory defaults to `tools::R_user_dir("boe", "cache")` and
can be overridden with `options(boe.cache_dir = ...)`.

## See also

[`clear_cache()`](https://charlescoverdale.github.io/boe/reference/clear_cache.md)

## Examples

``` r
# \donttest{
op <- options(boe.cache_dir = tempdir())
boe_cache_info()
#> BoE cache
#> • Path: /tmp/Rtmp7zSjyC
#> • Files: 4
#> • Size: 119.8 KB
#> • Range: 2026-05-07 20:57:16 to 2026-05-07 20:57:22
options(op)
# }
```
