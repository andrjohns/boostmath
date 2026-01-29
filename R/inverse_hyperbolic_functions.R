#' @title Inverse Hyperbolic Functions
#' @name inverse_hyperbolic_functions
#' @description
#' Functions to compute the inverse hyperbolic functions with high precision and
#' proper handling of edge cases.
#'
#' Inverse hyperbolic functions are the inverses of the hyperbolic functions and
#' appear in calculus, special relativity, and solutions to differential equations.
#'
#' **Inverse Hyperbolic Cosine:**
#'
#' * `acosh_boost(x)`: Computes arccosh(x) = cosh^-^1(x)
#' * Mathematical definition: acosh(x) = log(x + sqrt(x^2 - 1))
#' * Domain: x >= 1
#' * Range: [0, Inf)
#' * Identity: cosh(acosh(x)) = x for x >= 1
#' * Derivative: d/dx acosh(x) = 1/sqrt(x^2 - 1)
#'
#' **Inverse Hyperbolic Sine:**
#'
#' * `asinh_boost(x)`: Computes arcsinh(x) = sinh^-^1(x)
#' * Mathematical definition: asinh(x) = log(x + sqrt(x^2 + 1))
#' * Domain: (-Inf, Inf)
#' * Range: (-Inf, Inf)
#' * Odd function: asinh(-x) = -asinh(x)
#' * Identity: sinh(asinh(x)) = x for all x
#' * Derivative: d/dx asinh(x) = 1/sqrt(x^2 + 1)
#'
#' **Inverse Hyperbolic Tangent:**
#'
#' * `atanh_boost(x)`: Computes arctanh(x) = tanh^-^1(x)
#' * Mathematical definition: atanh(x) = (1/2)log((1 + x)/(1 - x))
#' * Domain: (-1, 1)
#' * Range: (-Inf, Inf)
#' * Odd function: atanh(-x) = -atanh(x)
#' * Identity: tanh(atanh(x)) = x for |x| < 1
#' * Derivative: d/dx atanh(x) = 1/(1 - x^2)
#' * Special values: atanh(0) = 0, atanh(+/-1) = +/-Inf
#'
#' **Applications:**
#'
#' These functions appear in:
#' * Special relativity (rapidity transformations)
#' * Integration (e.g., integral  1/sqrt(x^2 + 1) dx = asinh(x) + C)
#' * Complex analysis and conformal mappings
#' * Statistical distributions (e.g., Fisher's z-transformation)
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
