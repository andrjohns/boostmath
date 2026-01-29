#' @title Beta Functions
#' @name beta_functions
#' @description
#' Functions to compute the Beta function, normalised incomplete beta function,
#' and their complements, as well as their inverses and derivatives.
#'
#' **Beta Function \eqn{B(a, b)}:**
#'
#' * `beta_boost(a, b)`
#'
#' \deqn{B(a, b) = \frac{\Gamma(a)\Gamma(b)}{\Gamma(a+b)}}
#'
#'
#' **Incomplete Beta Functions:**
#'
#' * **Normalised (Regularised) Functions:**
#'   - `ibeta(a, b, x)`: Normalised incomplete beta function \eqn{I_x(a, b)}
#'
#' \deqn{I_x(a,b) = \frac{1}{B(a, b)}\int_{0}^{x}t^{a-1}(1-t)^{b-1}dt}
#'
#'   - `ibetac(a, b, x)`: Normalised complement, \eqn{1 - I_x(a, b) = I_{1-x}(b, a)}
#'
#' * **Non-normalised Functions:**
#'   - `beta_boost(a, b, x)`: Full incomplete beta function \eqn{B_x(a, b)}
#'
#' \deqn{\int_{0}^{x}t^{a-1}(1-t)^{b-1}dt}
#'
#'   - `betac(a, b, x)`: Full complement , \eqn{1 - B_x(a, b) = B_{1-x}(b, a)}
#'
#'
#' **Inverse Functions:**
#'
#' * **Primary inverses (solving for x):**
#'   - `ibeta_inv(a, b, p)`: Returns \eqn{x} such that \eqn{p = I_x(a, b)}
#'   - `ibetac_inv(a, b, q)`: Returns \eqn{x} such that \eqn{q = 1 - I_x(a, b)}
#'
#' * **Parameter inverses (solving for a or b):**
#'   - `ibeta_inva(b, x, p)`: Returns a such that \eqn{p = I_x(a, b)}
#'   - `ibetac_inva(b, x, q)`: Returns a such that \eqn{q = 1 - I_x(a, b)}
#'   - `ibeta_invb(a, x, p)`: Returns b such that \eqn{p = I_x(a, b)}
#'   - `ibetac_invb(a, x, q)`: Returns b such that \eqn{q = 1 - I_x(a, b)}s
#'
#' **Derivatives:**
#'
#' `ibeta_derivative(a, b, x)`: Computes the partial derivative with respect to x
#' of the incomplete beta function
#'
#' \deqn{\frac{\partial}{\partial x}I_x(a,b) = \frac{(1-x)^{b-1}x^{a-1}}{B(a,b)}}
#'
#' @param a First parameter of the beta function (must be positive)
#' @param b Second parameter of the beta function (must be positive)
#' @param x Upper limit of integration (0 <= x <= 1)
#' @param p Probability value (0 <= p <= 1)
#' @param q Probability value (0 <= q <= 1), where q = 1 - p
#' @return A single numeric value with the computed beta function, normalised incomplete beta function, or their complements, depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_beta.html) for more details on the mathematical background.
#' @examples
#' \dontrun{
#' # Euler beta function B(2, 3)
#' beta_boost(2, 3)
#' # Normalised incomplete beta function I_x(2, 3) for x = 0.5
#' ibeta(2, 3, 0.5)
#' # Normalised complement of the incomplete beta function 1 - I_x(2, 3) for x = 0.5
#' ibetac(2, 3, 0.5)
#' # Full incomplete beta function B_x(2, 3) for x = 0.5
#' beta_boost(2, 3, 0.5)
#' # Full complement of the incomplete beta function 1 - B_x(2, 3) for x = 0.5
#' betac(2, 3, 0.5)
#' # Inverse of the normalised incomplete beta function I_x(2, 3) = 0.5
#' ibeta_inv(2, 3, 0.5)
#' # Inverse of the normalised complement of the incomplete beta function I_x(2, 3) = 0.5
#' ibetac_inv(2, 3, 0.5)
#' # Inverse of the normalised complement of the incomplete beta function I_x(a, b)
#' # with respect to a for x = 0.5 and q = 0.5
#' ibetac_inva(3, 0.5, 0.5)
#' # Inverse of the normalised incomplete beta function I_x(a, b)
#' # with respect to b for x = 0.5 and p = 0.5
#' ibeta_invb(0.8, 0.5, 0.5)
#' # Inverse of the normalised complement of the incomplete beta function I_x(a, b)
#' # with respect to b for x = 0.5 and q = 0.5
#' ibetac_invb(2, 0.5, 0.5)
#' # Derivative of the incomplete beta function with respect to x for a = 2, b = 3, x = 0.5
#' ibeta_derivative(2, 3, 0.5)
#' }
NULL

#' @rdname beta_functions
#' @export
beta_boost <- function(a, b, x = NULL) {
  if (is.null(x)) {
    return(.Call(`beta_`, a, b))
  }
  .Call(`beta_incomplete_`, a, b, x)
}

#' @rdname beta_functions
#' @export
ibeta <- function(a, b, x) {
  .Call(`ibeta_`, a, b, x)
}

#' @rdname beta_functions
#' @export
ibetac <- function(a, b, x) {
  .Call(`ibetac_`, a, b, x)
}


#' @rdname beta_functions
#' @export
betac <- function(a, b, x) {
  .Call(`betac_`, a, b, x)
}

#' @rdname beta_functions
#' @export
ibeta_inv <- function(a, b, p) {
  .Call(`ibeta_inv_`, a, b, p)
}

#' @rdname beta_functions
#' @export
ibetac_inv <- function(a, b, q) {
  .Call(`ibetac_inv_`, a, b, q)
}

#' @rdname beta_functions
#' @export
ibeta_inva <- function(b, x, p) {
  .Call(`ibeta_inva_`, b, x, p)
}

#' @rdname beta_functions
#' @export
ibetac_inva <- function(b, x, q) {
  .Call(`ibetac_inva_`, b, x, q)
}

#' @rdname beta_functions
#' @export
ibeta_invb <- function(a, x, p) {
  .Call(`ibeta_invb_`, a, x, p)
}

#' @rdname beta_functions
#' @export
ibetac_invb <- function(a, x, q) {
  .Call(`ibetac_invb_`, a, x, q)
}

#' @rdname beta_functions
#' @export
ibeta_derivative <- function(a, b, x) {
  .Call(`ibeta_derivative_`, a, b, x)
}
