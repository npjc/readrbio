#' read in a bed file
#'
#' see \url{https://genome.ucsc.edu/FAQ/FAQformat.html} for format details. 
#' N.B. chrom, chromStart, chromEnd != seqid, start, end.
#'
#' @inheritParams readr::datasource
#' @inheritParams skel_bed
#' @return  3, 4, 6, or 12 variable tbl_df and data.frame.
#' @export
#' @examples
#' \dontrun{
#'  # literal string
#'  st <- "chr3R\t2\t37\tyfg\t0.13859536\t+\n"
#'  read_bed(st)
#'  
#'  # local file, may be compressed
#'  read_bed("data-raw/three_col.bed.gz", type = "bed3")
#'  read_bed("data-raw/three_col.bed.gz")
#'  
#'  # or you could borow an internet
#'  }
read_bed <- function(file, type = "bed6") {
  skel_bed(file, type) %>% 
    infr_skip() %>% 
    do_read()
}

#' make a skeleton input list for a bed file.
#'
#' @inheritParams readr::datasource
#' @param type The type of bed file. One of 
#'  \code{c("bed3", "bed4", "bed6", "bed12")}.
#' @return input_list: a named list of arguments relevant to read_* functions.
#' @keywords internal
skel_bed <- function(file, type) {
  # arbitraty switch
  n_cols <- switch (type,
    bed3 = 3L,
    bed4 = 4L,
    bed6 = 6L,
    bed12 = 12L,
    stop("type not currently supported.")
  )
  spec <- spec_bed()[1:n_cols]
  skeletonize(file, spec, readr::tokenizer_tsv())
}