#' Infer how many rows to skip.
#' 
#' Infer a skip parameter by comparing the number of fields in the first 100 
#' rows to the number of data fields expected.
#' @param .il input_list. see \code{skel_*} functions.
#' @keywords internal
infer_skip <- function(.il) {
  stopifnot(is_input_list(.il))
  cnts <- readr::count_fields(.il$file, .il$tokenizer, n_max = 100L)
  .il$skip <- which(cnts == .il$n_fields)[[1]] - 1
  .il$n_fields <- NULL
  .il
}

#' Infer the name of the sequence, chromosome, or scaffold.
#' 
#' the name of a chromosome should not contain "chr". this removes it if present
#' 
#' @param tbl data.frame to pass in
#' @param col the column to infer and mutate if necessary.
#' @export
infer_seqid <- function(tbl, col = NULL) {
  if (is.null(col)) col <- names(tbl)[1]
  dots <- setNames(list(~gsub("chr", "", col)),col)
  dplyr::mutate_(tbl, .dots = dots)
}