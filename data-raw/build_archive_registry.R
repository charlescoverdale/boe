# Verification script: confirms the hardcoded archive URL registry in
# R/yield_archives.R still matches what is published on
# https://www.bankofengland.co.uk/statistics/yield-curves
#
# Run periodically (or trigger from CI). If BoE reorganises their page,
# this script will flag URLs that have moved or returned 404. The
# registry itself is hardcoded in R/yield_archives.R because there are
# only 10 entries and they have been stable since the page was launched.
#
# Usage:
#   Rscript data-raw/build_archive_registry.R

devtools::load_all()

reg <- yield_archive_registry()

flat <- do.call(rbind, lapply(names(reg), function(freq) {
  data.frame(
    frequency = freq,
    curve     = names(reg[[freq]]),
    url       = unlist(reg[[freq]]),
    stringsAsFactors = FALSE
  )
}))
rownames(flat) <- NULL

cat("Registered yield-curve archive URLs:\n")
print(flat, row.names = FALSE)
cat("\n")

cat("Checking each URL with a HEAD request...\n")
results <- vapply(flat$url, function(u) {
  resp <- tryCatch(
    httr2::request(u) |>
      httr2::req_user_agent("boe R package check") |>
      httr2::req_method("HEAD") |>
      httr2::req_timeout(30) |>
      httr2::req_perform(),
    error = function(e) NULL
  )
  if (is.null(resp)) return("ERROR")
  status <- httr2::resp_status(resp)
  sprintf("%d", status)
}, character(1))

flat$status <- results
print(flat, row.names = FALSE)

bad <- flat[!flat$status %in% c("200"), , drop = FALSE]
if (nrow(bad) > 0) {
  cat("\nFAILED URLs:\n")
  print(bad, row.names = FALSE)
  stop("Some yield-curve archive URLs are no longer reachable. ",
       "Inspect https://www.bankofengland.co.uk/statistics/yield-curves ",
       "and update R/yield_archives.R accordingly.")
}

cat("\nAll registered URLs returned 200 OK.\n")
