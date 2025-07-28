#' @title Error Functions and Inverses
#' @name error_functions
#' @description Functions to compute the error function, complementary error function, and their inverses.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_erf.html) for more details
#' @param x Input numeric value
#' @param p Probability value (0 <= p <= 1)
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
