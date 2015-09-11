context("read_bed")

test_that("output is as expected when reading string", {
  intake <- "chr3R\t2\t37\n"
  output <- read_bed(intake, "bed3")
  expect <- dplyr::data_frame(chrom = "chr3R",
                              chromStart = 2L,
                              chromEnd = 37L)
  expect_equal(output, expect)
  expect_equal(length(output), 3)
  expect_equal(nrow(output), 1)
})

test_that("output is as expected when reading file", {
  intake <- "three_col.bed.gz"
  df <- read_bed(intake, "bed3")
  output <- df[10,]
  expect <- dplyr::data_frame(chrom = "2L",
                              chromStart = 681408L,
                              chromEnd = 683196L)
  expect_equal(output, expect)
  expect_equal(length(output), 3)
  expect_equal(nrow(df), 100)
})

test_that("empty and incorrect data fields error predictably", {
  intake <- "\n"
  intake2 <- "wiggle-bedtype-no-data-field.wig.gz"
  expect <- "only unexpected number of fields"
  expect_error(read_bed(intake), expect)
  expect_error(read_bed(intake2), expect)
})
