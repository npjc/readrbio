#' Read a delimited file from a file specification
#'
#' @inheritParams infr_skip
#' @export
do_read <- function(file_spec) {
  stopifnot(is.file_spec(file_spec))
  complete_spec <- complete_spec(file_spec)
  do.call(readr:::read_delimited, complete_spec)
}

#' complete a file specification with any unset defaults
#' @inheritParams infr_skip
complete_spec <- function(file_spec) {
  rd_args <- list(file = NULL,
                   tokenizer = NULL,
                   col_names = TRUE,
                   col_types = NULL,
                   locale = readr::default_locale(),
                   skip = 0,
                   n_max = -1L,
                   progress = interactive())
  needed <- setdiff(names(rd_args), names(file_spec))
  c(rd_args[needed], file_spec)
}
