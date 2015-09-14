#' Read a delimited file from a file specification
#'
#' @inheritParams readr::datasource
#' @inheritParams fspec
#' @examples
#' \dontrun{
#'  read_fspec(file = "data-raw/three_col.bed.gz", bed_bed3)
#'  }
#' @export
read_fspec <- function(file, .fspec, .f = readr::read_delim, infr_skip = TRUE) {
  stopifnot(is.fspec(.fspec))
  stopifnot(is.function(.f))
  fspec <- .fspec
  fspec$file <- file
  if (infr_skip)
    fspec <- infr_skip(fspec, .n = 100L, skip_if_start = "#")
  purrr::lift_dl(.f)(fspec)
}
