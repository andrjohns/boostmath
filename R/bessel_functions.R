#' @title Bessel Functions, Their Derivatives, and Zeros
#' @name bessel_functions
#' @description
#' Functions to compute Bessel functions of the first and second kind, their modified versions,
#' spherical Bessel functions, and their derivatives and zeros.
#'
#' Bessel functions are solutions to Bessel's ordinary differential equation and appear in many
#' problems with cylindrical or spherical symmetry, such as wave propagation, heat conduction,
#' and quantum mechanics.
#'
#' **Bessel Functions of the First and Second Kinds**
#'
#' * `cyl_bessel_j(v, x)`: Computes the Bessel function of the first kind \eqn{J_v(x)}:
#'
#' \deqn{J_v(x) = \left(\frac{1}{2}x\right)^v\sum_{k=0}^\infty{\frac{\left(-\frac{1}{4}x^2\right)^k}{k!\Gamma(v+k+1)}}}
#'
#' * `cyl_neumann(v, x)`: Computes the Bessel function of the second kind \eqn{Y_v(x) = N_v(x)}:
#'
#' \deqn{Y_v(x) = \frac{J_v(x)\cos(v\pi) - J_{-v}(x)}{\sin(v\pi)}}
#'
#' **Modified Bessel Functions of the First and Second Kinds**
#'
#' * `cyl_bessel_i(v, x)`: Computes the modified Bessel function of the first kind \eqn{I_v(x)}:
#'
#' \deqn{I_v(x) = \left(\frac{1}{2}x\right)^v\sum_{k=0}^\infty{\frac{\left(\frac{1}{4}x^2\right)^k}{k!\Gamma(v+k+1)}}}
#'
#' * `cyl_bessel_k(v, x)`: Computes the modified Bessel function of the second kind \eqn{K_v(x)}:
#'
#' \deqn{K_v(x) = \frac{\pi}{2} \frac{I_{-v}(x) - I_{v}(x)}{\sin(v\pi)}}
#'
#' **Spherical Bessel Functions of the First and Second Kinds**
#'
#' * `sph_bessel(v, x)`: Computes the Spherical Bessel function of the first kind \eqn{j_v(x)}:
#'
#' \deqn{j_v(x) = \sqrt{\frac{\pi}{2x}}J_{v+\frac{1}{2}}(x)}
#'
#' * `sph_neumann(v, x)`: Computes the Spherical Bessel function of the second kind \eqn{y_v(x) = n_v(x)}:
#'
#' \deqn{y_v(x) = \sqrt{\frac{\pi}{2x}}Y_{v+\frac{1}{2}}(x)}
#'
#' **Derivatives:**
#'
#' The _prime functions compute the derivatives with respect to x of the corresponding
#' Bessel functions:
#'
#' \deqn{J'_v(x) = \frac{J_{v-1}(x)-J_{v+1}(x)}{2}}
#' \deqn{Y'_v(x) = \frac{Y_{v-1}(x)-Y_{v+1}(x)}{2}}
#' \deqn{I'_v(x) = \frac{I_{v-1}(x)-I_{v+1}(x)}{2}}
#' \deqn{K'_v(x) = \frac{K_{v-1}(x)-K_{v+1}(x)}{-2}}
#' \deqn{j'_v(x) = \left(\frac{v}{x}\right)j_v(x)-j_{v+1}(x)}
#' \deqn{y'_v(x) = \left(\frac{v}{x}\right)y_v(x)-y_{v+1}(x)}
#'
#' **Zeros:**
#'
#' The zero functions find the zeros of J_v and Y_v (where the function equals zero),
#' indexed starting from 1.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bessel.html) for more details on the mathematical background.
#' @param v Order of the Bessel function (can be any real number)
#' @param x Argument of the Bessel function
#' @param m The index of the zero to find (1-based).
#' @param start_index The starting index for the zeros (1-based).
#' @param number_of_zeros The number of zeros to find.
#' @return Single numeric value for the Bessel functions and their derivatives, or a vector of length `number_of_zeros` for the multiple zero functions.
#' @examples
#' # Bessel function of the first kind J_0(1)
#' cyl_bessel_j(0, 1)
#' # Bessel function of the second kind Y_0(1)
#' cyl_neumann(0, 1)
#' # Modified Bessel function of the first kind I_0(1)
#' cyl_bessel_i(0, 1)
#' # Modified Bessel function of the second kind K_0(1)
#' cyl_bessel_k(0, 1)
#' # Spherical Bessel function of the first kind j_0(1)
#' sph_bessel(0, 1)
#' # Spherical Bessel function of the second kind y_0(1)
#' sph_neumann(0, 1)
#' # Derivative of the Bessel function of the first kind J_0(1)
#' cyl_bessel_j_prime(0, 1)
#' # Derivative of the Bessel function of the second kind Y_0(1)
#' cyl_neumann_prime(0, 1)
#' # Derivative of the modified Bessel function of the first kind I_0(1)
#' cyl_bessel_i_prime(0, 1)
#' # Derivative of the modified Bessel function of the second kind K_0(1)
#' cyl_bessel_k_prime(0, 1)
#' # Derivative of the spherical Bessel function of the first kind j_0(1)
#' sph_bessel_prime(0, 1)
#' # Derivative of the spherical Bessel function of the second kind y_0(1)
#' sph_neumann_prime(0, 1)
#' # Finding the first zero of the Bessel function of the first kind J_0
#' cyl_bessel_j_zero(0, 1)
#' # Finding the first zero of the Bessel function of the second kind Y_0
#' cyl_neumann_zero(0, 1)
#' # Finding multiple zeros of the Bessel function of the first kind J_0 starting from index 1
#' cyl_bessel_j_zero(0, start_index = 1, number_of_zeros = 5)
#' # Finding multiple zeros of the Bessel function of the second kind Y_0 starting from index 1
#' cyl_neumann_zero(0, start_index = 1, number_of_zeros = 5)
NULL

