#' @title Legendre Polynomials and Related Functions
#' @name legendre_polynomials
#' @description
#' Functions to compute Legendre polynomials of the first and second kind, their derivatives,
#' zeros, and related functions.
#'
#' Legendre polynomials are orthogonal polynomials that are solutions to Legendre's
#' differential equation. They appear in physics (multipole expansions, solutions to
#' Laplace's equation in spherical coordinates) and numerical analysis (Gaussian quadrature).
#'
#' **Legendre Polynomials of the First Kind P_n(x):**
#'
#' Standard solutions to the Legendre differential equation.
#' * Domain: -1 ≤ x ≤ 1 (domain error outside this range)
#' * Reflection formula: P_{-l-1}(x) = P_l(x)
#' * `legendre_p(n, x)`: Evaluates P_n(x)
#' * `legendre_p_prime(n, x)`: Derivative of P_n(x)
#' * `legendre_p_zeros(n)`: Returns zeros in increasing order. For odd n, first zero is 0.
#'   Computed using Newton's method with Tricomi's initial estimates (O(n²) complexity)
#'
#' **Associated Legendre Polynomials P_n^m(x):**
#'
#' * `legendre_p_m(n, m, x)`: Evaluates P_n^m(x)
#' * Includes Condon-Shortley phase term (-1)^m matching Abramowitz & Stegun definition
#' * Negative values of n and m handled through identity relations
#'
#' **Legendre Polynomials of the Second Kind Q_n(x):**
#'
#' Second solution to the Legendre differential equation.
#' * `legendre_q(n, x)`: Evaluates Q_n(x)
#' * Domain: -1 ≤ x ≤ 1 (domain error otherwise)
#'
#' **Recurrence Relations:**
#'
#' Efficient computation using three-term recurrence at fixed x with increasing degree:
#' * `legendre_next(n, x, Pl, Plm1)`: Computes P_{n+1}(x) from P_n and P_{n-1}
#' * `legendre_next_m(n, m, x, Pl, Plm1)`: Computes P_{n+1}^m(x) from previous values
#'
#' Recurrence relations guarantee low absolute error but cannot guarantee low relative
#' error near polynomial roots.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/legendre.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param m Order of the polynomial (for associated Legendre polynomials)
#' @param x Argument of the polynomial (must be in \eqn{[-1, 1]})
#' @param Pl Value of the Legendre polynomial P_l(x)
#' @param Plm1 Value of the Legendre polynomial P_{l-1}(x)
#' @return A single numeric value with the computed Legendre polynomial, its derivative, or zeros (as a vector).
#' @examples
#' # Legendre polynomial of the first kind P_2(0.5)
#' legendre_p(2, 0.5)
#' # Derivative of the Legendre polynomial of the first kind P_2'(0.5)
#' legendre_p_prime(2, 0.5)
#' # Zeros of the Legendre polynomial of the first kind P_2
#' legendre_p_zeros(2)
#' # Associated Legendre polynomial P_2^1(0.5)
#' legendre_p_m(2, 1, 0.5)
#' # Legendre polynomial of the second kind Q_2(0.5)
#' legendre_q(2, 0.5)
#' # Next Legendre polynomial of the first kind P_3(0.5) using P_2(0.5) and P_1(0.5)
#' legendre_next(2, 0.5, legendre_p(2, 0.5), legendre_p(1, 0.5))
#' # Next associated Legendre polynomial P_3^1(0.5) using P_2^1(0.5) and P_1^1(0.5)
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
#' @description
#' Functions to compute Laguerre polynomials and associated Laguerre polynomials.
#'
#' Laguerre polynomials are orthogonal polynomials that appear in the solution of the
#' quantum harmonic oscillator, hydrogen atom wavefunctions, and various problems in
#' mathematical physics and probability theory.
#'
#' **Standard Laguerre Polynomials L_n(x):**
#'
#' * `laguerre(n, x)`: Evaluates the Laguerre polynomial of degree n at point x
#' * Solutions to Laguerre's differential equation
#' * Orthogonal with respect to the weight function e^{-x} on [0, ∞)
#'
#' **Associated Laguerre Polynomials L_n^m(x):**
#'
#' * `laguerre_m(n, m, x)`: Evaluates the associated Laguerre polynomial of degree n
#'   and order m at point x
#' * Generalizations of the standard Laguerre polynomials
#'
#' **Recurrence Relations:**
#'
#' Three-term recurrence relations enable efficient sequential computation:
#' * `laguerre_next(n, x, Ln, Lnm1)`: Computes L_{n+1}(x) from L_n and L_{n-1}
#' * `laguerre_next_m(n, m, x, Ln, Lnm1)`: Computes L_{n+1}^m(x) from previous values
#'
#' **Implementation Notes:**
#'
#' Functions use stable three-term recurrence relations that guarantee low absolute
#' error but cannot guarantee low relative error near polynomial roots.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/laguerre.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param m Order of the polynomial (for associated Laguerre polynomials)
#' @param x Argument of the polynomial
#' @param Ln Value of the Laguerre polynomial L_n(x)
#' @param Lnm1 Value of the Laguerre polynomial L_{n-1}(x)
#' @return A single numeric value with the computed Laguerre polynomial.
#' @examples
#' # Laguerre polynomial L_2(0.5)
#' laguerre(2, 0.5)
#' # Associated Laguerre polynomial L_2^1(0.5)
#' laguerre_m(2, 1, 0.5)
#' # Next Laguerre polynomial L_3(0.5) using L_2(0.5) and L_1(0.5)
#' laguerre_next(2, 0.5, laguerre(2, 0.5), laguerre(1, 0.5))
#' # Next associated Laguerre polynomial L_3^1(0.5) using L_2^1(0.5) and L_1^1(0.5)
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
#' @description
#' Functions to compute Hermite polynomials using three-term recurrence relations.
#'
#' Hermite polynomials are orthogonal polynomials that appear in probability theory
#' (as derivatives of the Gaussian function), quantum mechanics (quantum harmonic
#' oscillator), and numerical analysis.
#'
#' **Hermite Polynomials H_n(x):**
#'
#' * `hermite(n, x)`: Evaluates the Hermite polynomial of degree n at point x
#' * Orthogonal with respect to the weight function \deqn{e^{-x²}} on (-∞, ∞)
#' * Appear as eigenfunctions of the quantum harmonic oscillator
#'
#' **Recurrence Relation:**
#'
#' * `hermite_next(n, x, Hn, Hnm1)`: Computes \deqn{H_{n+1}(x)} from H_n and \deqn{H_{n-1}}
#' * Uses stable three-term recurrence for sequential computation
#'
#' **Implementation Notes:**
#'
#' * Guarantees low absolute error but not low relative error near polynomial roots
#' * Values greater than ~120 for n are unlikely to produce sensible results
#' * Relative errors may grow arbitrarily large when the function is very close to a root
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/hermite.html) for more details on the mathematical background.
#' @param n Degree of the polynomial (practical limit ~120)
#' @param x Argument of the polynomial
#' @param Hn Value of the Hermite polynomial H_n(x)
#' @param Hnm1 Value of the Hermite polynomial \deqn{H_{n-1}(x)}
#' @return A single numeric value with the computed Hermite polynomial.
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
#' @description
#' Functions to compute Chebyshev polynomials of the first and second kind, and
#' efficiently evaluate Chebyshev series using Clenshaw's recurrence algorithm.
#'
#' Chebyshev polynomials are orthogonal polynomials used extensively in approximation
#' theory, numerical analysis, and spectral methods. They minimize the Runge phenomenon
#' in polynomial interpolation.
#'
#' **Chebyshev Polynomials of the First Kind T_n(x):**
#'
#' * `chebyshev_t(n, x)`: Evaluates T_n(x)
#' * Recurrence relation: \deqn{T_{n+1}(x) = 2xT_n(x) - T_{n-1}(x)} for n > 0
#' * Initial conditions: T_0(x) = 1, T_1(x) = x
#' * `chebyshev_t_prime(n, x)`: Derivative of T_n(x)
#' * Stable evaluation for x ∈ \eqn{[-1, 1]} (mixed forward-backward stable)
#'
#' **Chebyshev Polynomials of the Second Kind U_n(x):**
#'
#' * `chebyshev_u(n, x)`: Evaluates U_n(x)
#' * Related to T_n by differentiation
#'
#' **Recurrence Relation:**
#'
#' * `chebyshev_next(x, Tn, Tn_1)`: Computes \deqn{T_{n+1}(x)} from T_n and \deqn{T_{n-1}}
#'
#' **Clenshaw's Recurrence Algorithm:**
#'
#' Efficient O(n) evaluation of Chebyshev series (alternative to O(n²) direct computation):
#' * `chebyshev_clenshaw_recurrence(c, x)`: Evaluates Chebyshev series with
#'   coefficients c at point x on standard interval \eqn{[-1, 1]}
#' * `chebyshev_clenshaw_recurrence_ab(c, a, b, x)`: Evaluates Chebyshev series
#'   on arbitrary interval \eqn{[a, b]} using Reinsch's modification
#'
#' **Stability:**
#'
#' Evaluation by three-term recurrence is known to be mixed forward-backward stable
#' for x ∈ \eqn{[-1, 1]}. Stability outside this interval is not established.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/chebyshev.html) for more details on the mathematical background.
#' @param n Degree of the polynomial
#' @param x Argument of the polynomial (typically in \eqn{[-1, 1]} for stability)
#' @param Tn Value of the Chebyshev polynomial T_n(x)
#' @param Tn_1 Value of the Chebyshev polynomial T_{n-1}(x)
#' @param c Vector of coefficients for the Chebyshev series
#' @param a Lower bound of the interval (for interval transformation)
#' @param b Upper bound of the interval (for interval transformation)
#' @return A single numeric value with the computed Chebyshev polynomial or series evaluation.
#' @examples
#' # Chebyshev polynomial of the first kind T_2(0.5)
#' chebyshev_t(2, 0.5)
#' # Chebyshev polynomial of the second kind U_2(0.5)
#' chebyshev_u(2, 0.5)
#' # Derivative of the Chebyshev polynomial of the first kind T_2'(0.5)
#' chebyshev_t_prime(2, 0.5)
#' # Next Chebyshev polynomial of the first kind T_3(0.5) using T_2(0.5) and T_1(0.5)
#' chebyshev_next(0.5, chebyshev_t(2, 0.5), chebyshev_t(1, 0.5))
#' # Evaluate Chebyshev series with Clenshaw's algorithm
#' chebyshev_clenshaw_recurrence(c(1, 0, -1), 0.5)
#' # Evaluate Chebyshev series on interval [0, 1]
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
