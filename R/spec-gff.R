#' GFF files
#'
#' see \url{http://gmod.org/wiki/GFF3} for format details. does not handle fasta
#' containing files. For GFF2 spec see:
#' \url{http://www.sanger.ac.uk/resources/software/gff/spec.html#t_2}.
#'
#' @format Tab-delimited genomic interval file.
spec_gff <- function() {
  list(
    tokenizer = readr::tokenizer_delim('\t', na = '.')
  )
}

# subtypes ----------------------------------------------------------------

spec_gff_gff2 <- function() {
  list(
    col_names = c(
      "seqname",
      "source",
      "feature",
      "start",
      "end",
      "score",
      "strand",
      "frame",
      "attribute"
    ),
    col_types = col("ccciidccc")
  )
}

spec_gff_gff3 <- function() {
  list(
    col_names = c(
      "seqid",
      "source",
      "type",
      "start",
      "end",
      "score",
      "strand",
      "phase",
      "attributes"
    ),
    col_types = col("ccciidccc")
  )
}
