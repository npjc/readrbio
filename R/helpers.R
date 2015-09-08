#' infer data records by expected fields
#' @param file path to file
#' @param delim delimiter of data records in file
#' @param n_fields number of \code{delim} fields (cols) to expect
#' @keywords internal
infer_data_records <- function(file, delim, n_fields) {
  field_counts <- readr::count_fields(file, readr::tokenizer_delim(delim))
  normn_fields <- n_fields
  data_records <- which(field_counts == normn_fields)
  translate_skip_n_max(data_records)
}

#' translate vector of data_records to skip and n_max params.
#'
#' Currently assumes a contiguous data records section
#' @param data_records
#' @keywords internal
translate_skip_n_max <- function(data_records) {
  skip <- min(data_records) - 1
  n_max <- max(data_records) - skip
  list(skip = skip, n_max = n_max)
}
