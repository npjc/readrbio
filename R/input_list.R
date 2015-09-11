#' read delimited file with using a named list of arguments.
#'
#' @inheritParams infr_skip
#' @keywords internal
do_read <- function(.il) {
  stopifnot(is_input_list(.il))
  do.call(readr:::read_delimited, .il)
}

is_input_list <- function(x) {
  inherits(x, "input_list")
}