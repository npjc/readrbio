#' WIG bed file spec.
spec_wig_bed <- function() {
  list(
    "seqid" = readr::col_character(), 
    "start" = readr::col_integer(), 
    "end" = readr::col_integer(), 
    "score" = readr::col_double())
}

#' GFF3 file spec.
spec_gff_gff3 <- function() {
  list(
    "seqid" = readr::col_character(), 
    "source" = readr::col_character(), 
    "type" = readr::col_character(),
    "start" = readr::col_integer(), 
    "end" = readr::col_integer(), 
    "score" = readr::col_double(),
    "strand" = readr::col_character(), 
    "phase" = readr::col_character(), 
    "attributes" = readr::col_character())
}

#' BED file spec
spec_bed <- function() {
  list(
    "chrom" = readr::col_character(), 
    "chromStart" = readr::col_integer(), 
    "chromEnd" = readr::col_integer(),
    "name" = readr::col_character(),
    "score" = readr::col_double(),
    "strand" = readr::col_character(),
    "thickStart" = readr::col_integer(),
    "thinkEnd" = readr::col_integer(),
    "itemRgb" = readr::col_character(),
    "blockCount" = readr::col_integer(),
    "blockSizes" = readr::col_character(),
    "blockStart" = readr::col_character())
}

#' TAB2.0 interaction file spec.
spec_biogrid_tab2i <- function() {
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

#' TAB2.0 complex file spec.
spec_biogrid_tab2c <- function() {
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