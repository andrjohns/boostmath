#' @title Beta Functions
#' @name beta_functions
#' @description Functions to compute the Euler beta function, normalised incomplete beta function, and their complements, as well as their inverses and derivatives.
#' @param a First parameter of the beta function
#' @param b Second parameter of the beta function
#' @param x Upper limit of integration (0 <= x <= 1)
#' @param p Probability value (0 <= p <= 1)
#' @param q Probability value (0 <= q <= 1)
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
