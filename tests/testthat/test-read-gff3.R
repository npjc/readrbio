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