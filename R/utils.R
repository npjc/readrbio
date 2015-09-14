#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

# b is a is null
`%||%` <- function(a, b) if (!is.null(a)) a else b

# it object exists get it otherwise err.
try_get <- function(x, err = stop("err does not exist.")) {
  if (!exists(x))
    err
  get(x)
}


