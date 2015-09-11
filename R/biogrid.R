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
  l <- switch(type,
                 tab2i = skel_biogrid_tab2i(),
                 tab2c = skel_biogrid_tab2c(),
                 stop("type not currently supported."))
  
  structure(
    list(
      file = file,
      tokenizer = readr::tokenizer_tsv(na = '-'),
      col_names = names(l),
      col_types = setNames(l, NULL),
      locale = readr::default_locale(),
      skip = 0L,
      n_max = -1L,
      progress = interactive(),
      n_fields = length(l)),
    class = "input_list")
}

#' TAB2.0 interaction file
skel_biogrid_tab2i <- function() {
  list(
    "biogrid_interaction_id" = readr::col_integer(), 
    "a.entrez_gene_id" = readr::col_integer(), 
    "b.entrez_gene_id" = readr::col_integer(), 
    "a.biogrid_id" = readr::col_integer(), 
    "b.biogrid_id" = readr::col_integer(),
    "a.systematic_name" = readr::col_character(), 
    "b.systematic_name" = readr::col_character(),
    "a.official_symbol" = readr::col_character(),
    "b.official_symbol" = readr::col_character(),
    "a.synonyms" = readr::col_character(),
    "b.synonyms" = readr::col_character(),
    "experimental_system_name" = readr::col_character(),
    "experimental_system_type" = readr::col_character(),
    "first_author_surname" = readr::col_character(), 
    "pubmed_id" = readr::col_integer(),
    "a.organism_id" = readr::col_integer(),
    "b.organism_id" = readr::col_integer(), 
    "interaction_throughput" = readr::col_character(), 
    "quantitative_score" = readr::col_double(),
    "post_translational_modification" = readr::col_character(),
    "phenotypes" = readr::col_character(),
    "qualifications" = readr::col_character(),
    "tags" = readr::col_character(),
    "source_database" = readr::col_character())
}

#' TAB2.0 complex file
skel_biogrid_tab2c <- function() {
  list(
    "biogrid_complex_id" = readr::col_integer(), 
    "entrez_gene_id" = readr::col_integer(), 
    "biogrid_id" = readr::col_integer(), 
    "systematic_name" = readr::col_character(), 
    "official_symbol" = readr::col_character(),
    "synonyms" = readr::col_character(),
    "experimental_system_name" = readr::col_character(),
    "experimental_system_type" = readr::col_character(),
    "first_author_surname" = readr::col_character(), 
    "pubmed_id" = readr::col_integer(),
    "biogrid_publication_id" = readr::col_character(),
    "organism_id" = readr::col_integer(),
    "organism_name" = readr::col_character(),
    "interaction_throughput" = readr::col_character(), 
    "quantitative_score" = readr::col_double(),
    "post_translational_modification" = readr::col_character(),
    "ontology_class" = readr::col_character(),
    "ontology_terms" = readr::col_character(),
    "ontology_qualifiers" = readr::col_character(),
    "ontology_types" = readr::col_character(),
    "qualifications" = readr::col_character(),
    "tags" = readr::col_character(),
    "source_database" = readr::col_character())
}