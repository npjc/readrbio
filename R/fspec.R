#' Construct a file specification.
#'
#' A file specification (fspec) defines the set of consistent arguments to be
#' used to read in files of a given type. It should be a named list with
#' elements corresponding to the arguments (formals) of the function used to
#' read it in.
#'
#' @param class (chr) Assign a class to the file specification.
#' @param .fspec (fspec object) Optionally, fpsec object to inherit from.
#' @param .l (named list) Provide a list of parameters to serve as defaults.
fspec <- function(class, .fspec, .l) {
  if (is.null(.fspec))
    return(structure(.l, class = class))
  stopifnot(is.fspec(.fspec))
  parent_class <- class(.fspec)
  # overides inheriting if present
  keep_names <- setdiff(names(.fspec), names(.l))
  .fspec <- .fspec[keep_names]
  l <- c(.l, .fspec)
  all <- c(class, parent_class)
  structure(l, class = all)
}

#' readr::read_delim file specification.
fspec_delim <- function() {
  fspec(class = c("fspec"), .fspec = NULL, list())
}

#' test it an object inherits from a file specification
is.fspec <- function(x) {
  inherits(x, "fspec")
}


# PRINT -------------------------------------------------------------------

#' @export
print.fspec <- function(x, ...) {
  cat("<file specification>\n")
  cat("spec:   ",paste0(class(x), collapse = ', '), '\n')
  cat("delim:  ",phrase_delim(x$delim), '\n')
  cat(paste0("<variables> (",length(x$col_names),")\n"))
  cat(paste0("  $ ", pad(x$col_names), "  ", which_type(x$col_types), "\n",
             collapse =""))
}

# ensure tab and newline delimiters print nicely.
phrase_delim <- function(x) {
  if(x == '\t')
    x <- '\\t'
  return(paste0("tab delimited ('", x, "') vars."))
  if(x == '\n')
    x <- '\\n'
  return(paste0("line delimited ('", x, "') vars."))
  if(x == ' ')
    x <- '\\n'
  return(paste0("[single] space delimited ('", x, "') vars."))
  if(x == ',')
    x <- '\\n'
  return(paste0("comma delimited ('", x, "') vars."))
  paste0("delim: '", x,"'")
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

