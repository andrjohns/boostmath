#' @title Exponential Integrals
#' @name exponential_integrals
#' @description Functions to compute various exponential integrals, including En and Ei.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/expint.html) for
#' @param n Order of the integral (for En)
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
