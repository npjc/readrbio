#' Infer how many rows to skip.
#'
#' Infer a skip parameter by comparing the number of fields in the first n
#' rows to the number of data fields expected. It also takes into account
#' any rows that begin with a comment-type character; ignoring rows starting
#' with \code{skip_if_start}
#'
#' @param .fspec (named list) forming a file specification.
#' @param .n integer. infer using first \code{.n} lines.
#' @param skip_if_start character. if line starts with this ignore it.
#' @export
infr_skip <- function(.fspec, .n = 100L, skip_if_start = "#") {
  stopifnot(is.fspec(.fspec))
  cnts <- readr::count_fields(.fspec$file, readr::tokenizer_delim(.fspec$delim),
                              skip = 0L, n_max = .n)
  fields <- which(cnts == length(.fspec$col_names))
  if (length(fields) == 0) {
    stop("only unexpected number of fields found in the first ",
         length(cnts)," rows:\n",
         "row: ", paste0(seq_along(cnts), collapse = ", "),"\n",
         "cnt: ", paste0(cnts, collapse = ", "), call. = FALSE)
  } else {
    lines <- readr::read_lines(.fspec$file, skip = 0L, n_max = .n, FALSE)
    lines <- lines[fields]
    keep <- which(substr(lines,0,nchar(skip_if_start)) != skip_if_start)
    fields <- fields[keep]
    skip <- fields[[1]] - 1
  }
  .fspec$skip <- skip
  .fspec
}
