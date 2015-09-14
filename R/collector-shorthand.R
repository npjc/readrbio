col <- function(x) {
  x <- unlist(strsplit(x,""))
  lapply(x, function(x) {
    switch(x,
      c = readr::col_character(),
      i = readr::col_integer(),
      d = readr::col_double(),
      n = readr::col_number(),
      l = readr::col_logical(),
      f = readr::col_factor(),
      s = readr::col_skip())
  })
}
