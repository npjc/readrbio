# read data ---------------------------------------------------------------

# give a
#' pattern to recognize files by and the
#' path where to look for the files
# and ls_read will read in each file with the appropriate reader into
# a list.
ls_read <- function(pattern = c(".gff3",".wig"), path = ".", bind_rows = T) {
  # get all the files at that place
  files <- list.files(path, pattern)
  file_paths <- normalizePath(paste0(path,files))
  # pick fxn to read based on file extension
  readfun <- switch(pattern, ".gff3" = read_gff3, ".wig" = read_wig)
  # read in the files, each one into a list element
  ls <- lapply(file_paths, readfun)
  # Map the file name onto a file_name column for each respective file.
  out <- Map(function(x, y) dplyr::mutate_(x, .dots = list(file_name = ~y)), ls, files)
  # bind the rows for one tidy data frame
  if(bind_rows) out <- dplyr::bind_rows(out)
  out
}