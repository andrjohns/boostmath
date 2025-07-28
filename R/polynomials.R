#' @title Legendre Polynomials and Related Functions
#' @name legendre_polynomials
#' @description Functions to compute Legendre polynomials of the first and second kind, their derivatives, zeros, and related functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/legendre.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param m Order of the polynomial (for Legendre polynomials of the first kind)
#' @param x Argument of the polynomial
#' @param Pl Value of the Legendre polynomial \eqn{(P_l(x))}
#' @param Plm1 Value of the Legendre polynomial \eqn{(P_{l-1}(x))}
#' @return A single numeric value with the computed Legendre polynomial, its derivative, zeros, or related functions.
#' @examples
#' # Legendre polynomial of the first kind P_2(0.5)
#' legendre_p(2, 0.5)
#' # Derivative of the Legendre polynomial of the first kind P_2'(0.5)
#' legendre_p_prime(2, 0.5)
#' # Zeros of the Legendre polynomial of the first kind P_2
#' legendre_p_zeros(2)
#' # Legendre polynomial of the first kind with order 1 P_2^1(0.5)
#' legendre_p_m(2, 1, 0.5)
#' # Legendre polynomial of the second kind Q_2(0.5)
#' legendre_q(2, 0.5)
#' # Next Legendre polynomial of the first kind P_3(0.5) using P_2(0.5) and P_1(0.5)
#' legendre_next(2, 0.5, legendre_p(2, 0.5), legendre_p(1, 0.5))
#' # Next Legendre polynomial of the first kind with order 1 P_3^1(0.5) using P_2^1(0.5) and P_1^1(0.5)
#' legendre_next_m(2, 1, 0.5, legendre_p_m(2, 1, 0.5), legendre_p_m(1, 1, 0.5))
NULL

#' @rdname legendre_polynomials
#' @export
legendre_p <- function(n, x) {
  .Call(`legendre_p_`, n, x)
}

#' @rdname legendre_polynomials
#' @export
legendre_p_prime <- function(n, x) {
  .Call(`legendre_p_prime_`, n, x)
}

#' @rdname legendre_polynomials
#' @export
legendre_p_zeros <- function(n) {
  .Call(`legendre_p_zeros_`, n)
}

#' @rdname legendre_polynomials
#' @export
legendre_p_m <- function(n, m, x) {
  .Call(`legendre_p_m_`, n, m, x)
}

#' @rdname legendre_polynomials
#' @export
legendre_q <- function(n, x) {
  .Call(`legendre_q_`, n, x)
}

#' @rdname legendre_polynomials
#' @export
legendre_next <- function(n, x, Pl, Plm1) {
  .Call(`legendre_next_`, n, x, Pl, Plm1)
}

#' @rdname legendre_polynomials
#' @export
legendre_next_m <- function(n, m, x, Pl, Plm1) {
  .Call(`legendre_next_m_`, n, m, x, Pl, Plm1)
}

#' @title Laguerre Polynomials and Related Functions
#' @name laguerre_polynomials
#' @description Functions to compute Laguerre polynomials of the first kind.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/laguerre.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param m Order of the polynomial (for Laguerre polynomials of the first kind)
#' @param x Argument of the polynomial
#' @param Ln Value of the Laguerre polynomial \eqn{(L_n(x))}
#' @param Lnm1 Value of the Laguerre polynomial \eqn{(L_{n-1}(x))}
#' @return A single numeric value with the computed Laguerre polynomial, its derivative, or related functions.
#' @examples
#' # Laguerre polynomial of the first kind L_2(0.5)
#' laguerre(2, 0.5)
#' # Laguerre polynomial of the first kind with order 1 L_2^1(0.5)
#' laguerre_m(2, 1, 0.5)
#' # Next Laguerre polynomial of the first kind L_3(0.5) using L_2(0.5) and L_1(0.5)
#' laguerre_next(2, 0.5, laguerre(2, 0.5), laguerre(1, 0.5))
#' # Next Laguerre polynomial of the first kind with order 1 L_3^1(0.5) using L_2^1(0.5) and L_1^1(0.5)
#' laguerre_next_m(2, 1, 0.5, laguerre_m(2, 1, 0.5), laguerre_m(1, 1, 0.5))
NULL

#' @rdname laguerre_polynomials
#' @export
laguerre <- function(n, x) {
  .Call(`laguerre_`, n, x)
}

#' @rdname laguerre_polynomials
#' @export
laguerre_m <- function(n, m, x) {
  .Call(`laguerre_m_`, n, m, x)
}

