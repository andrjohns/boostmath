#' @title Root-Finding and Minimisation Functions
#' @name rootfinding_and_minimisation
#' @description Functions for root-finding and minimisation using various algorithms.
#' @details This package provides a set of functions for finding roots of equations and minimising functions using different numerical methods. The methods include bisection, bracket and solve, TOMS
#' 748, Newton-Raphson, Halley's method, Schroder's method, and Brent's method. It also includes functions for finding roots of polynomials (quadratic, cubic, quartic) and computing minima.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/root_finding.html) for more details on the mathematical background.
#' @param f A function to find the root of or to minimise. It should take and return a single numeric value for root-finding, or a numeric vector for minimisation.
#' @param lower The lower bound of the interval to search for the root or minimum.
#' @param upper The upper bound of the interval to search for the root or minimum.
#' @param guess A numeric value that is a guess for the root or minimum.
#' @param factor Size of steps to take when searching for the root.
#' @param rising If TRUE, the function is assumed to be rising, otherwise it is assumed to be falling.
#' @param digits The number of significant digits to which the root or minimum should be found. Defaults to double precision.
#' @param max_iter The maximum number of iterations to perform. Defaults to the maximum integer value.
#' @return A list containing the root or minimum value, the value of the function at that point, and the number of iterations performed.
#' @examples
#' f <- function(x) x^2 - 2
#' bisect(f, lower = 0, upper = 2)
#' bracket_and_solve_root(f, guess = 1, factor = 0.1, rising = TRUE)
#' toms748_solve(f, lower = 0, upper = 2)
#' f <- function(x) c(x^2 - 2, 2 * x)
#' newton_raphson_iterate(f, guess = 1, lower = 0, upper = 2)
#' f <- function(x) c(x^2 - 2, 2 * x, 2)
#' halley_iterate(f, guess = 1, lower = 0, upper = 2)
#' schroder_iterate(f, guess = 1, lower = 0, upper = 2)
#' f <- function(x) (x - 2)^2 + 1
#' brent_find_minima(f, lower = 0, upper = 4)
NULL

#' @rdname rootfinding_and_minimisation
#' @export
bisect <- function(f, lower, upper, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`bisect_`, f, lower, upper, digits, max_iter)
}

#' @rdname rootfinding_and_minimisation
#' @export
bracket_and_solve_root <- function(f, guess, factor, rising, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`bracket_and_solve_root_`, f, guess, factor, rising, digits, max_iter)
}

#' @rdname rootfinding_and_minimisation
#' @export
toms748_solve <- function(f, lower, upper, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`toms748_solve_`, f, lower, upper, digits, max_iter)
}

#' @rdname rootfinding_and_minimisation
#' @export
newton_raphson_iterate <- function(f, guess, lower, upper, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`newton_raphson_iterate_`, f, guess, lower, upper, digits, max_iter)
}

#' @rdname rootfinding_and_minimisation
#' @export
halley_iterate <- function(f, guess, lower, upper, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`halley_iterate_`, f, guess, lower, upper, digits, max_iter)
}

#' @rdname rootfinding_and_minimisation
#' @export
schroder_iterate <- function(f, guess, lower, upper, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`schroder_iterate_`, f, guess, lower, upper, digits, max_iter)
}

#' @rdname rootfinding_and_minimisation
#' @export
brent_find_minima <- function(f, lower, upper, digits = .Machine$double.digits, max_iter = .Machine$integer.max) {
  .Call(`brent_find_minima_`, f, lower, upper, digits, max_iter)
}

#' @title Polynomial Root-Finding
#' @name polynomial_root_finding
#' @description Functions for finding roots of polynomials of various degrees.
#' @details This package provides functions to find roots of quadratic, cubic, and quartic polynomials. The functions return the roots as numeric vectors.
#' @param a Coefficient of the polynomial term (e.g., for quadratic ax^2 + bx + c, a is the coefficient of x^2).
#' @param b Coefficient of the linear term (e.g., for quadratic ax^2 + bx + c, b is the coefficient of x).
#' @param c Constant term (e.g., for quadratic ax^2 + bx + c, c is the constant).
#' @param d Coefficient of the cubic term (for cubic ax^3 + bx^2 + cx + d, d is the constant).
#' @param e Coefficient of the quartic term (for quartic ax^4 + bx^3 + cx^2 + dx + e, e is the constant).
#' @param root The root to evaluate the residual or condition number at.
#' @return A numeric vector of the polynomial roots, residual, or condition number.
#' @examples
#' # Example of finding quadratic roots
#' quadratic_roots(1, -3, 2)
#' # Example of finding cubic roots
#' cubic_roots(1, -6, 11, -6)
#' # Example of finding quartic roots
#' quartic_roots(1, -10, 35, -50, 24)
#' # Example of finding cubic root residual
#' cubic_root_residual(1, -6, 11, -6, 1)
#' # Example of finding cubic root condition number
#' cubic_root_condition_number(1, -6, 11, -6, 1)
NULL

#' @rdname polynomial_root_finding
#' @export
quadratic_roots <- function(a, b, c) {
  .Call(`quadratic_roots_`, a, b, c)
}

#' @rdname polynomial_root_finding
#' @export
cubic_roots <- function(a, b, c, d) {
  .Call(`cubic_roots_`, a, b, c, d)
}

#' @rdname polynomial_root_finding
#' @export
cubic_root_residual <- function(a, b, c, d, root) {
  .Call(`cubic_root_residual_`, a, b, c, d, root)
}

#' @rdname polynomial_root_finding
#' @export
cubic_root_condition_number <- function(a, b, c, d, root) {
  .Call(`cubic_root_condition_number_`, a, b, c, d, root)
}

#' @rdname polynomial_root_finding
#' @export
quartic_roots <- function(a, b, c, d, e) {
  .Call(`quartic_roots_`, a, b, c, d, e)
}
