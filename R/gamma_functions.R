#' @title Gamma Functions
#' @name gamma_functions
#' @description
#' Functions to compute the gamma function, its logarithm, digamma, trigamma, polygamma,
#' and various incomplete gamma functions.
#'
#' The gamma function is a fundamental special function that extends the factorial
#' function to real and complex numbers.
#'
#' **Gamma Function Γ(z):**
#'
#' * `tgamma(z)`: Computes Γ(z), the true gamma function
#' * Key mathematical relationships:
#'   - Recursion formula: Γ(z) = Γ(z+1)/z
#'   - Reflection formula: Γ(z)·Γ(1-z) = π/sin(πz)
#'   - Identity: Γ(z+1) = z·Γ(z)
#' * Implementation uses Lanczos approximation for standard precision and
#'   Stirling's approximation for large z
#'
#' * `tgamma1pm1(z)`: Computes Γ(1+z) - 1 with enhanced numerical stability
#'   for very small z values, avoiding precision loss
#'
#' * `lgamma_boost(z)`: Returns log(Γ(z)), the logarithm of the gamma function
#'
#' **Derivative Functions:**
#'
#' * `digamma_boost(z)`: The digamma (psi) function ψ(z) = d/dz\\[ln(Γ(z))\\],
#'   the logarithmic derivative of the gamma function
#'   - Reflection formula: ψ(1-z) = ψ(z) + π/tan(πz)
#'   - Recurrence relation: ψ(z+1) = ψ(z) + 1/z
#'
#' * `trigamma_boost(z)`: The trigamma function, the second derivative of ln(Γ(z))
#'
#' * `polygamma(n, z)`: The nth derivative of the digamma function (n-th order polygamma)
#'
#' **Ratios:**
#'
#' * `tgamma_ratio(a, b)`: Computes Γ(a)/Γ(b)
#' * `tgamma_delta_ratio(a, delta)`: Computes Γ(a)/Γ(a + delta)
#'
#' **Incomplete Gamma Functions:**
#'
#' These functions require a > 0 and z ≥ 0.
#'
#' * **Normalized (Regularized) Functions** (return values in \eqn{[0, 1]}):
#'   - `gamma_p(a, z)`: Normalized lower incomplete gamma P(a, z).
#'     Changes rapidly from 0 to 1 around z = a
#'   - `gamma_q(a, z)`: Normalized upper incomplete gamma Q(a, z).
#'     Changes rapidly from 1 to 0 around z = a
#'   - Note: P(a, z) + Q(a, z) = 1
#'
#' * **Non-normalized Functions** (return values in \eqn{[0, Γ(a)]}):
#'   - `tgamma_lower(a, z)`: Full lower incomplete gamma function
#'   - `tgamma_upper(a, z)`: Full upper incomplete gamma function
#'
#' **Inverse Functions:**
#'
#' * `gamma_p_inv(a, p)`: Returns z such that p = P(a, z)
#' * `gamma_q_inv(a, q)`: Returns z such that q = Q(a, z)
#' * `gamma_p_inva(z, p)`: Returns a such that p = P(a, z)
#' * `gamma_q_inva(z, q)`: Returns a such that q = Q(a, z)
#'
#' **Derivative:**
#'
#' * `gamma_p_derivative(a, z)`: Computes the derivative of the normalized
#'   lower incomplete gamma function with respect to z
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_gamma.html) for more details on the mathematical background.
#' @param z Input numeric value for the gamma function
#' @param n Order of the polygamma function (non-negative integer)
#' @param a Argument for the incomplete gamma functions (must be positive)
#' @param b Denominator argument for the ratio of gamma functions
#' @param delta Increment for the ratio of gamma functions
#' @param q Probability value for the incomplete gamma functions (0 ≤ q ≤ 1)
#' @param p Probability value for the incomplete gamma functions (0 ≤ p ≤ 1)
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
#' # Normalized lower incomplete gamma function P(a, z) for a = 5, z = 2
#' gamma_p(5, 2)
#' # Normalized upper incomplete gamma function Q(a, z) for a = 5, z = 2
#' gamma_q(5, 2)
#' # Full lower incomplete gamma function for a = 5, z = 2
#' tgamma_lower(5, 2)
#' # Full upper incomplete gamma function for a = 5, z = 2
#' tgamma_upper(5, 2)
#' # Inverse of the normalized upper incomplete gamma function for a = 5, q = 0.5
#' gamma_q_inv(5, 0.5)
#' # Inverse of the normalized lower incomplete gamma function for a = 5, p = 0.5
#' gamma_p_inv(5, 0.5)
#' # Inverse of the normalized upper incomplete gamma function with respect to a for z = 2, q = 0.5
#' gamma_q_inva(2, 0.5)
#' # Inverse of the normalized lower incomplete gamma function with respect to a for z = 2, p = 0.5
#' gamma_p_inva(2, 0.5)
#' # Derivative of the normalized lower incomplete gamma function for a = 5, z = 2
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
