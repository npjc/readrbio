#' Build a file specification
#' @inheritParams readr::datasource
#' @inheritParams file_spec
#' @export
spec <- function(file, type, subtype) {
  stopifnot(length(file) == 1 && length(type) == 1 && length(subtype) == 1)
  file_spec(file, type, subtype)
}

#' given  a file, its type and subtype construct a file spec.
#' @inheritParams readr::datasource
#' @param type (chr) the file type.
#' @param subtype (chr) the file subtype.
file_spec <- function(file, type, subtype) {
  fname <- paste0("spec_", type)
  type_spec <- try_get(fname, no(type))
  fname <- paste0(fname, "_", subtype)
  subtype_spec <- try_get(fname, no(subtype))
  spec <- c(list(file = file), type_spec(), subtype_spec())
  structure(spec, class = "file_spec", type = type, subtype = subtype)
}

#' @export
print.file_spec <- function(x, ...) {
  cat("<file spec>\n")
  left <- c("type:", "subtype:", "variables:", "delimiter:", "skip:", "n_max:")
  type <- attr(x, "type") %||% "<NULL>"
  subtype <- attr(x, "subtype") %||% "<NULL>"
  vars <- length(x$col_names) %||% "<NULL>"
  delim <- sanitize_delim(x$tokenizer$delim) %||% "<NULL>"
  skip <- x$skip %||% "<NULL>"
  n_max <-  x$n_max %||% "<NULL>"
  right <- c(type, subtype, vars, delim, skip, n_max)
  cat(paste0("  ", pad(left), " ", right, "\n",collapse = ""))
  cat("<variable spec>\n")
  cat(paste0("  $ ", pad(x$col_names), "  ", which_type(x$col_types), "\n",
             collapse =""))
}
# ensure tab and newline delimiters print nicely.
sanitize_delim <- function(x) {
  if(x == '\t')
    x <- '\\t'
  if(x == '\n')
    x <- '\\n'
  paste0("'",x,"'")
}
# pad right side with spaces.
pad <- function(x) {
  n <- nchar(x)
  spc_to_add <- max(n) - n
  spaces <- lapply(spc_to_add, function(x) paste0(rep(" ", x),collapse = ""))
  paste0(x, spaces)
}
# if col_types in a is a character string...
which_type <- function(x) {
  res <- lapply(x, function(x) attr(x, "class")[1])
  unlist(res)
}

# error out of switch with a not currently supported message.
no <- function(x) {
  thing <- deparse(substitute(x))
  stop("the ", thing, " \"", x,"\" is not currently supported.", call. = FALSE)
}

# is it a file specification
is.file_spec <- function(x) {
  inherits(x, "file_spec")
}
