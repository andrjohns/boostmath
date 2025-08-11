.onLoad <- function(libname, pkgname) {
  assign(".boostmath_constants", .Call(`constants_`), envir = topenv())
}

.onUnload <- function(libpath) {
   # unload the package library
   library.dynam.unload("boostmath", libpath)
}
