#' Riemann Zeta Function
#'
#' @description
#' Computes the Riemann zeta function ζ(z), one of the most important functions
#' in analytic number theory.
#'
#' **Mathematical Definition:**
#'
#' The Riemann zeta function is defined by the series:
#' \deqn{\zeta(z) = \sum_{n=1}^\infty \frac{1}{n^z}}
#'
#' for Re(z) > 1, and by analytic continuation elsewhere.
#'
#' **Special Values:**
#'
#' * ζ(2) = π²/6 (Basel problem)
#' * ζ(4) = π⁴/90
#' * ζ(0) = -1/2
#' * ζ(-1) = -1/12
#' * Closed forms exist for all even positive integers and all negative integers
#' * For odd positive integers > 1, values are computed numerically
#'
#' **Implementation:**
#'
#' The function uses different computational strategies depending on the argument:
#' * For 0 < z < 1: Rational approximation form
#' * For 1 < z < 4: Rational approximation around nearby integers
#' * For z > 4: Simple rational approximation series
#' * Reflection formula for negative arguments
#' * Pre-computed cached values for positive odd integers
#' * Specialized rational approximations for standard floating-point precisions
#'
#' **Applications:**
#'
#' The Riemann zeta function appears in number theory (distribution of primes),
#' physics (quantum field theory, statistical mechanics), and probability theory.
#' The famous Riemann Hypothesis concerns the non-trivial zeros of this function.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/zetas/zeta.html) for more details on the mathematical background.
#' @param z Real number input
#' @return The value of the Riemann zeta function ζ(z).
#' @export
#' @examples
#' # Riemann Zeta Function
#' zeta(2)  # Should return pi^2 / 6 ≈ 1.6449340668
#' zeta(3)  # Apéry's constant ≈ 1.2020569032
#' zeta(4)  # pi^4 / 90 ≈ 1.0823232337
zeta <- function(z) {
  .Call(`zeta_`, z)
}
