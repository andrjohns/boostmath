#' @title Lambert W Function and Its Derivatives
#' @name lambert_w_function
#' @description Functions to compute the Lambert W function and its derivatives for the principal branch (\eqn{W_0}) and the branch -1 (\eqn{W_{-1}}).
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/lambert_w.html)
#' for more details on the mathematical background.
#' @param z Argument of the Lambert W function
#' @return A single numeric value with the computed Lambert W function or its derivative.
#' @examples
#' # Lambert W Function (Principal Branch)
#' lambert_w0(0.3)
#' # Lambert W Function (Branch -1)
#' lambert_wm1(-0.3)
#' # Derivative of the Lambert W Function (Principal Branch)
#' lambert_w0_prime(0.3)
#' # Derivative of the Lambert W Function (Branch -1)
#' lambert_wm1_prime(-0.3)
NULL

#' @rdname lambert_w_function
#' @export
lambert_w0 <- function(z) {
  .Call(`lambert_w0_`, z)
}

#' @rdname lambert_w_function
#' @export
lambert_wm1 <- function(z) {
  .Call(`lambert_wm1_`, z)
}

#' @rdname lambert_w_function
#' @export
lambert_w0_prime <- function(z) {
  .Call(`lambert_w0_prime_`, z)
}

#' @rdname lambert_w_function
#' @export
lambert_wm1_prime <- function(z) {
  .Call(`lambert_wm1_prime_`, z)
}
