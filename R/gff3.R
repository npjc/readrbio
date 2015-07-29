#' read in a gff3 file
#'
#' see \url{http://gmod.org/wiki/GFF3} for format details.
#' Wraps \code{\link{read_tsv}} and guesses how many lines to skip.
#'
#' N.B. currently has limited support for FASTA section containing gff3s.
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
  rd <- infer_data_records(file, delim = '\t', n_fields = 9)
  readr::read_tsv(file = file, skip = rd$skip, col_names = col_names,
                  col_types = col_types, progress = progress, na = na,
                  n_max = rd$n_max, ...)
}

#' read in a wig file
#'
#' see \url{http://gmod.org/wiki/GBrowse/Uploading_Wiggle_Tracks#Format_Descriptions}
#' for format details.
#' Wraps \code{\link{read_tsv}} and guesses how many lines to skip.
#'
#' N.B. currently only handles wiggle "BED format" type.
#'
#' @param file path to a file.
#' @param col_names passed to \code{\link{read_delim}}'s col_names
#' @param col_types passed to \code{\link{read_delim}}'s col_types
#' @param na passed to \code{\link{read_delim}}'s na
#' @param progress passed to \code{\link{read_delim}}'s progress
#' @param delim passed to \code{\link{read_delim}}'s delim. These can be space
#' or tab delimited so need to test.
#' @param other dots you wish to pass to \code{\link{read_delim}}
#' @examples
#'  \dontrun{
#'  tmp <- "data-raw/wiggle_bedtype.wig.gz"
#'  read_gff3(tmp)
#'  }
#' @export
read_wig <- function(file, col_names = c("seqid", "start", "end", "score"),
                     col_types = "cddd", na = "NA", progress = FALSE,
                     delim = ' ',skip = 1, ...) {
    readr::read_delim(file, delim, na = na, col_names = col_names,
                      col_types = col_types, skip = skip,
                      progress = progress, ...)
  }
