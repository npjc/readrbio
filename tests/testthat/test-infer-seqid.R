context("infer_seqid")

test_that("seqid column is properly mutated when needed", {
  intake <- "wiggle-bedtype-one-data-field.wig.gz"
  output <- read_wig(intake) %>% infer_seqid()
  expect <- "3R"
  expect_equal(output$seqid, expect)
})

test_that("infer_seqid returns output unchanged when no changes needed", {
  intake <- "one-data-field.gff3.gz"
  output <- read_gff3(intake) %>% infer_seqid()
  expect <- "3R"
  expect_equal(output$seqid, expect)
})