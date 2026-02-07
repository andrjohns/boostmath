#' @title Inverse Hyperbolic Functions
#' @name inverse_hyperbolic_functions
#' @description
#' Functions to compute the inverse hyperbolic functions with high precision and
#' proper handling of edge cases.
#'
#' * `acosh_boost(x)`: Inverse hyperbolic cosine, \eqn{\text{cosh}^{-1}(\text{cosh} (x)) = x}
#' * `asinh_boost(x)`: Inverse hyperbolic sine, \eqn{\text{sinh}^{-1}(\text{sinh} (x)) = x}
#' * `atanh_boost(x)`: Inverse hyperbolic tangent, \eqn{\text{tanh}^{-1}(\text{tanh} (x)) = x}
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/inv_hyper.html) for more details on the mathematical background.
#' @param x Input numeric value (domain depends on the function)
#' @return A single numeric value with the computed inverse hyperbolic function.
#' @examples
#' # Inverse Hyperbolic Cosine (x >= 1)
#' acosh_boost(2)  # Returns approximately 1.317
#' # Inverse Hyperbolic Sine (all real x)
#' asinh_boost(1)  # Returns approximately 0.881
#' # Inverse Hyperbolic Tangent (|x| < 1)
#' atanh_boost(0.5)  # Returns approximately 0.549
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
