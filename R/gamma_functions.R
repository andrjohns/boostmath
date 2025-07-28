#' @title Gamma Functions
#' @name gamma_functions
#' @description Functions to compute the gamma function, its logarithm, digamma, trigamma, polygamma, and various incomplete gamma functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_gamma.html) for more details on the mathematical background.
#' @param z Input numeric value for the gamma function
#' @param n Order of the polygamma function (non-negative integer)
#' @param a Argument for the incomplete gamma functions
#' @param b Denominator argument for the ratio of gamma functions
#' @param delta Increment for the ratio of gamma functions
#' @param q Probability value for the incomplete gamma functions
#' @param p Probability value for the incomplete gamma functions
#' @return A single numeric value with the computed gamma function, logarithm, digamma, trigamma, polygamma, or incomplete gamma functions.
#' @examples
#' \dontrun{
#' # Gamma function for z = 5
#' tgamma(5)
#' # Gamma function for (1 + z) - 1, where z = 5
#' tgamma1pm1(5)
#' # Logarithm of the gamma function for z = 5
#' lgamma_boost(5)
#' # Digamma function for z = 5
#' digamma_boost(5)
#' # Trigamma function for z = 5
#' trigamma_boost(5)
#' # Polygamma function of order 1 for z = 5
#' polygamma(1, 5)
#' # Ratio of gamma functions for a = 5, b = 3
#' tgamma_ratio(5, 3)
#' # Ratio of gamma functions with delta for a = 5, delta = 2
#' tgamma_delta_ratio(5, 2)
#' # Normalised lower incomplete gamma function P(a, z) for a = 5, z = 2
#' gamma_p(5, 2)
#' # Normalised upper incomplete gamma function Q(a, z) for a = 5, z = 2
#' gamma_q(5, 2)
#' # Full lower incomplete gamma function for a = 5, z = 2
#' tgamma_lower(5, 2)
#' # Full upper incomplete gamma function for a = 5, z = 2
#' tgamma_upper(5, 2)
#' # Inverse of the normalised upper incomplete gamma function for a = 5, q = 0.5
#' gamma_q_inv(5, 0.5)
#' # Inverse of the normalised lower incomplete gamma function for a = 5, p = 0.5
#' gamma_p_inv(5, 0.5)
#' # Inverse of the normalised upper incomplete gamma function with respect to a for z = 2, q = 0.5
#' gamma_q_inva(2, 0.5)
#' # Inverse of the normalised lower incomplete gamma function with respect to a for z = 2, p = 0.5
#' gamma_p_inva(2, 0.5)
#' # Derivative of the normalised upper incomplete gamma function for a = 5, z = 2
#' gamma_p_derivative(5, 2)
#' }
NULL

#' @rdname gamma_functions
#' @export
tgamma <- function(z) {
  .Call(`tgamma_`, z)
}

#' @rdname gamma_functions
#' @export
tgamma1pm1 <- function(z) {
  .Call(`tgamma1pm1_`, z)
}

#' @rdname gamma_functions
#' @export
lgamma_boost <- function(z) {
  .Call(`lgamma_`, z)
}

#' @rdname gamma_functions
#' @export
digamma_boost <- function(z) {
  .Call(`digamma_`, z)
}

#' @rdname gamma_functions
#' @export
trigamma_boost <- function(z) {
  .Call(`trigamma_`, z)
}

#' @rdname gamma_functions
#' @export
polygamma <- function(n, z) {
  .Call(`polygamma_`, n, z)
}

#' @rdname gamma_functions
#' @export
tgamma_ratio <- function(a, b) {
  .Call(`tgamma_ratio_`, a, b)
}

#' @rdname gamma_functions
#' @export
tgamma_delta_ratio <- function(a, delta) {
  .Call(`tgamma_delta_ratio_`, a, delta)
}

#' @rdname gamma_functions
#' @export
gamma_p <- function(a, z) {
  .Call(`gamma_p_`, a, z)
}

#' @rdname gamma_functions
#' @export
gamma_q <- function(a, z) {
  .Call(`gamma_q_`, a, z)
}

#' @rdname gamma_functions
#' @export
tgamma_lower <- function(a, z) {
  .Call(`tgamma_lower_`, a, z)
}

#' @rdname gamma_functions
#' @export
tgamma_upper <- function(a, z) {
  .Call(`tgamma_upper_`, a, z)
}

#' @rdname gamma_functions
#' @export
gamma_q_inv <- function(a, q) {
  .Call(`gamma_q_inv_`, a, q)
}

#' @rdname gamma_functions
#' @export
gamma_p_inv <- function(a, p) {
  .Call(`gamma_p_inv_`, a, p)
}

#' @rdname gamma_functions
#' @export
gamma_q_inva <- function(z, q) {
  .Call(`gamma_q_inva_`, z, q)
}

#' @rdname gamma_functions
#' @export
gamma_p_inva <- function(z, p) {
  .Call(`gamma_p_inva_`, z, p)
}

#' @rdname gamma_functions
#' @export
gamma_p_derivative <- function(a, z) {
  .Call(`gamma_p_derivative_`, a, z)
}
