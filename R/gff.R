#' read in a gff(3) file
#'
#' see \url{http://gmod.org/wiki/GFF3} for format details. does not handle fasta
#' containing files.
#'
#' @inheritParams readr::datasource
#' @inheritParams skel_gff
#' @return 9 variable tbl_df and data.frame.
#' @export
#' @examples
#'  # literal string
#'  st <- "3R\treg\tbind_site\t46748\t48137\t0.499\t.\t.\tID=enr_reg_1\n"
#'  read_gff(st)
#'  \dontrun{
#'  # local file, may be compressed
#'  read_gff("../data-raw/file.gff3")
#'  read_gff("../data-raw/file.gff3.gz")
#'  
#'  # or you could borow an internet
#'  }
read_gff <- function(file, type = "gff3") {
  skel_gff(file, type) %>% 
    infr_skip() %>% 
    do_read()
}

#' make a skeleton input list for a gff3 file.
#'
#' @inheritParams readr::datasource
#' @param type The type of bed file. One of \code{c("gff3", "gff2")}. 
#' N.B. only "gff3" currently supported.
#' @return input_list: a named list of arguments relevant to read_* functions.
#' @keywords internal
skel_gff <- function(file, type) {
  spec <- switch(type,
         gff3 = spec_gff_gff3(),
         stop("type not currently supported."))
  
  skeletonize(file, spec, readr::tokenizer_tsv())
}
