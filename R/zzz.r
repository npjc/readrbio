#' Convenience functions for reading biological file formats.
#'
#' @section Formats of interest:
#' \itemize{
#'  \item GFF3
#'  \item WIG
#' }
#' @docType package
#' @name readrbio
NULL

.onAttach <- function(...) {
  packageStartupMessage("Beginner developer minions about. ",
                        "Be on the lookout. ")
}
