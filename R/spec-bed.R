#' BED files.
#'
#' see \url{https://genome.ucsc.edu/FAQ/FAQformat.html} for format details.
#' N.B. chrom, chromStart, chromEnd != seqid, start, end.
#'
#' @format Tab-delimited file genomic interval format.
spec_bed <- function() {
  list(
    tokenizer = readr::tokenizer_delim('\t')
  )
}

# subtypes ----------------------------------------------------------------

# the different bed types are just subsets of the full 12-column bed spec.
spec_bed_bed3 <- function() {
  list(
    col_names = spec_bed_bed12()$col_names[1:3],
    col_types =  spec_bed_bed12()$col_types[1:3]
  )
}

spec_bed_bed4 <- function() {
  list(
    col_names = spec_bed_bed12()$col_names[1:4],
    col_types = spec_bed_bed12()$col_types[1:4]
  )
}

spec_bed_bed6 <- function() {
  list(
    col_names = spec_bed_bed12()$col_names[1:6],
    col_types = spec_bed_bed12()$col_types[1:6]
  )
}

spec_bed_bed12 <- function() {
  list(
    col_names = c(
      "chrom",
      "chromStart",
      "chromEnd",
      "name",
      "score",
      "strand",
      "thickStart",
      "thinkEnd",
      "itemRgb",
      "blockCount",
      "blockSizes",
      "blockStart"
    ),
    col_types = col("ciicdciicicc")
  )
}
