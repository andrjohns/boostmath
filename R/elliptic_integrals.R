#' @title Elliptic Integrals
#' @name elliptic_integrals
#' @description Functions to compute various elliptic integrals, including Carlson's
#' elliptic integrals and incomplete elliptic integrals.
#'
#' **Elliptic Integrals - Carlson Form**
#'
#' * `ellint_rf(x, y, z)`: Carlson's Elliptic Integral \eqn{R_F}
#'
#' \deqn{R_F(x, y, z) = \frac{1}{2}\int_{0}^\infty[(t+x)(t+y)(t+z)]^{-\frac{1}{2}}dt}
#'
#' * `ellint_rd(x, y, z)`: Carlson's Elliptic Integral \eqn{R_D}
#'
#' \deqn{R_D(x, y, z) = \frac{3}{2}\int_{0}^\infty[(t+x)(t+y)]^{-\frac{1}{2}}(t+z)^{-\frac{3}{2}}dt}
#'
#' * `ellint_rj(x, y, z, p)`: Carlson's Elliptic Integral \eqn{R_J}
#'
#' \deqn{R_J(x, y, z) = \frac{3}{2}\int_{0}^\infty(t+p)^{-1}[(t+x)(t+y)(t+z)]^{-\frac{1}{2}}dt}
#'
#' * `ellint_rc(x, y)`: Carlson's Elliptic Integral \eqn{R_C}
#'
#' \deqn{R_C(x, y) = \frac{1}{2}\int_{0}^\infty(t+x)^{-\frac{1}{2}}(t+y)^{-1}dt}
#'
#' * `ellint_rg(x, y, z)`: Carlson's Elliptic Integral \eqn{R_G}
#'
#' \deqn{R_G(x, y, z) = \frac{1}{4\pi}\int_{0}^{2\pi}\int_{0}^{\pi}\sqrt{\left(x\sin^2\theta\cos^2\phi+y\sin^2\theta\sin^2\phi + z\cos^2\theta\right)}\sin\theta d\theta \phi}
#'
#' **Elliptic Integrals of the First Kind - Legendre Form**
#'
#' * `ellint_1(k, phi)`: Incomplete elliptic integral of the first kind: \eqn{F(\phi, k)}:
#'
#' \deqn{F(\phi, k) = \int_0^{\phi}\frac{d\theta}{\sqrt{1-k^2\sin^2\theta}}d\theta}
#'
#' **Elliptic Integrals of the Second Kind - Legendre Form**
#'
#' * `ellint_2(k, phi)`: Incomplete elliptic integral of the second kind: \eqn{E(\phi, k)}:
#'
#' \deqn{E(\phi, k) = \int_0^{\phi}\sqrt{1-k^2\sin^2\theta}d\theta}
#'
#' **Elliptic Integrals of the Third Kind - Legendre Form**
#'
#' * `ellint_3(k, n, phi)`: Incomplete elliptic integral of the third kind: \eqn{\Pi(n, \phi, k)}:
#'
#' \deqn{\Pi(n, \phi, k) = \int_0^{\phi}\frac{d\theta}{\left(1-n\sin^2\theta\right)\sqrt{1-k^2\sin^2\theta}}d\theta}
#'
#' **Elliptic Integral D - Legendre Form**
#'
#' * `ellint_d(k, phi)`: Incomplete elliptic integral \eqn{D(\phi, k)}:
#'
#' \deqn{D(\phi, k) = \frac{(F(\phi, k) - E(\phi, k))}{k^2}}
#'
#' **Jacobi Zeta Function**
#'
#' * `jacobi_zeta(k, phi)`: Jacobi Zeta function \eqn{Z(\phi, k)}:
#'
#' \deqn{Z(\phi, k) = E(\phi, k) - \frac{E(\frac{\pi}{2},k)F(\phi,k)}{F(\frac{\pi}{2}, k)}}
#'
#' **Heuman Lambda Function**
#'
#' * `heuman_lambda(k, phi)`: Heuman Lambda function \eqn{\Lambda_0(\phi, k)}:
#'
#' \deqn{\Lambda_0(\phi, k) = \frac{F(\phi,\sqrt{1-k^2})}{F(\frac{\pi}{2}, \sqrt{1-k^2})} + \frac{2}{\pi}F(\frac{\pi}{2},k)Z(\phi, \sqrt{1-k^2})}
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ellint.html) for more details on the mathematical background.
#' @param x First parameter of the integral
#' @param y Second parameter of the integral
#' @param z Third parameter of the integral
#' @param p Fourth parameter of the integral (for Rj)
#' @param k Elliptic modulus (for incomplete elliptic integrals)
#' @param n Characteristic (for incomplete elliptic integrals of the third kind)
#' @param phi Amplitude (for incomplete elliptic integrals)
#' @return A single numeric value with the computed elliptic integral.
#' @examples
#' # Carlson's elliptic integral Rf with parameters x = 1, y = 2, z = 3
#' ellint_rf(1, 2, 3)
#' #' # Carlson's elliptic integral Rd with parameters x = 1, y = 2, z = 3
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
