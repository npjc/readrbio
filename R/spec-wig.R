#' WIGGLE track files
#'
#' see \url{http://gmod.org/wiki/GBrowse/Uploading_Wiggle_Tracks#Format_Descriptions}
#' for format details. does not handle fasta containing files.
#'
#' @format space-delimited dense genomic signal file.
spec_wig <- function() {
  list(
    tokenizer = readr::tokenizer_delim(' ')
  )
}

# subtypes ----------------------------------------------------------------

spec_wig_bed <- function() {
  list(
    col_names = c(
      "seqid",
      "start",
      "end",
      "score"
    ),
    col_types = col("ciid")
  )
}
