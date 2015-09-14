context("read_biogrid")

read_biogrid <- function(file, subtype) {
  spec(file, "biogrid", subtype) %>%
    infr_skip() %>%
    do_read()
}

test_that("biogrid tab2 interaction tables are read correctly", {
  intake <- "biogrid-interaction.tab2.txt.gz"
  output <- read_biogrid(intake, "tab2i")
  expect_equal(length(output), 24)
  expect_equal(nrow(output), 6)
  expect_equal(output$post_translational_modification[3:4], c(NA, "Phosphorylation"))
})

test_that("biogrid tab2 interaction tbl to as complexes errors", {
  intake <- "biogrid-interaction.tab2.txt.gz"
  expect_error(read_biogrid(intake, "tab2c"))
})
