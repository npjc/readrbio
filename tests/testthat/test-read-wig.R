context("read_wig")

read_wig <- function(file) {
  spec(file, "wig", "bed") %>%
    infr_skip() %>%
    do_read()
}

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

test_that("empty and incorrect data fields error predictably", {
  intake <- "\n"
  intake2 <- "wiggle-bedtype-no-data-field.wig.gz"
  expect <- "only unexpected number of fields"
  expect_error(read_wig(intake), expect)
  expect_error(read_wig(intake2), expect)
})
