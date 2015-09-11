#' read in a BioGRID TAB 2.0 file
#'
#' see \url{http://wiki.thebiogrid.org/doku.php/biogrid_tab_version_2.0} for 
#' format details.
#'
#' @inheritParams readr::datasource
#' @inheritParams skel_biogrid
#' @return 24 or 23 variable tbl_df and data.frame.
#' @export
read_biogrid <- function(file, type = "tab2i") {
  skel_biogrid(file, type) %>% 
    infr_skip() %>% 
    do_read()
}

#' make a skeleton input list for a BioGRID TAB 2.0 file.
#'
#' @inheritParams readr::datasource
#' @param type The type of bed file. One of \code{c("tab2i", "tab2c")}. 
#' @return input_list: a named list of arguments relevant to read_* functions.
#' @keywords internal
skel_biogrid <- function(file, type) {
  # arbitrary switch
  spec <- switch(type,
                 tab2i = spec_biogrid_tab2i(),
                 tab2c = spec_biogrid_tab2c(),
                 stop("type not currently supported."))
  
  skeletonize(file, spec, readr::tokenizer_tsv(na = '-'))
}
