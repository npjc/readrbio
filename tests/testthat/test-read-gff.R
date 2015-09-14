context("read_gff")

read_gff <- function(file) {
  spec(file, "gff", "gff3") %>%
    infr_skip() %>%
    do_read()
}

test_that("output is as expected when reading string", {
  intake <- "3R\treg\tbind_site\t46748\t48137\t0.499\t.\t.\tID=enr_reg_1\n"
  output <- read_gff(intake)
  expect <- dplyr::data_frame(seqid = "3R",
                              source = "reg",
                              type = "bind_site",
                              start = 46748L,
                              end = 48137L,
                              score = 0.499,
                              strand = ".",
                              phase = ".",
                              attributes = "ID=enr_reg_1")
  expect_equal(output, expect)
  expect_equal(length(output), 9)
  expect_equal(nrow(output), 1)
})

test_that("output is as expected when reading file", {
  intake <- "one-data-field.gff3.gz"
  output <- read_gff(intake)
  expect <- dplyr::data_frame(seqid = "3R",
                              source = "Regions_of_sig_enrichment",
                              type = "binding_site",
                              start = 46748L,
                              end = 48137L,
                              score = 0.49961892708069,
                              strand = ".",
                              phase = ".",
                              attributes = "ID=enriched_region_1")
  expect_equal(output, expect)
  expect_equal(length(output), 9)
  expect_equal(nrow(output), 1)
})

test_that("empty and incorrect data fields error predictably", {
  intake <- "\n"
  intake2 <- "no-data-fields.gff3.gz"
  expect <- "only unexpected number of fields"
  expect_error(read_gff(intake), expect)
  expect_error(read_gff(intake2), expect)
})
