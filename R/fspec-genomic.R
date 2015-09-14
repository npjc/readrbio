# put genomic fspecs here.

# BED ---------------------------------------------------------------------

#' BED files.
#'
#' see \url{https://genome.ucsc.edu/FAQ/FAQformat.html} for format details.
#' N.B. chrom, chromStart, chromEnd != seqid, start, end.
#'
#' @format Tab-delimited file genomic interval format.
bed <- function() {
  fspec("bed", fspec_delim(), list(delim = '\t',
                                   na = c('.', "NA")))
}

bed_bed12 <- function() {
  fspec("bed12", bed(), list(
    col_names = c(
      "chrom",
      "chromStart",
      "chromEnd",
      "name",
      "score",
      "strand",
      "thickStart",
      "thinkEnd",
      "itemRgb",
      "blockCount",
      "blockSizes",
      "blockStart"
    ),
    col_types = col("ciicdciicicc")
  ))
}

bed_sub12 <- function(x) {
  lapply(bed_bed12()[c("col_names", "col_types")], "[", 1:x)
}

bed_bed3 <- function()
  fspec("bed3", bed(), bed_sub12(3))

bed_bed4 <- function()
  fspec("bed4", bed(), bed_sub12(4))

bed_bed6 <- function()
  fspec("bed6", bed(), bed_sub12(6))


# WIG ---------------------------------------------------------------------

#' WIGGLE track files
#'
#' see \url{http://gmod.org/wiki/GBrowse} for format details. Does not handle
#' fasta containing files.
#'
#' @format space-delimited dense genomic signal file.
wig <- function() fspec("wig", fspec_delim(), list(delim = ' '))

wig_bed <- function() {
  fspec("bed", wig(), list(
    col_names = c("seqid",
                  "start",
                  "end",
                  "score"),
    col_types = col("ciid")
  ))
}

#' GFF files
#'
#' see \url{http://gmod.org/wiki/GFF3} for format details. does not handle fasta
#' containing files. For GFF2 spec see:
#' \url{http://www.sanger.ac.uk/resources/software/gff/spec.html#t_2}.
#'
#' @format Tab-delimited genomic interval file.
gff <- function() {
  fspec("gff", fspec_delim(), list(delim = '\t',
                                   na = c('.', "NA")))
}

# GFF ---------------------------------------------------------------------

gff_gff2 <- function() {
  fspec("gff2", gff(), list(
    col_names = c(
      "seqname",
      "source",
      "feature",
      "start",
      "end",
      "score",
      "strand",
      "frame",
      "attribute"
    ),
    col_types = col("ccciidccc")
  ))
}

gff_gff3 <- function() {
  fspec("gff3", gff(), list(
    col_names = c(
      "seqid",
      "source",
      "type",
      "start",
      "end",
      "score",
      "strand",
      "phase",
      "attributes"
    ),
    col_types = col("ccciidccc")
  ))
}