#' @rdname laguerre_polynomials
#' @export
laguerre_next <- function(n, x, Ln, Lnm1) {
  .Call(`laguerre_next_`, n, x, Ln, Lnm1)
}

#' @rdname laguerre_polynomials
#' @export
laguerre_next_m <- function(n, m, x, Ln, Lnm1) {
  .Call(`laguerre_next_m_`, n, m, x, Ln, Lnm1)
}

#' @title Hermite Polynomials and Related Functions
#' @name hermite_polynomials
#' @description Functions to compute Hermite polynomials.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/hermite.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param x Argument of the polynomial
#' @param Hn Value of the Hermite polynomial \eqn{(H_n(x))}
#' @param Hnm1 Value of the Hermite polynomial \eqn{(H_{n-1}(x))}
#' @return A single numeric value with the computed Hermite polynomial or its next value.
#' @examples
#' # Hermite polynomial H_2(0.5)
#' hermite(2, 0.5)
#' # Next Hermite polynomial H_3(0.5) using H_2(0.5) and H_1(0.5)
#' hermite_next(2, 0.5, hermite(2, 0.5), hermite(1, 0.5))
NULL

#' @rdname hermite_polynomials
#' @export
hermite <- function(n, x) {
  .Call(`hermite_`, n, x)
}

#' @rdname hermite_polynomials
#' @export
hermite_next <- function(n, x, Hn, Hnm1) {
  .Call(`hermite_next_`, n, x, Hn, Hnm1)
}

#' @title Chebyshev Polynomials and Related Functions
#' @name chebyshev_polynomials
#' @description Functions to compute Chebyshev polynomials of the first and second kind.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/chebyshev.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param x Argument of the polynomial
#' @param Tn Value of the Chebyshev polynomial \eqn{(T_n(x))}
#' @param Tn_1 Value of the Chebyshev polynomial \eqn{(T_{n-1}(x))}
#' @param c Coefficients of the Chebyshev polynomial
#' @param a Lower bound of the interval
#' @param b Upper bound of the interval
#' @return A single numeric value with the computed Chebyshev polynomial, its derivative, or related functions.
#' @examples
#' # Chebyshev polynomial of the first kind T_2(0.5)
#' chebyshev_t(2, 0.5)
#' # Chebyshev polynomial of the second kind U_2(0.5)
#' chebyshev_u(2, 0.5)
#' # Derivative of the Chebyshev polynomial of the first kind T_2'(0.5)
#' chebyshev_t_prime(2, 0.5)
#' # Next Chebyshev polynomial of the first kind T_3(0.5) using T_2(0.5) and T_1(0.5)
#' chebyshev_next(0.5, chebyshev_t(2, 0.5), chebyshev_t(1, 0.5))
#' # Chebyshev polynomial of the first kind using Clenshaw's recurrence with coefficients
#' # c = c(1, 0, -1) at x = 0.5
#' chebyshev_clenshaw_recurrence(c(1, 0, -1), 0.5)
#' # Chebyshev polynomial of the first kind using Clenshaw's recurrence with interval [0, 1]
#' chebyshev_clenshaw_recurrence_ab(c(1, 0, -1), 0, 1, 0.5)
NULL

#' @rdname chebyshev_polynomials
#' @export
chebyshev_next <- function(x, Tn, Tn_1) {
  .Call(`chebyshev_next_`, x, Tn, Tn_1)
}

#' @rdname chebyshev_polynomials
#' @export
chebyshev_t <- function(n, x) {
  .Call(`chebyshev_t_`, n, x)
}

#' @rdname chebyshev_polynomials
#' @export
chebyshev_u <- function(n, x) {
  .Call(`chebyshev_u_`, n, x)
}

#' @rdname chebyshev_polynomials
#' @export
chebyshev_t_prime <- function(n, x) {
  .Call(`chebyshev_t_prime_`, n, x)
}

#' @rdname chebyshev_polynomials
#' @export
chebyshev_clenshaw_recurrence <- function(c, x) {
  .Call(`chebyshev_clenshaw_recurrence_`, c, x)
}

#' @rdname chebyshev_polynomials
#' @export
chebyshev_clenshaw_recurrence_ab <- function(c, a, b, x) {
  .Call(`chebyshev_clenshaw_recurrence_ab_`, c, a, b, x)
}

