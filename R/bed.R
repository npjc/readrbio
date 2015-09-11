#' read in a bed file
#'
#' see \url{https://genome.ucsc.edu/FAQ/FAQformat.html} for format details.
#'
#' @inheritParams readr::datasource
#' @param type one of c("bed3", "bed4", "bed6", "bed12"). N.B. only "bed6" 
#'  currently.
#' @return  3, 4, 6, or 12 variable tbl_df and data.frame.
#' @export
#' @examples
#' \dontrun{
#'  # literal string
#'  st <- "chr3R 2 37 yfg 0.13859536 +\n"
#'  read_bed(st)
#'  
#'  # local file, may be compressed
#'  read_bed("data-raw/three_col.bed")
#'  read_bed("data-raw/four_col.bed.gz")
#'  
#'  # or you could borow an internet
#'  }
read_bed <- function(file, type = "bed6") {
  stopifnot(type == "bed6")
  skel_bed(file) %>% 
    infer_skip() %>% 
    do_read()
}

#' make a skeleton input list for a bed file.
#'
#' @inheritParams readr::datasource
#' @return input_list: a named list of arguments relevant to read_* functions.
#' @keywords internal
skel_bed <- function(file) {
  structure(
    list(
      file = file,
      tokenizer = readr::tokenizer_delim(' '),
      col_names = c("chrom", 
                    "chromStart", 
                    "chromEnd", 
                    "name",
                    "score",
                    "strand"),
                    # "thickStart",
                    # "thickEnd",
                    # "itemRgb",
                    # "blockCount",
                    # "blockSizes",
                    # "blockStarts"),
      col_types = list(
        readr::col_character(), 
        readr::col_integer(), 
        readr::col_integer(),
        readr::col_character(),
        readr::col_double(),
        readr::col_character()),
        # readr::col_integer(),
        # readr::col_integer(),
        # readr::col_character(),
        # readr::col_integer(),
        # readr::col_character(),
        # readr::col_character()),
      locale = readr::default_locale(),
      skip = 0L,
      n_max = -1L,
      progress = interactive(),
      n_fields = 6L),
    class = "input_list")
}