#' skeletonize into an input list.
#' @inheritParams readr::datasource
#' @param spec named list containing specification for a file
#' @param tokenizer function. tokenizer to use.
skeletonize <- function(file, spec, tokenizer) {
  structure(
    list(
      file = file,
      tokenizer = tokenizer,
      col_names = names(spec),
      col_types = setNames(spec, NULL),
      locale = readr::default_locale(),
      skip = 0L,
      n_max = -1L,
      progress = interactive(),
      n_fields = length(spec)),
    class = "input_list")
}