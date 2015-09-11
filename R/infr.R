#' Infer how many rows to skip.
#' 
#' Infer a skip parameter by comparing the number of fields in the first n 
#' rows to the number of data fields expected.
#' 
#' @param .il input_list. see \code{skel_*} functions.
#' @param .n integer. infer using first \code{.n} lines.
#' @keywords internal
infr_skip <- function(.il, .n = 100L) {
  stopifnot(is_input_list(.il))
  cnts <- readr::count_fields(.il$file, .il$tokenizer, skip = 0L, n_max = .n)
  fields <- which(cnts == .il$n_fields)
  if (length(fields) == 0) {
    stop("only unexpected number of fields found in the first ", 
         length(cnts)," rows:\n",
         "row: ", paste0(seq_along(cnts), collapse = ", "),"\n",
         "cnt: ", paste0(cnts, collapse = ", "), call. = FALSE)
  } else {
    skip <- fields[[1]] - 1
  }
  .il$skip <- skip
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
infr_seqid <- function(tbl, col = NULL) {
  col <- col %||% names(tbl)[1]
  dots <- setNames(list(
    lazyeval::interp(~gsub("chr", "", var), var = as.name(col))),
    nm = col)
  dplyr::mutate_(tbl, .dots = dots)
}