#' @title Root-Finding and Minimisation
#' @name rootfinding_and_minimisation
#' @description
#' Functions for finding roots of equations and minimizing functions using various numerical methods.
#'
#' **Root Finding Without Derivatives:**
#' These methods require a bracket (an interval \eqn{[a, b]} where the function has opposite signs) or a guess.
#' *   **Bisection (`bisect`):** A robust method that repeatedly subdivides the interval. Guaranteed to converge but slowly (linear convergence).
#' *   **TOMS 748 (`toms748_solve`):** An asymptotically efficient algorithm (Alefeld, Potra, and Shi) that combines interpolation and bisection. It has higher-order convergence and is often optimal for smooth functions.
#' *   **Bracket and Solve (`bracket_and_solve_root`):** A convenience wrapper that attempts to find a bracket around a guess and then solves using TOMS 748.
#'
#' **Root Finding With Derivatives:**
#' These methods require the user to provide derivatives of the function.
#' *   **Newton-Raphson (`newton_raphson_iterate`):** Second-order convergence. Requires \eqn{f(x)} and \eqn{f'(x)}.
#' *   **Halley's Method (`halley_iterate`):** Third-order convergence. Requires \eqn{f(x)}, \eqn{f'(x)}, and \eqn{f''(x)}.
#' *   **Schroder's Method (`schroder_iterate`):** Third-order convergence. Similar to Halley's method but more robust ensuring quadratic convergence for multiple roots.
#'
#' **Minimization:**
#' *   **Brent's Method (`brent_find_minima`):** Finds the minimum of a function in a given interval. It is a hybrid method using a combination of the golden section search and quadratic interpolation.
#'
#' @param f A function to find the root of or to minimise.
#'   *   For **no-derivative** methods: A function returning a single numeric value.
#'   *   For **Newton-Raphson**: A function returning a vector `c(f(x), f'(x))`.
#'   *   For **Halley/Schroder**: A function returning a vector `c(f(x), f'(x), f''(x))`.
#'   *   For **Minimization**: A function returning a single numeric value.
#' @param lower The lower bound of the interval to search.
#' @param upper The upper bound of the interval to search.
#' @param guess A numeric value that is a guess for the root.
#' @param factor Size of steps to take when searching for the root (for `bracket_and_solve_root`).
#' @param rising If TRUE, the function is assumed to be rising (for `bracket_and_solve_root`).
#' @param digits The number of significant digits to which the root or minimum should be found. Default is double precision.
#' @param max_iter The maximum number of iterations to perform.
#'
#' @return A list containing the root or minimum value, the value of the function at that point, and the number of iterations performed.
#'
#' @seealso
#' \code{\link{polynomial_root_finding}}
#'
#' @examples
#' # --- Root Finding Without Derivatives ---
#' # Bisection for x^2 - 2 = 0
#' f_bi <- function(x) x^2 - 2
#' bisect(f_bi, lower = 0, upper = 2)
#'
#' # TOMS 748 for x^2 - 2 = 0
#' toms748_solve(f_bi, lower = 0, upper = 2)
#'
#' # Bracket and Solve
#' bracket_and_solve_root(f_bi, guess = 1, factor = 2, rising = TRUE)
#'
#' # --- Root Finding With Derivatives ---
#' # Newton-Raphson: Need f(x) and f'(x)
#' # x^2 - 2 = 0  => f(x) = x^2 - 2, f'(x) = 2x
#' f_newton <- function(x) c(x^2 - 2, 2 * x)
#' newton_raphson_iterate(f_newton, guess = 1, lower = 0, upper = 2)
#'
#' # Halley/Schroder: Need f(x), f'(x), f''(x)
#' # x^2 - 2 = 0  => f''(x) = 2
#' f_halley <- function(x) c(x^2 - 2, 2 * x, 2)
#' halley_iterate(f_halley, guess = 1, lower = 0, upper = 2)
#' schroder_iterate(f_halley, guess = 1, lower = 0, upper = 2)
#'
#' # --- Minimization ---
#' # Find minimum of (x-2)^2 + 1
#' f_min <- function(x) (x - 2)^2 + 1
#' brent_find_minima(f_min, lower = 0, upper = 4)
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
#' @description
#' Functions for finding roots of polynomials of degree 2, 3, and 4 (quadratic, cubic, quartic).
#'
#' **Quadratic Roots:**
#' Solves \eqn{ax^2 + bx + c = 0}.
#' Returns real roots. If roots are complex, behavior depends on implementation (typically NaN for this real-valued interface).
#'
#' **Cubic Roots:**
#' Solves \eqn{ax^3 + bx^2 + cx + d = 0}.
#' Returns real roots.
#'
#' **Quartic Roots:**
#' Solves \eqn{ax^4 + bx^3 + cx^2 + dx + e = 0}.
#' Returns real roots.
#'
#' @details
#' These functions use analytic formulas where possible and numerically stable implementations to avoid catastrophic cancellation.
#'
#' @param a Coefficient of the highest degree term.
#' @param b Coefficient of the second highest degree term.
#' @param c Coefficient of the third highest degree term (or constant for quadratic).
#' @param d Coefficient of the fourth highest degree term (or constant for cubic).
#' @param e Constant term for quartic.
#' @param root The root to evaluate the residual or condition number at.
#'
#' @return A numeric vector containing the real roots of the polynomial.
#'
#' @examples
#' # Quadratic: x^2 - 3x + 2 = 0 -> Roots: 1, 2
#' quadratic_roots(1, -3, 2)
#'
#' # Cubic: x^3 - 6x^2 + 11x - 6 = 0 -> Roots: 1, 2, 3
#' cubic_roots(1, -6, 11, -6)
#'
#' # Quartic: x^4 - 10x^3 + 35x^2 - 50x + 24 = 0 -> Roots: 1, 2, 3, 4
#' quartic_roots(1, -10, 35, -50, 24)
#'
#' # Residual and Condition Number
#' cubic_root_residual(1, -6, 11, -6, 1)
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
