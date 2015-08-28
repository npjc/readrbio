#' Read a list of files of the same format based on a pattern and path. 
#' Optionally bind them together, adding a variable containing the filename
#' for each observation.
#' 
#' @param ptrn character. pattern by which to look up files. defaults to gff3.
#' @param path character. path to directory to look for files in. 
#'  defaults to current.
#' @param bind_rows logical. should all the resulting dfs be bound into one?
#' @examples
#'  \dontrun{
#'  ls_read(".gff3", "./data-raw")
#'  }
#' @export
ls_read <- function(ptrn = c(".gff3",".wig"), path = ".", bind_rows = T) {
  ptrn <- match.arg(ptrn)
  # get all the files at that place
  files <- list.files(path, ptrn)
  file_paths <- normalizePath(paste(path,files, sep = '/'))
  # pick fxn to read based on file extension
  readfun <- switch(ptrn, ".gff3" = read_gff3, ".wig" = read_wig)
  # read in the files, each one into a list element
  ls <- lapply(file_paths, readfun)
  # Map the file name onto a file_name column for each respective file.
  out <- Map(function(x, y) dplyr::mutate_(x, .dots = list(file_name = ~y)), ls, files)
  # bind the rows for one tidy data frame
  if(bind_rows) out <- dplyr::bind_rows(out)
  out
}