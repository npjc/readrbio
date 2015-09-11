context("read_wig")

test_that("output is as expected when reading string", {
  intake <- "chr3R 2 37 0.138595358054898\n"
  output <- read_wig(intake)
  expect <- dplyr::data_frame(seqid = "chr3R",
                              start = 2L,
                              end = 37L,
                              score = 0.138595358054898)
  expect_equal(output, expect)
  expect_equal(length(output), 4)
  expect_equal(nrow(output), 1)
})

test_that("output is as expected when reading file", {
  intake <- "wiggle-bedtype-one-data-field.wig.gz"
  output <- read_wig(intake)
  expect <- dplyr::data_frame(seqid = "chr3R",
                              start = 2L,
                              end = 37L,
                              score = 0.138595358054898)
  expect_equal(output, expect)
  expect_equal(length(output), 4)
  expect_equal(nrow(output), 1)
})

test_that("empty data fields are handled predictably when reading string", {
  intake <- "\n"
  output <- read_wig(intake)
  output_problems <- structure(list(row = 1L, col = NA_character_, expected = "4 columns", 
                                    actual = "1 columns"), .Names = c("row", "col", "expected", 
                                                                      "actual"), row.names = c(NA, -1L), class = c("tbl_df", "tbl", 
                                                                                                                   "data.frame"))
  expect_equal(length(names(output)), 4)
  expect_equal(nrow(output), 1)
  expect_equal(sum(is.na(output)), 4)
  expect_warning(read_gff3(intake), "1 parsing failure")
  expect_equal(readr::problems(output), output_problems)
})

test_that("empty data fields are handled predictably when reading file", {
  intake <- "wiggle-bedtype-no-data-field.wig.gz"
  output <- read_wig(intake)
  output_problems <- structure(list(row = 1L, col = NA_character_, expected = "4 columns", 
                                    actual = "1 columns"), .Names = c("row", "col", "expected", 
                                                                      "actual"), row.names = c(NA, -1L), class = c("tbl_df", "tbl", 
                                                                                                                   "data.frame"))
  expect_equal(length(names(output)), 4)
  expect_equal(nrow(output), 1)
  expect_equal(sum(is.na(output)), 4)
  expect_warning(read_gff3(intake), "1 parsing failure")
  expect_equal(readr::problems(output), output_problems)
})