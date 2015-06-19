#' read in a gff3 file
#'
#' see \url{http://gmod.org/wiki/GFF3} for format details.
#' Wraps \code{\link{read_tsv}} and guesses how many lines to skip.
#'
#' @param file path to a file.
#' @param col_names passed to \code{\link{read_tsv}}'s col_names
#' @param col_types passed to \code{\link{read_tsv}}'s col_types
#' @param na passed to \code{\link{read_tsv}}'s na
#' @param progress passed to \code{\link{read_tsv}}'s na
#' @param other dots you wish to pass to \code{\link{read_tsv}}
#' @examples
#'  \dontrun{
#'  tmp <- "data-raw/file.gff3.gz"
#'  read_gff3(tmp)
#'  }
#' @export
read_gff3 <- function(file, col_names = c("seqid", "source", "type", "start",
                                          "end", "score", "strand", "phase",
                                          "attributes"),
                      col_types = "cccdddccc", na = '.', progress = FALSE, ...) {
  skip <- get_first_line(file, delim = '\t') - 1
  readr::read_tsv(file = file, skip = skip, col_names = col_names,
                  col_types = col_types, progress = progress, na = na, ...)
}

