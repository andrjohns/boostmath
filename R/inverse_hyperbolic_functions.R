#' @title Inverse Hyperbolic Functions
#' @name inverse_hyperbolic_functions
#' @description Functions to compute the inverse hyperbolic functions: acosh, asinh, and atanh.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/inv_hyper.html) for more details on the mathematical background.
#' @param x Input numeric value
#' @return A single numeric value with the computed inverse hyperbolic function.
#' @examples
#' # Inverse Hyperbolic Cosine
#' acosh_boost(2)
#' # Inverse Hyperbolic Sine
#' asinh_boost(1)
#' # Inverse Hyperbolic Tangent
#' atanh_boost(0.5)
NULL

#' @rdname inverse_hyperbolic_functions
#' @export
acosh_boost <- function(x) {
  .Call(`acosh_`, x)
}

#' @rdname inverse_hyperbolic_functions
#' @export
asinh_boost <- function(x) {
  .Call(`asinh_`, x)
}

#' @rdname inverse_hyperbolic_functions
#' @export
atanh_boost <- function(x) {
  .Call(`atanh_`, x)
}