#' @rdname bessel_functions
#' @export
cyl_bessel_j <- function(v, x) {
  .Call(`cyl_bessel_j_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_neumann <- function(v, x) {
  .Call(`cyl_neumann_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_bessel_j_zero <- function(v, m = NULL, start_index = NULL, number_of_zeros = NULL) {
  if (!is.null(m)) {
    if (!is.null(start_index) && !is.null(number_of_zeros)) {
      stop("Please provide either 'm' or 'start_index' and 'number_of_zeros', not both.",
          call. = FALSE)
    }
    return(.Call(`cyl_bessel_j_zero_`, v, m))
  }

  if (is.null(start_index) || is.null(number_of_zeros)) {
    stop("Both 'start_index' and 'number_of_zeros' must be provided when 'm' is NULL.",
         call. = FALSE)
  }
  .Call(`cyl_bessel_j_zero_multiple_`, v, start_index, number_of_zeros)
}

#' @rdname bessel_functions
#' @export
cyl_neumann_zero <- function(v, m = NULL, start_index = NULL, number_of_zeros = NULL) {
  if (!is.null(m)) {
    if (!is.null(start_index) && !is.null(number_of_zeros)) {
      stop("Please provide either 'm' or 'start_index' and 'number_of_zeros', not both.",
          call. = FALSE)
    }
    return(.Call(`cyl_neumann_zero_`, v, m))
  }

  if (is.null(start_index) || is.null(number_of_zeros)) {
    stop("Both 'start_index' and 'number_of_zeros' must be provided when 'm' is NULL.",
         call. = FALSE)
  }
  .Call(`cyl_neumann_zero_multiple_`, v, start_index, number_of_zeros)
}

#' @rdname bessel_functions
#' @export
cyl_bessel_i <- function(v, x) {
  .Call(`cyl_bessel_i_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_bessel_k <- function(v, x) {
  .Call(`cyl_bessel_k_`, v, x)
}

#' @rdname bessel_functions
#' @export
sph_bessel <- function(v, x) {
  .Call(`sph_bessel_`, v, x)
}

#' @rdname bessel_functions
#' @export
sph_neumann <- function(v, x) {
  .Call(`sph_neumann_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_bessel_j_prime <- function(v, x) {
  .Call(`cyl_bessel_j_prime_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_neumann_prime <- function(v, x) {
  .Call(`cyl_neumann_prime_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_bessel_i_prime <- function(v, x) {
  .Call(`cyl_bessel_i_prime_`, v, x)
}

#' @rdname bessel_functions
#' @export
cyl_bessel_k_prime <- function(v, x) {
  .Call(`cyl_bessel_k_prime_`, v, x)
}

#' @rdname bessel_functions
#' @export
sph_bessel_prime <- function(v, x) {
  .Call(`sph_bessel_prime_`, v, x)
}

#' @rdname bessel_functions
#' @export
sph_neumann_prime <- function(v, x) {
  .Call(`sph_neumann_prime_`, v, x)
}
