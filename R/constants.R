#' @title Boost Math Constants
#' @name constants
#' @description Provides access to mathematical constants used in the Boost Math library.
#' @return A list of constants (see documentation below for full list).
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/constants.html) for more details on the constants.
#' @export
#' @examples
#' constants()
constants <- function() {
  # Instantiated in .onLoad
  .boostmath_constants
}
