# Build script for offline parser test fixtures.
#
# Run once to (re)generate `synthetic-yield-curve.xlsx`, a tiny
# XLSX that mimics the BoE Anderson-Sleath workbook layout. The
# generated file is committed; tests read it without network.
#
# Usage (run from package root):
#   Rscript tests/testthat/fixtures/build-fixtures.R

if (!requireNamespace("openxlsx", quietly = TRUE)) {
  stop("openxlsx is required to build fixtures: install.packages('openxlsx')")
}

out_path <- file.path("tests", "testthat", "fixtures",
                      "synthetic-yield-curve.xlsx")

# Layout mirrors a real BoE workbook:
#   row 1: title
#   row 2: "Maturity"
#   row 3: months row (formula in real files; literal here)
#   row 4: years row -- the maturity grid the parser reads
#   row 5: blank or FAMEDATE label
#   row 6+: date + rates
maturities <- c(1, 2, 5, 10, 20)
dates <- seq.Date(as.Date("2020-01-31"), by = "month", length.out = 36)

set.seed(42)
n_mat <- length(maturities)
n_obs <- length(dates)
rates <- matrix(round(runif(n_obs * n_mat, min = 0.1, max = 5.0), 4),
                nrow = n_obs, ncol = n_mat)

build_sheet <- function(curve_name) {
  ncol_total <- n_mat + 1L
  total_rows <- 5L + n_obs
  m <- matrix(NA_character_, nrow = total_rows, ncol = ncol_total)
  m[1L, 1L] <- curve_name
  m[2L, 1L] <- "Maturity"
  m[3L, 1L] <- "months:"
  m[3L, 2L:ncol_total] <- as.character(maturities * 12)
  m[4L, 1L] <- "years:"
  m[4L, 2L:ncol_total] <- as.character(maturities)
  m[5L, 1L] <- "FAMEDATE"
  m[5L, 2L:ncol_total] <- "WU_OBJECT1"

  # Excel date serials so the parser's serial-date branch fires
  # (the production parser handles either POSIXt or numeric serials).
  excel_origin <- as.Date("1899-12-30")
  date_serials <- as.numeric(dates - excel_origin)

  for (i in seq_len(n_obs)) {
    m[5L + i, 1L] <- as.character(date_serials[i])
    m[5L + i, 2L:ncol_total] <- as.character(rates[i, ])
  }
  as.data.frame(m, stringsAsFactors = FALSE)
}

wb <- openxlsx::createWorkbook()

openxlsx::addWorksheet(wb, "info")
openxlsx::writeData(wb, "info",
                    data.frame(text = "synthetic fixture for offline tests",
                               stringsAsFactors = FALSE),
                    colNames = FALSE)

openxlsx::addWorksheet(wb, "4. spot curve")
openxlsx::writeData(wb, "4. spot curve",
                    build_sheet("UK nominal spot curve, synthetic"),
                    colNames = FALSE)

openxlsx::addWorksheet(wb, "2. fwd curve")
openxlsx::writeData(wb, "2. fwd curve",
                    build_sheet("UK nominal forward curve, synthetic"),
                    colNames = FALSE)

dir.create(dirname(out_path), recursive = TRUE, showWarnings = FALSE)
openxlsx::saveWorkbook(wb, out_path, overwrite = TRUE)

cat("Wrote ", out_path,
    " (", file.info(out_path)$size, " bytes)\n", sep = "")
