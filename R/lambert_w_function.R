#' @title Lambert W Function and Its Derivatives
#' @name lambert_w_function
#' @description
#' Functions to compute the Lambert W function and its derivatives for the principal branch
#' (W_0) and the branch -1 (W_-_1).
#'
#' The Lambert W function (also known as the Omega function or product logarithm) is the
#' inverse of f(W) = W*e^W. It solves the equation:
#'
#' \deqn{W(z) \cdot e^{W(z)} = z}
#'
#' **Branches:**
#'
#' The function has two real branches:
#'
#' * **W_0 (Principal Branch):**
#'   - Domain: [-1/e, Inf) where 1/e ~= 0.367879
#'   - `lambert_w0(z)`: Returns the principal branch value
#'   - `lambert_w0_prime(z)`: Returns the derivative of W_0
#'   - For z >= 0, there is a single real solution
#'
#' * **W_-_1 (Secondary Branch):**
#'   - Domain: [-1/e, 0)
#'   - `lambert_wm1(z)`: Returns the -1 branch value
#'   - `lambert_wm1_prime(z)`: Returns the derivative of W_-_1
#'   - Exists where two real solutions occur on (-1/e, 0)
#'   - As z approaches 0, W_-_1(z) approaches -Inf
#'
#' **Special Values:**
#'
#' * W_0(-1/e) = -1 (exactly)
#' * W_-_1(-1/e) = -1 (exactly)
#' * W_-_1(0) = -Inf
#'
#' **Singularity:**
#'
#' At z = -1/e ~= -0.367879, the two branches meet and the condition number of
#' function evaluation tends to infinity.
#'
#' The implementation uses Halley's method and Newton-Raphson iteration for
#' numerical refinement. Applications include solving transcendental equations,
#' delay differential equations, and enumeration problems.
#'
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
