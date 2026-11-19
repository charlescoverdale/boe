# utils.R — internal helpers for BoE API access + caching

BOE_API <- "https://www.bankofengland.co.uk/boeapps/database/_iadb-fromshowcolumns.asp"

#' Fetch series from the Bank of England Interactive Statistical Database
#'
#' @param series_codes Character vector of BoE series codes.
#' @param from Date or character. Start date (inclusive).
#' @param to Date or character. End date (inclusive). Defaults to today.
#' @param cache Logical. Use cached response if available?
#' @return A data frame with columns: date, code, value.
#' @noRd
boe_fetch <- function(series_codes, from, to = Sys.Date(), cache = TRUE) {
  from <- as.Date(from)
  to   <- as.Date(to)
  if (from > to) {
    cli::cli_abort("{.arg from} ({.val {from}}) must be before {.arg to} ({.val {to}}).")
  }

  from_str <- format_boe_date(from)
  to_str   <- format_boe_date(to)
  codes    <- paste(series_codes, collapse = ",")

  url <- paste0(
    BOE_API,
    "?csv.x=yes",
    "&Datefrom=", from_str,
    "&Dateto=", to_str,
    "&SeriesCodes=", codes,
    "&UsingCodes=Y",
    "&CSVF=TN"
  )

  path <- download_cached_boe(url, cache = cache)
  parse_boe_csv(path, series_codes)
}

#' Format a date for the BoE API (DD/Mon/YYYY)
#' @noRd
format_boe_date <- function(x) {
  if (is.character(x)) {
    x <- as.Date(x)
  }
  format(x, "%d/%b/%Y")
}

#' Parse BoE CSV response into a tidy data frame
#' @noRd
parse_boe_csv <- function(path, expected_codes) {
  lines <- readLines(path, warn = FALSE)

  # BoE returns an HTML error page for invalid series

  if (length(lines) == 0 || any(grepl("<title>Error</title>", lines, ignore.case = TRUE))) {
    cli::cli_abort(c(
      "The Bank of England returned an error.",
      "i" = "Check that your series codes are valid: {.val {expected_codes}}"
    ))
  }

  # Filter out blank lines
  lines <- lines[nzchar(trimws(lines))]
  if (length(lines) < 2) {
    cli::cli_abort("No data returned for series: {.val {expected_codes}}")
  }

  raw <- utils::read.csv(text = paste(lines, collapse = "\n"),
                          stringsAsFactors = FALSE, check.names = FALSE)

  if (nrow(raw) == 0) {
    cli::cli_abort("No data returned for series: {.val {expected_codes}}")
  }

  # First column is DATE; remaining columns are series codes
  date_col <- raw[[1]]
  dates    <- as.Date(trimws(date_col), format = "%d %b %Y")

  code_cols <- names(raw)[-1]
  results <- list()

  for (col in code_cols) {
    vals <- suppressWarnings(as.numeric(raw[[col]]))
    results[[length(results) + 1]] <- data.frame(
      date  = dates,
      code  = col,
      value = vals,
      stringsAsFactors = FALSE
    )
  }

  out <- do.call(rbind, results)
  # Drop rows with NA dates or values (from mixed-frequency gaps)
  out <- out[!is.na(out$date) & !is.na(out$value), ]
  rownames(out) <- NULL
  out
}

#' Get the cache directory, respecting the boe.cache_dir option
#' @noRd
boe_cache_dir <- function() {
  getOption("boe.cache_dir", default = tools::R_user_dir("boe", "cache"))
}

#' Download a URL with local caching
#'
#' Cached responses expire after `boe.cache_ttl_h` hours (default 720,
#' i.e. 30 days) so that BoE revisions eventually reach queries pinned
#' to a fixed date range. Queries whose `to` date is today produce a new
#' URL (and so a fresh download) each day regardless of the TTL. Set
#' `options(boe.cache_ttl_h = Inf)` to keep cached files indefinitely,
#' e.g. to freeze inputs for a reproducible run.
#' @noRd
download_cached_boe <- function(url, cache = TRUE) {
  cache_dir  <- boe_cache_dir()
  ext        <- ".csv"
  cache_file <- file.path(cache_dir, paste0(digest_url_boe(url), ext))
  ttl_h      <- getOption("boe.cache_ttl_h", default = 720)

  if (cache && file.exists(cache_file)) {
    age_h <- as.numeric(difftime(Sys.time(),
                                 file.info(cache_file)$mtime,
                                 units = "hours"))
    if (age_h < ttl_h) {
      cli::cli_progress_step("Using cached data")
      return(cache_file)
    }
  }

  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  cli::cli_progress_step("Downloading from Bank of England")

  boe_perform_download(url, cache_file, timeout = 60, throttle = TRUE)

  cache_file
}

#' Perform a download to `path`, reporting failures informatively
#'
#' The single request path for every file download in the package. An HTTP
#' error status (e.g. 404 after an upstream move) is reported with its status
#' code and URL; only genuine transport failures (DNS, refused connection,
#' timeout) get the "check your internet connection" hint. A partial file is
#' removed on any failure so it is never mistaken for a cache hit.
#' @noRd
boe_perform_download <- function(url, path, timeout = 60, throttle = FALSE,
                                 offline_hint = "Check your internet connection.") {
  req <- httr2::request(url) |>
    httr2::req_user_agent("boe R package (https://github.com/charlescoverdale/boe)")
  if (throttle) req <- httr2::req_throttle(req, rate = 5 / 10)
  req <- req |>
    httr2::req_retry(
      max_tries    = 3,
      is_transient = function(resp) httr2::resp_status(resp) %in% c(429L, 503L)
    ) |>
    httr2::req_timeout(timeout) |>
    httr2::req_error(is_error = function(resp) FALSE)

  resp <- tryCatch(
    httr2::req_perform(req, path = path),
    error = function(e) {
      if (file.exists(path)) unlink(path)
      cli::cli_abort(c(
        "Download failed for {.url {url}}.",
        "i" = offline_hint,
        "x" = conditionMessage(e)
      ), call = NULL)
    }
  )

  status <- httr2::resp_status(resp)
  if (status >= 400L) {
    if (file.exists(path)) unlink(path)
    cli::cli_abort(c(
      "Bank of England server returned HTTP {status} {httr2::resp_status_desc(resp)}.",
      "i" = "URL: {.url {url}}",
      "i" = if (status == 404L) "The file may have moved or been withdrawn upstream."
    ), class = "boe_http_error", call = NULL)
  }

  invisible(path)
}

#' Simple URL hash for cache filenames
#' @noRd
digest_url_boe <- function(url) {
  chars    <- utf8ToInt(url)
  weights  <- seq_along(chars)
  checksum <- sum(as.numeric(chars) * weights) %% (2^31 - 1)
  sprintf("%010.0f_%04d", as.numeric(checksum), nchar(url) %% 10000L)
}

#' Validate and parse date arguments
#' @noRd
parse_date_arg <- function(x, arg_name = "from") {
  if (is.null(x)) return(NULL)
  if (inherits(x, "Date")) return(x)
  d <- tryCatch(as.Date(x), error = function(e) NA)
  if (is.na(d)) {
    cli::cli_abort("{.arg {arg_name}} must be a valid date (e.g. {.val 2020-01-01}).")
  }
  d
}
