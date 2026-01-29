#' @title Error Functions and Inverses
#' @name error_functions
#' @description
#' Functions to compute the error function, complementary error function, and their inverses.
#'
#' Error functions appear frequently in probability, statistics, and partial differential
#' equations, particularly in the study of normal distributions and diffusion processes.
#'
#' **Error Function:**
#'
#' The error function is defined by the integral:
#' \deqn{erf(z) = \frac{2}{\sqrt{\pi}} \int_0^z e^{-t^2} dt}
#'
#' The error function is an odd function (erf(-z) = -erf(z)). Implementation uses
#' rational approximations optimised for absolute error, particularly for |z| <= 0.5.
#'
#' **Complementary Error Function:**
#'
#' The complementary error function is defined as:
#' \deqn{erfc(z) = 1 - erf(z) = \frac{2}{\sqrt{\pi}} \int_z^\infty e^{-t^2} dt}
#'
#' Key reflection formulas:
#' * erfc(-z) = 2 - erfc(z) (preferred when -z < -0.5)
#' * erfc(-z) = 1 + erf(z) (preferred when -0.5 <= -z < 0)
#'
#' For large z, uses exponential scaling to maintain numerical stability.
#'
#' **Inverse Functions:**
#'
#' * `erf_inv(p)`: Returns x such that p = erf(x), where -1 <= p <= 1
#' * `erfc_inv(p)`: Returns x such that p = erfc(x), where 0 <= p <= 2
#'
#' Inverse functions use rational approximations with different formulas for different
#' ranges of p, achieving accuracy to less than ~2 epsilon for standard precision types.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_erf.html) for more details on the mathematical background.
#' @param x Input numeric value
#' @param p Probability value for the inverse functions
#' @return A single numeric value with the computed error function, complementary error function, or their inverses.
#' @examples
#' # Error function
#' erf(0.5)
#' # Complementary error function
#' erfc(0.5)
#' # Inverse error function
#' erf_inv(0.5)
#' # Inverse complementary error function
#' erfc_inv(0.5)
NULL

#' @rdname error_functions
#' @export
erf <- function(x) {
  .Call(`erf_`, x)
}

#' @rdname error_functions
#' @export
erfc <- function(x) {
  .Call(`erfc_`, x)
}

#' @rdname error_functions
#' @export
erf_inv <- function(p) {
  .Call(`erf_inv_`, p)
}

#' @rdname error_functions
#' @export
erfc_inv <- function(p) {
  .Call(`erfc_inv_`, p)
}
