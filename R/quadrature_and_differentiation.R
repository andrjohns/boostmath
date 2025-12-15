#' @title Numerical Integration
#' @name numerical_integration
#' @description Functions for numerical integration using various methods such as trapezoidal rule, Gauss-Legendre quadrature, and Gauss-Kronrod quadrature.
#' @param f A function to integrate. It should accept a single numeric value and return a single numeric value.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param max_depth Sets the maximum number of interval splittings for Gauss-Kronrod permitted before stopping. Set this to zero for non-adaptive quadrature.
#' @param tol The tolerance for the approximation. Default is `sqrt(.Machine$double.eps)`.
#' @param max_refinements The maximum number of refinements to apply. Default is 12.
#' @param points The number of evaluation points to use in the Gauss-Legendre or Gauss-Kronrod quadrature.
#' @return A single numeric value with the computed integral.
#' @examples
#' # Trapezoidal rule integration of sin(x) from 0 to pi
#' trapezoidal(sin, 0, pi)
#' # Gauss-Legendre integration of exp(x) from 0 to 1
#' gauss_legendre(exp, 0, 1, points = 7)
#' # Adaptive Gauss-Kronrod integration of log(x) from 1 to 2
#' gauss_kronrod(log, 1, 2, points = 15, max_depth = 10)
NULL

#' @rdname numerical_integration
#' @export
trapezoidal <- function(f, a, b, tol = sqrt(.Machine$double.eps), max_refinements = 12) {
  .Call(`trapezoidal_`, f, a, b, tol, max_refinements)
}

#' @rdname numerical_integration
#' @export
gauss_legendre <- function(f, a, b, points = 7) {
  if (points > 200) {
    stop("points must be less than or equal to 200", call. = FALSE)
  }
  .Call(`gauss_legendre_`, f, a, b, points)
}

#' @rdname numerical_integration
#' @export
gauss_kronrod <- function(f, a, b, points = 15, max_depth = 15, tol = sqrt(.Machine$double.eps)) {
  if (points < 1 || points > 200 || points %% 2 == 0) {
    stop("points must be an odd number between 1 and 200", call. = FALSE)
  }
  .Call(`gauss_kronrod_`, f, a, b, points, max_depth, tol)
}

#' @title Numerical Differentiation
#' @name numerical_differentiation
#' @description Functions for numerical differentiation using finite difference methods and complex step methods.
#' @param f A function to differentiate. It should accept a single numeric value and return a single numeric value.
#' @param x The point at which to evaluate the derivative.
#' @param order The order of accuracy of the derivative to compute. Default is 1.
#' @return The approximate value of the derivative at the point `x`.
#' @examples
#' # Finite difference derivative of sin(x) at pi/4
#' finite_difference_derivative(sin, pi / 4)
#' # Complex step derivative of exp(x) at 1.7
#' complex_step_derivative(exp, 1.7)
NULL

#' @rdname numerical_differentiation
#' @export
finite_difference_derivative <- function(f, x, order = 1) {
  if (!(order %in% c(1, 2, 4, 6, 8))) {
    stop("order must be one of: 1, 2, 4, 6, 8", call. = FALSE)
  }
  .Call(`finite_difference_derivative_`, f, x, order)
}

#' @rdname numerical_differentiation
#' @export
complex_step_derivative <- function(f, x) {
  .Call(`complex_step_derivative_`, f, x)
}

#' @title Double Exponential Quadrature
#' @name double_exponential_quadrature
#' @description Functions for numerical integration using double exponential quadrature methods such as tanh-sinh, sinh-sinh, and exp-sinh quadrature.
#' @param f A function to integrate. It should accept a single numeric value and return a single numeric value.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param tol The tolerance for the approximation. Default is `sqrt(.Machine$double.eps)`.
#' @param max_refinements The maximum number of refinements to apply. Default is 15 for tanh-sinh and 9 for sinh-sinh and exp-sinh.
#' @return A single numeric value with the computed integral.
#' @examples
#' # Tanh-sinh quadrature of log(x) from 0 to 1
#' tanh_sinh(function(x) { log(x) * log1p(-x) }, a = 0, b = 1)
#' # Sinh-sinh quadrature of exp(-x^2)
#' sinh_sinh(function(x) { exp(-x * x) })
#' # Exp-sinh quadrature of exp(-3*x) from 0 to Inf
#' exp_sinh(function(x) { exp(-3 * x) }, a = 0, b = Inf)
NULL

#' @rdname double_exponential_quadrature
#' @export
tanh_sinh <- function(f, a, b, tol = sqrt(.Machine$double.eps), max_refinements = 15) {
  .Call(`tanh_sinh_`, f, a, b, tol, max_refinements)
}

#' @rdname double_exponential_quadrature
#' @export
sinh_sinh <- function(f, tol = sqrt(.Machine$double.eps), max_refinements = 9) {
  .Call(`sinh_sinh_`, f, tol, max_refinements)
}

#' @rdname double_exponential_quadrature
#' @export
exp_sinh <- function(f, a, b, tol = sqrt(.Machine$double.eps), max_refinements = 9) {
  .Call(`exp_sinh_`, f, a, b, tol, max_refinements)
}

#' @title Ooura Fourier Integrals
#' @name ooura_fourier_integrals
#'
#' @description Computing Fourier sine and cosine integrals using Ooura's method.
#'
#' @param f A function to integrate. It should accept a single numeric value and
#'          return a single numeric value.
#' @param omega The frequency parameter for the sine integral.
#' @param relative_error_tolerance The relative error tolerance for the approximation.
#' @param levels The number of levels of refinement to apply. Default is 8.
#' @return A single numeric value with the computed Fourier sine or cosine integral, with attribute 'relative_error' indicating the relative error of the approximation.
#' @examples
#' # Fourier sine integral of sin(x) with omega = 1
#' ooura_fourier_sin(function(x) { 1 / x }, omega = 1)
#' # Fourier cosine integral of cos(x) with omega = 1
#' ooura_fourier_cos(function(x) { 1/ (x * x + 1) }, omega = 1)
NULL

#' @rdname ooura_fourier_integrals
#' @export
ooura_fourier_sin <- function(f, omega = 1, relative_error_tolerance = sqrt(.Machine$double.eps), levels = 8) {
  .Call(`ooura_fourier_sin_`, f, omega, relative_error_tolerance, levels)
}

#' @rdname ooura_fourier_integrals
#' @export
ooura_fourier_cos <- function(f, omega = 1, relative_error_tolerance = sqrt(.Machine$double.eps), levels = 8) {
  .Call(`ooura_fourier_cos_`, f, omega, relative_error_tolerance, levels)
}
