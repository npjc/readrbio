#' get first data line of file
#' @param file path to a file.
#' @param delim delimiter of data records in file. passes to: \code{\link{
#' tokenizer_delim}}
#' @keywords internal
get_first_line <- function(file, delim) {
  tokenizer <- readr::tokenizer_delim(delim)
  fields <- readr::count_fields(file, tokenizer)
  which.max(fields)
}
