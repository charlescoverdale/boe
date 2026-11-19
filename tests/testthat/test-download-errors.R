# Offline regression tests for boe_perform_download(): an HTTP error status
# must be reported with its status and URL, not as a connection failure.

test_that("HTTP 404 is reported with status and URL, not as offline", {
  httr2::local_mocked_responses(function(req) {
    httr2::response(status_code = 404L, url = req$url)
  })
  path <- tempfile(fileext = ".csv")
  url  <- "https://www.bankofengland.co.uk/moved.csv"

  err <- expect_error(boe_perform_download(url, path), class = "boe_http_error")
  msg <- conditionMessage(err)
  expect_match(msg, "404")
  expect_match(msg, "moved.csv", fixed = TRUE)
  expect_no_match(msg, "internet connection")
  expect_false(file.exists(path))
})

test_that("transport failure keeps the connection hint", {
  httr2::local_mocked_responses(function(req) {
    stop("Could not resolve host: www.bankofengland.co.uk")
  })
  path <- tempfile(fileext = ".csv")

  err <- expect_error(
    boe_perform_download("https://www.bankofengland.co.uk/x.csv", path)
  )
  expect_false(inherits(err, "boe_http_error"))
  expect_match(conditionMessage(err), "internet connection")
  expect_false(file.exists(path))
})

test_that("successful response returns the path", {
  httr2::local_mocked_responses(function(req) {
    httr2::response(status_code = 200L, url = req$url, body = charToRaw("a,b\n1,2\n"))
  })
  path <- tempfile(fileext = ".csv")
  expect_identical(
    boe_perform_download("https://www.bankofengland.co.uk/ok.csv", path),
    path
  )
})
