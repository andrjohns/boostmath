#' @title Boost Math Constants
#' @name constants
#' @description Provides access to mathematical constants used in the Boost Math library.
#' @param constant A string specifying the name of the constant to retrieve. If `NULL`, returns a list of all constants (see documentation below for full list).
#' @return Requested constant value if `constant` is specified, otherwise a list of all available constants.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/constants.html) for more details on the constants.
#' @export
#' @examples
#' constants()
constants <- function(constant = NULL) {
  if (!is.null(constant)) {
    if (!constant %in% names(.boostmath_constants)) {
      stop("Invalid constant name. Use `constants()` to see available constants.")
    }
    return(.boostmath_constants[[constant]])
  }
  # Instantiated in .onLoad
  .boostmath_constants
}
