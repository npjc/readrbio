#' Convenience functions for reading biological file formats.
#'
#' @section Formats of interest:
#' \itemize{
#'  \item BED
#'  \item BIOGRID
#'  \item GFF
#'  \item WIG
#' }
#' @docType package
#' @name readrbio
NULL

.onAttach <- function(...) {
  packageStartupMessage("Beginner minions about. ",
                        "Be on the lookout. ")
}
