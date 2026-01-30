#' @title Exponential Integrals
#' @name exponential_integrals
#' @description
#' Functions to compute various exponential integrals, including En and Ei.
#'
#' **Exponential Integral En:**
#'
#' Defined by the integral:
#' \deqn{E_n(z) = \int_1^\infty \frac{e^{-zt}}{t^n} dt}
#'
#' **Exponential Integral Ei:**
#'
#' Defined by the integral:
#' \deqn{Ei(z) = -\int_{-z}^\infty \frac{e^{-t}}{t} dt}
#'
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/expint.html)
#' for more details on the mathematical background.
#' @param n Order of the integral (for En), must be a non-negative integer
#' @param z Argument of the integral (for En and Ei)
#' @return A single numeric value with the computed exponential integral.
#' @examples
#' # Exponential integral En with n = 1 and z = 2
#' expint_en(1, 2)
#' # Exponential integral Ei with z = 2
#' expint_ei(2)
NULL

#' @rdname exponential_integrals
#' @export
expint_en <- function(n, z) {
  .Call(`expint_en_`, n, z)
}

#' @rdname exponential_integrals
#' @export
expint_ei <- function(z) {
  .Call(`expint_ei_`, z)
}
