context("do_read")

test_that("readr:::read_delimited formals have not changed.", {
  intake <- formalArgs(readr:::read_delimited)
  output <- c("file", 
              "tokenizer", 
              "col_names", 
              "col_types", 
              "locale", 
              "skip", 
              "n_max", 
              "progress")
  expect_equal(intake, output)
})