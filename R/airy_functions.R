#' @title Airy Functions
#' @description
#' Functions to compute the Airy functions \eqn{Ai} and \eqn{Bi}, their derivatives, and their zeros.
#'
#' The Airy functions are the two linearly independent solutions to the differential equation:
#'
#' \deqn{y'' - xy = 0}
#'
#' **Airy \eqn{Ai} Function:**
#' The first solution to the Airy differential equation. For negative \eqn{x} values, \eqn{Ai(x)} exhibits
#' oscillatory behavior. For positive \eqn{x} values, \eqn{Ai(x)} monotonically decreases toward zero.
#'
#' **Airy \eqn{Bi} Function:**
#' The second solution to the Airy differential equation. For negative \eqn{x} values, \eqn{Bi(x)} exhibits
#' cyclic oscillation. For positive \eqn{x} values, \eqn{Bi(x)} tends toward infinity.
#'
#' **Airy \eqn{Ai'} Function:**
#' The derivative of the first solution to the Airy differential equation. For negative \eqn{x} values,
#' \eqn{Ai'(x)} displays cyclic oscillation. For positive \eqn{x} values, \eqn{Ai'(x)} approaches zero asymptotically.
#'
#' **Airy \eqn{Bi'} Function:**
#' The derivative of the second solution to the Airy differential equation. For negative \eqn{x} values,
#' \eqn{Bi'(x)} oscillates cyclically. For positive \eqn{x} values, \eqn{Bi'(x)} increases toward infinity.
#'
#' **Zeros of Airy Functions:**
#' The zeros are the values where \eqn{Ai(x) = 0} or \eqn{Bi(x) = 0}. The zeros are indexed starting from 1.
#' The first few zeros are approximately:
#' * \eqn{Ai}: -2.33811, -4.08795, -5.52056, ...
#' * \eqn{Bi}: -1.17371, -3.27109, -4.83074, ...
#'
#' All functions are implemented using relationships to Bessel functions for numerical accuracy.
#'
#' @name airy_functions
#' @param x Input numeric value
#' @param m The index of the zero to find (1-based indexing, so m=1 returns the first zero).
#' @param start_index The starting index for the zeros (1-based).
#' @param number_of_zeros The number of zeros to find.
#' @return Single numeric value for the Airy functions and their derivatives, or a vector of length `number_of_zeros` for the multiple zero functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/airy.html) for more details on the mathematical background.
#' @examples
#' airy_ai(2)
#' airy_bi(2)
#' airy_ai_prime(2)
#' airy_bi_prime(2)
#' airy_ai_zero(1)
#' airy_bi_zero(1)
#' airy_ai_zero(start_index = 1, number_of_zeros = 5)
#' airy_bi_zero(start_index = 1, number_of_zeros = 5)
NULL

#' @rdname airy_functions
#' @export
airy_ai <- function(x) {
  .Call(`airy_ai_`, x)
}

#' @rdname airy_functions
#' @export
airy_bi <- function(x) {
  .Call(`airy_bi_`, x)
}

#' @rdname airy_functions
#' @export
airy_ai_prime <- function(x) {
  .Call(`airy_ai_prime_`, x)
}

#' @rdname airy_functions
#' @export
airy_bi_prime <- function(x) {
  .Call(`airy_bi_prime_`, x)
}

#' @rdname airy_functions
#' @export
airy_ai_zero <- function(m = NULL, start_index = NULL, number_of_zeros = NULL) {
  if (!is.null(m)) {
    if (!is.null(start_index) && !is.null(number_of_zeros)) {
      stop("Please provide either 'm' or 'start_index' and 'number_of_zeros', not both.",
          call. = FALSE)
    }
    return(.Call(`airy_ai_zero_`, m))
  }

  if (is.null(start_index) || is.null(number_of_zeros)) {
    stop("Both 'start_index' and 'number_of_zeros' must be provided when 'm' is NULL.",
         call. = FALSE)
  }
  .Call(`airy_ai_zero_multiple_`, start_index, number_of_zeros)
}

#' @rdname airy_functions
#' @export
airy_bi_zero <- function(m = NULL, start_index = NULL, number_of_zeros = NULL) {
  if (!is.null(m)) {
    if (!is.null(start_index) && !is.null(number_of_zeros)) {
      stop("Please provide either 'm' or 'start_index' and 'number_of_zeros', not both.",
          call. = FALSE)
    }
    return(.Call(`airy_bi_zero_`, m))
  }

  if (is.null(start_index) || is.null(number_of_zeros)) {
    stop("Both 'start_index' and 'number_of_zeros' must be provided when 'm' is NULL.",
         call. = FALSE)
  }
  .Call(`airy_bi_zero_multiple_`, start_index, number_of_zeros)
}
