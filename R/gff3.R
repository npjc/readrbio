#' read in a gff3 file
#'
#' see \url{http://gmod.org/wiki/GFF3} for format details. does not handle fasta
#' containing files.
#'
#' @inheritParams readr::datasource
#' @return 9 variable tbl_df and data.frame.
#' @export
#' @examples
#'  # literal string
#'  st <- "3R\treg\tbind_site\t46748\t48137\t0.499\t.\t.\tID=enr_reg_1\n"
#'  read_gff3(st)
#'  \dontrun{
#'  # local file, may be compressed
#'  read_gff3("../data-raw/file.gff3")
#'  read_gff3("../data-raw/file.gff3.gz")
#'  
#'  # or you could borow an internet
#'  }
read_gff3 <- function(file) {
  skel_gff3(file) %>% 
    infer_skip() %>% 
    do_read()
}

#' make a skeleton input list for a gff3 file.
#'
#' @inheritParams readr::datasource
#' @return input_list: a named list of arguments relevant to read_* functions.
#' @keywords internal
skel_gff3 <- function(file) {
  structure(
    list(
      file = file,
      tokenizer = readr::tokenizer_tsv(),
      col_names = c("seqid", 
                    "source", 
                    "type", 
                    "start", 
                    "end", 
                    "score", 
                    "strand", 
                    "phase", 
                    "attributes"),
      col_types = list(
        readr::col_character(), 
        readr::col_character(), 
        readr::col_character(),
        readr::col_integer(), 
        readr::col_integer(), 
        readr::col_double(),
        readr::col_character(), 
        readr::col_character(), 
        readr::col_character()),
      locale = readr::default_locale(),
      skip = 0L,
      n_max = -1L,
      progress = interactive(),
      n_fields = 9L),
    class = "input_list")
}