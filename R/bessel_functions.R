#' @title Bessel Functions, Their Derivatives, and Zeros
#' @name bessel_functions
#' @description Functions to compute Bessel functions of the first and second kind, their modified versions, spherical Bessel functions, and their derivatives and zeros.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bessel.html) for more details on the mathematical background.
#' @param v Order of the Bessel function
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
