#' WIG bed file spec.
spec_wig_bed <- function() {
  list(
    "seqid" = cl("c"), 
    "start" = cl("i"), 
    "end" = cl("i"), 
    "score" = cl("d"))
}

#' GFF3 file spec.
spec_gff_gff3 <- function() {
  list(
    "seqid" = cl("c"), 
    "source" = cl("c"), 
    "type" = cl("c"),
    "start" = cl("i"), 
    "end" = cl("i"), 
    "score" = cl("d"),
    "strand" = cl("c"), 
    "phase" = cl("c"), 
    "attributes" = cl("c"))
}

#' BED file spec
spec_bed <- function() {
  list(
    "chrom" = cl("c"), 
    "chromStart" = cl("i"), 
    "chromEnd" = cl("i"),
    "name" = cl("c"),
    "score" = cl("d"),
    "strand" = cl("c"),
    "thickStart" = cl("i"),
    "thinkEnd" = cl("i"),
    "itemRgb" = cl("c"),
    "blockCount" = cl("i"),
    "blockSizes" = cl("c"),
    "blockStart" = cl("c"))
}

#' TAB2.0 interaction file spec.
spec_biogrid_tab2i <- function() {
  list(
    "biogrid_interaction_id" = cl("i"), 
    "a.entrez_gene_id" = cl("i"), 
    "b.entrez_gene_id" = cl("i"), 
    "a.biogrid_id" = cl("i"), 
    "b.biogrid_id" = cl("i"),
    "a.systematic_name" = cl("c"), 
    "b.systematic_name" = cl("c"),
    "a.official_symbol" = cl("c"),
    "b.official_symbol" = cl("c"),
    "a.synonyms" = cl("c"),
    "b.synonyms" = cl("c"),
    "experimental_system_name" = cl("c"),
    "experimental_system_type" = cl("c"),
    "first_author_surname" = cl("c"), 
    "pubmed_id" = cl("i"),
    "a.organism_id" = cl("i"),
    "b.organism_id" = cl("i"), 
    "interaction_throughput" = cl("c"), 
    "quantitative_score" = cl("d"),
    "post_translational_modification" = cl("c"),
    "phenotypes" = cl("c"),
    "qualifications" = cl("c"),
    "tags" = cl("c"),
    "source_database" = cl("c"))
}

#' TAB2.0 complex file spec.
spec_biogrid_tab2c <- function() {
  list(
    "biogrid_complex_id" = cl("i"), 
    "entrez_gene_id" = cl("i"), 
    "biogrid_id" = cl("i"), 
    "systematic_name" = cl("c"), 
    "official_symbol" = cl("c"),
    "synonyms" = cl("c"),
    "experimental_system_name" = cl("c"),
    "experimental_system_type" = cl("c"),
    "first_author_surname" = cl("c"), 
    "pubmed_id" = cl("i"),
    "biogrid_publication_id" = cl("c"),
    "organism_id" = cl("i"),
    "organism_name" = cl("c"),
    "interaction_throughput" = cl("c"), 
    "quantitative_score" = cl("d"),
    "post_translational_modification" = cl("c"),
    "ontology_class" = cl("c"),
    "ontology_terms" = cl("c"),
    "ontology_qualifiers" = cl("c"),
    "ontology_types" = cl("c"),
    "qualifications" = cl("c"),
    "tags" = cl("c"),
    "source_database" = cl("c"))
}

# column lookup fun
cl <- function(col_parser, ...) {
  switch(col_parser,
         c = readr::col_character(...),
         i = readr::col_integer(...),
         d = readr::col_double(...),
         n = readr::col_number(...),
         f = readr::col_factor(...),
         l = readr::col_logical(...),
         s = readr::col_skip(...))
}