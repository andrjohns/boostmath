#' @title Elliptic Integrals
#' @name elliptic_integrals
#' @description
#' Functions to compute various elliptic integrals, including Carlson's elliptic integrals
#' and Legendre-form incomplete elliptic integrals.
#'
#' Elliptic integrals are integrals of the form where the integrand is a rational function
#' of elementary functions and a square root of a cubic or quartic polynomial. They appear
#' in many physical problems including pendulum motion, arc length of ellipses, and
#' electromagnetic field calculations.
#'
#' **Carlson's Elliptic Integrals:**
#'
#' Carlson's forms provide unified computational methods with satisfactory precision,
#' superior to traditional Gauss and Landen transformations. Implementation uses the
#' duplication theorem to iteratively bring parameters together.
#'
#' * `ellint_rf(x, y, z)`: Carlson's elliptic integral RF (first kind).
#'   Requires all arguments non-negative with at most one equal to zero.
#'
#' * `ellint_rd(x, y, z)`: Carlson's elliptic integral RD.
#'   Requires x, y non-negative with at most one zero, and z ≥ 0.
#'
#' * `ellint_rj(x, y, z, p)`: Carlson's elliptic integral RJ (third kind).
#'   Requires x, y, z non-negative with at most one zero, and p ≠ 0.
#'   For p < 0, returns Cauchy principal value.
#'
#' * `ellint_rc(x, y)`: Carlson's elliptic integral RC (degenerate form).
#'   Requires x > 0 and y ≠ 0. Equivalent to RF(x, y, y).
#'   For y < 0, returns Cauchy principal value.
#'
#' * `ellint_rg(x, y, z)`: Carlson's elliptic integral RG (second kind).
#'   Requires x and y to be non-negative.
#'
#' **Legendre-Form Elliptic Integrals:**
#'
#' * **First Kind F(φ, k) and K(k):**
#'   \deqn{F(\phi, k) = \int_0^\phi \frac{d\theta}{\sqrt{1 - k^2\sin^2\theta}}}
#'   - `ellint_1(k, phi)`: Incomplete form. Requires k²sin²(φ) < 1
#'   - `ellint_1(k)`: Complete form K(k) = F(π/2, k). Requires |k| < 1
#'
#' * **Second Kind E(φ, k) and E(k):**
#'   - `ellint_2(k, phi)`: Incomplete form. Requires k²sin²(φ) < 1
#'   - `ellint_2(k)`: Complete form E(k) = E(π/2, k). Requires |k| < 1
#'
#' * **Third Kind Π(n, φ, k) and Π(n, k):**
#'   - `ellint_3(k, n, phi)`: Incomplete form.
#'     Requires k²sin²(φ) < 1 and n < 1/sin²(φ)
#'   - `ellint_3(k, n)`: Complete form Π(n, k) = Π(n, π/2, k).
#'     Requires |k| < 1 and n < 1
#'   - Special cases: Π(0, φ, k) = F(φ, k)
#'
#' * **Elliptic Integral D(φ, k) and D(k):**
#'   Legendre's fourth integral combining the other three.
#'   - `ellint_d(k, phi)`: Incomplete form
#'   - `ellint_d(k)`: Complete form
#'
#' **Related Functions:**
#'
#' * `jacobi_zeta(k, phi)`: Jacobi zeta function
#' * `heuman_lambda(k, phi)`: Heuman's lambda function
#'
#' All Legendre-form functions are implemented in terms of Carlson's integrals
#' for computational efficiency and numerical stability.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ellint.html) for more details on the mathematical background.
#' @param x First parameter of Carlson's integral (must be non-negative)
#' @param y Second parameter of Carlson's integral
#' @param z Third parameter of Carlson's integral
#' @param p Fourth parameter of the integral (for Rj, must be non-zero)
#' @param k Elliptic modulus for Legendre-form integrals
#' @param n Characteristic for elliptic integrals of the third kind
#' @param phi Amplitude (angle) for incomplete elliptic integrals
#' @return A single numeric value with the computed elliptic integral.
#' @examples
#' # Carlson's elliptic integral Rf with parameters x = 1, y = 2, z = 3
#' ellint_rf(1, 2, 3)
#' # Carlson's elliptic integral Rd with parameters x = 1, y = 2, z = 3
#' ellint_rd(1, 2, 3)
#' # Carlson's elliptic integral Rj with parameters x = 1, y = 2, z = 3, p = 4
#' ellint_rj(1, 2, 3, 4)
#' # Carlson's elliptic integral Rc with parameters x = 1, y = 2
#' ellint_rc(1, 2)
#' # Carlson's elliptic integral Rg with parameters x = 1, y = 2, z = 3
#' ellint_rg(1, 2, 3)
#' # Incomplete elliptic integral of the first kind with k = 0.5, phi = pi/4
#' ellint_1(0.5, pi / 4)
#' # Complete elliptic integral of the first kind
#' ellint_1(0.5)
#' # Incomplete elliptic integral of the second kind with k = 0.5, phi = pi/4
#' ellint_2(0.5, pi / 4)
#' # Complete elliptic integral of the second kind
#' ellint_2(0.5)
#' # Incomplete elliptic integral of the third kind with k = 0.5, n = 0.5, phi = pi/4
#' ellint_3(0.5, 0.5, pi / 4)
#' # Complete elliptic integral of the third kind with k = 0.5, n = 0.5
#' ellint_3(0.5, 0.5)
#' # Incomplete elliptic integral D with k = 0.5, phi = pi/4
#' ellint_d(0.5, pi / 4)
#' # Complete elliptic integral D
#' ellint_d(0.5)
#' # Jacobi zeta function with k = 0.5, phi = pi/4
#' jacobi_zeta(0.5, pi / 4)
#' # Heuman's lambda function with k = 0.5, phi = pi/4
#' heuman_lambda(0.5, pi / 4)
NULL

