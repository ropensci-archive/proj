#' @importFrom V8 new_context
ct <- NULL
.onLoad <- function(libname, pkgname){
  ct <<- new_context();
  ct$source(system.file("js/proj4.js", package = pkgname))
}
