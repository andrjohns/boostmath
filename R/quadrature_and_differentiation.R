#' @title Numerical Integration
#' @name numerical_integration
#' @description
#' Functions for numerical integration using Trapezoidal, Gauss-Legendre, and Gauss-Kronrod methods.
#'
#' **Trapezoidal Quadrature:**
#' Calculates the integral of a function \eqn{f} using the trapezoidal rule.
#' If the integrand is periodic and integrated over a full period, the trapezoidal rule converges faster than any power of the step size \eqn{h} (exponential convergence).
#' For non-periodic twice continuously differentiable functions, the error is \eqn{O(h^2)}.
#' Checks for convergence by halving the interval until the tolerance is met or `max_refinements` is reached.
#' Useful for periodic functions, bump functions, and bell-shaped integrals over infinite intervals.
#'
#' **Gauss-Legendre Quadrature:**
#' Performs "one-shot" non-adaptive integration on \eqn{(a, b)} using a fixed number of points.
#' Very efficient for smooth "bell-like" functions and functions with rapidly convergent power series.
#' Does not provide an error estimate.
#'
#' **Gauss-Kronrod Quadrature:**
#' An adaptive extension of Gaussian quadrature.
#' Adds \eqn{n+1} nodes (Kronrod points) to an \eqn{n}-point Gaussian quadrature to provide an *a posteriori* error estimate (\eqn{O(h^{3n+1})} vs \eqn{O(h^{2n-1})}).
#' Preserves exponential convergence for smooth functions.
#' Best suited for smooth functions with no end-point singularities.
#'
#' @param f A function to integrate. It should accept a single numeric value and return a single numeric value.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param max_depth Sets the maximum number of interval splittings for Gauss-Kronrod permitted before stopping. Set this to zero for non-adaptive quadrature.
#' @param tol The tolerance for the approximation. For trapezoidal, default is `sqrt(.Machine$double.eps)`. For Gauss-Kronrod, default is `sqrt(.Machine$double.eps)`.
#' @param max_refinements The maximum number of refinements to apply. Default is 12.
#' @param points The number of evaluation points to use in the Gauss-Legendre or Gauss-Kronrod quadrature.
#'
#' @return A single numeric value with the computed integral.
#'
#' @seealso
#' \code{\link{numerical_differentiation}}, \code{\link{double_exponential_quadrature}}
#'
#' @examples
#' # Trapezoidal rule integration of sin(x) from 0 to pi (Periodic over 0 to 2*pi)
#' trapezoidal(sin, 0, pi)
#'
#' # Gauss-Legendre integration of exp(x) from 0 to 1
#' gauss_legendre(exp, 0, 1, points = 7)
#'
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
#' @description
#' Functions for numerical differentiation using finite difference and complex step methods.
#'
#' **Finite Difference Derivative:**
#' Calculates a finite-difference approximation to the derivative of a function \eqn{f} at point \eqn{x}.
#' This problem is ill-conditioned: truncation error (\eqn{O(h^k)}) decreases with \eqn{h}, but roundoff error increases.
#' The function balances these errors automatically. The default order is 6.
#' Requires the function to be differentiable (up to the order requested).
#'
#' **Complex Step Derivative:**
#' Computes the derivative of a real-valued function \eqn{f(x)} using the complex step approximation:
#' \deqn{f'(x) \approx \frac{\Im(f(x + ih))}{h}}{f'(x) approx Im(f(x + ih))/h}
#' This method avoids the subtractive cancellation error inherent in finite differences and is extremely accurate.
#' However, it requires \eqn{f} to be a holomorphic function (complex-differentiable) that takes real values at real arguments.
#' Ideally, the function \code{f} should be able to accept a complex argument.
#'
#' @param f A function to differentiate. It should accept a single numeric/complex value and return a single numeric/complex value.
#' @param x The point at which to evaluate the derivative.
#' @param order The order of accuracy of the finite difference method. Can be 1, 2, 4, 6, or 8. Default is 1.
#'
#' @return The approximate value of the derivative at the point `x`.
#'
#' @seealso
#' \code{\link{numerical_integration}}
#'
#' @examples
#' # Finite difference derivative of sin(x) at pi/4
#' finite_difference_derivative(sin, pi / 4)
#'
#' # Complex step derivative of exp(x) at 1.7 (Requires f to handle complex input ideally)
#' # Note: In pure R, `exp` handles complex numbers automatically.
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
#' @description
#' Numerical integration using double exponential quadrature methods (Tanh-Sinh, Sinh-Sinh, Exp-Sinh).
#' These methods use variable transformations to achieve high-order convergence, often optimal for functions in the Hardy space (holomorphic in the unit disk).
#'
#' **Tanh-Sinh Quadrature:**
#' Best for integration over a finite interval \eqn{(a, b)}.
#' Can handle singularities at the endpoints of the integration domain.
#' Converges rapidly for holomorphic integrands.
#'
#' **Sinh-Sinh Quadrature:**
#' Designed for integration over the entire real line \eqn{(-\infty, \infty)}.
#' Handles integrands with large features or decay properties.
#'
#' **Exp-Sinh Quadrature:**
#' Designed for integration over a semi-infinite interval, typically \eqn{(0, \infty)}, or ranges like \eqn{(a, \infty)} or \eqn{(-\infty, b)}.
#' Supports endpoint singularities.
#'
#' @param f A function to integrate. It should accept a single numeric value and return a single numeric value.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param tol The tolerance for the approximation. Default is `sqrt(.Machine$double.eps)`.
#' @param max_refinements The maximum number of refinements to apply. Default is 15 for tanh-sinh and 9 for sinh-sinh and exp-sinh.
#'
#' @return A single numeric value with the computed integral.
#'
#' @seealso
#' \code{\link{numerical_integration}}
#'
#' @examples
#' # Tanh-sinh quadrature of log(x) from 0 to 1 (Endpoint singularity)
#' tanh_sinh(function(x) { log(x) * log1p(-x) }, a = 0, b = 1)
#'
#' # Sinh-sinh quadrature of exp(-x^2) over (-Inf, Inf)
#' sinh_sinh(function(x) { exp(-x * x) })
#'
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
#' @description
#' Computes Fourier sine and cosine integrals using Ooura's robust double exponential method (1999).
#' These methods are designed to handle oscillatory integrals that are problematic for standard quadrature.
#'
#' **Ooura Fourier Sine:**
#' Computes the integral:
#' \deqn{\int_0^\infty f(t) \sin(\omega t) dt}{Integral_0^Inf f(t) sin(omega * t) dt}
#'
#' **Ooura Fourier Cosine:**
#' Computes the integral:
#' \deqn{\int_0^\infty f(t) \cos(\omega t) dt}{Integral_0^Inf f(t) cos(omega * t) dt}
#'
#' @details
#' The method precomputes nodes and weights for efficiency.
#' Convergence depends on the position of the poles of the integrand in the complex plane.
#' If poles are too close to the real axis, convergence may be slow.
#'
#' @param f A function to integrate. It should accept a single numeric value and
#'          return a single numeric value.
#' @param omega The frequency parameter \eqn{\omega} for the sine or cosine term.
#' @param relative_error_tolerance The relative error tolerance for the approximation. Default is `sqrt(.Machine$double.eps)`.
#' @param levels The number of levels of refinement to apply. Default is 8.
#'
#' @return A single numeric value with the computed Fourier sine or cosine integral.
#'
#' @seealso
#' \code{\link{double_exponential_quadrature}}
#'
#' @references
#' Ooura, Takuya, and Masatake Mori. "A robust double exponential formula for Fourier-type integrals." Journal of computational and applied mathematics 112.1-2 (1999): 229-241.
#'
#' @examples
#' # Fourier sine integral of 1/x -> integral convergent to pi/2 approx
#' # sin(x)/x from 0 to Inf is pi/2. Here we integrate 1/x * sin(1*x).
#' ooura_fourier_sin(function(x) { 1 / x }, omega = 1)
#'
#' # Fourier cosine integral of 1/(x^2 + 1) * cos(x)
#' # Expected value is pi/(2*e) approx 0.57786
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