#' @rdname elliptic_integrals
#' @export
ellint_rf <- function(x, y, z) {
  .Call(`ellint_rf_`, x, y, z)
}

#' @rdname elliptic_integrals
#' @export
ellint_rd <- function(x, y, z) {
  .Call(`ellint_rd_`, x, y, z)
}

#' @rdname elliptic_integrals
#' @export
ellint_rj <- function(x, y, z, p) {
  .Call(`ellint_rj_`, x, y, z, p)
}

#' @rdname elliptic_integrals
#' @export
ellint_rc <- function(x, y) {
  .Call(`ellint_rc_`, x, y)
}

#' @rdname elliptic_integrals
#' @export
ellint_rg <- function(x, y, z) {
  .Call(`ellint_rg_`, x, y, z)
}

#' @rdname elliptic_integrals
#' @export
ellint_1 <- function(k, phi = NULL) {
  if (!is.null(phi)) {
    return(.Call(`ellint_1_incomplete_`, k, phi))
  }
  .Call(`ellint_1_`, k)
}

#' @rdname elliptic_integrals
#' @export
ellint_2 <- function(k, phi = NULL) {
  if (!is.null(phi)) {
    return(.Call(`ellint_2_incomplete_`, k, phi))
  }
  .Call(`ellint_2_`, k)
}

#' @rdname elliptic_integrals
#' @export
ellint_3 <- function(k, n, phi = NULL) {
  if (!is.null(phi)) {
    return(.Call(`ellint_3_incomplete_`, k, n, phi))
  }
  .Call(`ellint_3_`, k, n)
}

#' @rdname elliptic_integrals
#' @export
ellint_d <- function(k, phi = NULL) {
  if (!is.null(phi)) {
    return(.Call(`ellint_d_incomplete_`, k, phi))
  }
  .Call(`ellint_d_`, k)
}

#' @rdname elliptic_integrals
#' @export
jacobi_zeta <- function(k, phi) {
  .Call(`jacobi_zeta_`, k, phi)
}

#' @rdname elliptic_integrals
#' @export
heuman_lambda <- function(k, phi) {
  .Call(`heuman_lambda_`, k, phi)
}