#' @title Spherical Harmonics
#' @name spherical_harmonics
#' @description Functions to compute spherical harmonics and related functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/sph_harm.html)
#' @param n Degree of the spherical harmonic
#' @param m Order of the spherical harmonic
#' @param theta Polar angle (colatitude)
#' @param phi Azimuthal angle (longitude)
#' @return A single complex value with the computed spherical harmonic function, or its real and imaginary parts.
#' @examples
#' # Spherical harmonic function Y_2^1(0.5, 0.5)
#' spherical_harmonic(2, 1, 0.5, 0.5)
#' # Real part of the spherical harmonic function Y_2^1(0.5, 0.5)
#' spherical_harmonic_r(2, 1, 0.5, 0.5)
#' # Imaginary part of the spherical harmonic function Y_2^1(0.5, 0.5)
#' spherical_harmonic_i(2, 1, 0.5, 0.5)
NULL

#' @rdname spherical_harmonics
#' @export
spherical_harmonic <- function(n, m, theta, phi) {
  .Call(`spherical_harmonic_`, n, m, theta, phi)
}

#' @rdname spherical_harmonics
#' @export
spherical_harmonic_r <- function(n, m, theta, phi) {
  .Call(`spherical_harmonic_r_`, n, m, theta, phi)
}

#' @rdname spherical_harmonics
#' @export
spherical_harmonic_i <- function(n, m, theta, phi) {
  .Call(`spherical_harmonic_i_`, n, m, theta, phi)
}

#' @title Gegenbauer Polynomials and Related Functions
#' @name gegenbauer_polynomials
#' @description Functions to compute Gegenbauer polynomials, their derivatives, and related functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/gegenbauer.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param lambda Parameter of the polynomial
#' @param x Argument of the polynomial
#' @param k Order of the derivative
#' @return A single numeric value with the computed Gegenbauer polynomial, its derivative, or k-th derivative.
#' @examples
#' # Gegenbauer polynomial C_2^(1)(0.5)
#' gegenbauer(2, 1, 0.5)
#' # Derivative of the Gegenbauer polynomial C_2^(1)'(0.5)
#' gegenbauer_prime(2, 1, 0.5)
#' # k-th derivative of the Gegenbauer polynomial C_2^(1)''(0.5)
#' gegenbauer_derivative(2, 1, 0.5, 2)
NULL

#' @rdname gegenbauer_polynomials
#' @export
gegenbauer <- function(n, lambda, x) {
  .Call(`gegenbauer_`, n, lambda, x)
}

#' @rdname gegenbauer_polynomials
#' @export
gegenbauer_prime <- function(n, lambda, x) {
  .Call(`gegenbauer_prime_`, n, lambda, x)
}

#' @rdname gegenbauer_polynomials
#' @export
gegenbauer_derivative <- function(n, lambda, x, k) {
  .Call(`gegenbauer_derivative_`, n, lambda, x, k)
}

#' @title Jacobi Polynomials and Related Functions
#' @name jacobi_polynomials
#' @description Functions to compute Jacobi polynomials, their derivatives, and related functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/jacobi.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param alpha First parameter of the polynomial
#' @param beta Second parameter of the polynomial
#' @param x Argument of the polynomial
#' @param k Order of the derivative
#' @return A single numeric value with the computed Jacobi polynomial, its derivative, or k-th derivative.
#' @examples
#' # Jacobi polynomial P_2^(1, 2)(0.5)
#' jacobi(2, 1, 2, 0.5)
#' # Derivative of the Jacobi polynomial P_2^(1, 2)'(0.5)
#' jacobi_prime(2, 1, 2, 0.5)
#' # Second derivative of the Jacobi polynomial P_2^(1, 2)''(0.5)
#' jacobi_double_prime(2, 1, 2, 0.5)
#' # 3rd derivative of the Jacobi polynomial P_2^(1, 2)^(k)(0.5)
#' jacobi_derivative(2, 1, 2, 0.5, 3)
NULL

#' @rdname jacobi_polynomials
#' @export
jacobi <- function(n, alpha, beta, x) {
  .Call(`jacobi_`, n, alpha, beta, x)
}

#' @rdname jacobi_polynomials
#' @export
jacobi_prime <- function(n, alpha, beta, x) {
  .Call(`jacobi_prime_`, n, alpha, beta, x)
}

#' @rdname jacobi_polynomials
#' @export
jacobi_double_prime <- function(n, alpha, beta, x) {
  .Call(`jacobi_double_prime_`, n, alpha, beta, x)
}

#' @rdname jacobi_polynomials
#' @export
jacobi_derivative <- function(n, alpha, beta, x, k) {
  .Call(`jacobi_derivative_`, n, alpha, beta, x, k)
}
