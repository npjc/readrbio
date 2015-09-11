context("read_gff3")

test_that("output is as expected when reading string", {
  intake <- "3R\treg\tbind_site\t46748\t48137\t0.499\t.\t.\tID=enr_reg_1\n"
  output <- read_gff3(intake)
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
  output <- read_gff3(intake)
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

test_that("empty data fields are handled predictably when reading string", {
  intake <- "\n"
  output <- read_gff3(intake)
  output_problems <- structure(list(row = 1L, col = NA_character_, expected = "9 columns", 
                                    actual = "1 columns"), .Names = c("row", "col", "expected", 
                                                                      "actual"), row.names = c(NA, -1L), class = c("tbl_df", "tbl", 
                                                                                                                   "data.frame"))
  expect_equal(length(names(output)), 9)
  expect_equal(nrow(output), 1)
  expect_equal(sum(is.na(output)), 9)
  expect_warning(read_gff3(intake), "1 parsing failure")
  expect_equal(readr::problems(output), output_problems)
})

test_that("empty data fields are handled predictably when reading file", {
  intake <- "no-data-fields.gff3.gz"
  output <- read_gff3(intake)
  output_problems <- structure(list(row = 1L, col = NA_character_, expected = "9 columns", 
                                    actual = "1 columns"), .Names = c("row", "col", "expected", 
                                                                      "actual"), row.names = c(NA, -1L), class = c("tbl_df", "tbl", 
                                                                                                                   "data.frame"))
  expect_equal(length(names(output)), 9)
  expect_equal(nrow(output), 1)
  expect_equal(sum(is.na(output)), 9)
  expect_warning(read_gff3(intake), "1 parsing failure")
  expect_equal(readr::problems(output), output_problems)
})