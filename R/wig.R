#' read in a wig file
#'
#' see \url{http://gmod.org/wiki/GBrowse/Uploading_Wiggle_Tracks#Format_Descriptions} 
#' for format details. does not handle fasta containing files.
#'
#' @inheritParams readr::datasource
#' @param type one of c("bed", "fixed", "variable"). N.B. only "bed" currently.
#' @return 4 variable tbl_df and data.frame.
#' @export
#' @examples
#'  # literal string
#'  st <- "chr3R 2 37 0.13859536\n"
#'  read_wig(st)
#'  
#'  # local file, may be compressed
#'  read_wig("data-raw/wiggle_bedtype.wig")
#'  read_wig("data-raw/wiggle_bedtype.wig.gz")
#'  
#'  # or you could borow an internet
read_wig <- function(file, type = "bed") {
  stopifnot(type == "bed")
  
  skel_wig(file) %>% 
    infer_skip() %>% 
    do_read()
}

#' make a skeleton input list for a wig file.
#'
#' @inheritParams readr::datasource
#' @return input_list: a named list of arguments relevant to read_* functions.
#' @keywords internal
skel_wig <- function(file) {
  structure(
    list(
      file = file,
      tokenizer = readr::tokenizer_delim(' '),
      col_names = c("seqid", 
                    "start", 
                    "end", 
                    "score"),
      col_types = list(
        readr::col_character(), 
        readr::col_integer(), 
        readr::col_integer(), 
        readr::col_double()),
      locale = readr::default_locale(),
      skip = 0L,
      n_max = -1L,
      progress = interactive(),
      n_fields = 4L),
    class = "input_list")
}