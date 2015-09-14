#' BioGRID TAB 2.0 files
#'
#' see \url{http://wiki.thebiogrid.org/doku.php/biogrid_tab_version_2.0} for
#' format details.
#'
#' @format Tab-delimited file format from BioGRID.
spec_biogrid <- function() {
  list(
    tokenizer = readr::tokenizer_delim('\t', na = '-')
  )
}

# subtypes ----------------------------------------------------------------

spec_biogrid_tab2i <- function() {
  list(
    col_names = c(
      "biogrid_interaction_id",
      "a.entrez_gene_id",
      "b.entrez_gene_id",
      "a.biogrid_id",
      "b.biogrid_id",
      "a.systematic_name",
      "b.systematic_name",
      "a.official_symbol",
      "b.official_symbol",
      "a.synonyms",
      "b.synonyms",
      "experimental_system_name",
      "experimental_system_type",
      "first_author_surname",
      "pubmed_id",
      "a.organism_id",
      "b.organism_id",
      "interaction_throughput",
      "quantitative_score",
      "post_translational_modification",
      "phenotypes",
      "qualifications",
      "tags",
      "source_database"
    ),
    col_types = col("iiiiiccccccccciiicdccccc")
  )
}

spec_biogrid_tab2c <- function() {
  list(
    col_names = c(
      "biogrid_complex_id",
      "entrez_gene_id",
      "biogrid_id",
      "systematic_name",
      "official_symbol",
      "synonyms",
      "experimental_system_name",
      "experimental_system_type",
      "first_author_surname",
      "pubmed_id",
      "biogrid_publication_id",
      "organism_id",
      "organism_name",
      "interaction_throughput",
      "quantitative_score",
      "post_translational_modification",
      "ontology_class",
      "ontology_terms",
      "ontology_qualifiers",
      "ontology_types",
      "qualifications",
      "tags",
      "source_database"
    ),
    col_types = col("iiicccccciciccdcccccccc")
  )
}
