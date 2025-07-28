#' @title Number Series
#' @description Functions to compute Bernoulli numbers, tangent numbers, fibonacci numbers, and prime numbers.
#' @name number_series
#' @param n Index of number to compute (must be a non-negative integer)
#' @param start_index The starting index for the range of numbers (must be a non-negative integer)
#' @param number_of_bernoullis_b2n The number of Bernoulli numbers to compute
#' @param number_of_tangent_t2n The number of tangent numbers to compute
#' @return A single numeric value for the Bernoulli numbers, tangent numbers, fibonacci numbers, or prime numbers, or a vector of values for ranges.
#' @details
#' Efficient computation of Bernoulli numbers, tangent numbers, fibonacci numbers, and prime numbers.
#'
#' The `checked_` functions ensure that the input is within valid bounds, while the `unchecked_` functions do not perform such checks,
#' allowing for potentially faster computation at the risk of overflow or invalid input.
#'
#' The `max_` functions return the maximum index for which the respective numbers can be computed using precomputed lookup tables.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/number_series.html) for more details on the mathematical background.
#'
#' @examples
#' bernoulli_b2n(10)
#' max_bernoulli_b2n()
#' unchecked_bernoulli_b2n(10)
#' bernoulli_b2n(start_index = 0, number_of_bernoullis_b2n = 10)
#' tangent_t2n(10)
#' tangent_t2n(start_index = 0, number_of_tangent_t2n = 10)
#' prime(10)
#' max_prime()
#' fibonacci(10)
#' unchecked_fibonacci(10)
NULL

#' @rdname number_series
#' @export
bernoulli_b2n <- function(n = NULL, start_index = NULL, number_of_bernoullis_b2n = NULL) {
  if (!is.null(n)) {
    if (!is.null(start_index) || !is.null(number_of_bernoullis_b2n)) {
      stop("If n is provided, start_index and number_of_bernoullis_b2n should not be used.",
           call. = FALSE)
    }
    return(.Call(`bernoulli_b2n_`, n))
  }
  if (is.null(start_index) || is.null(number_of_bernoullis_b2n)) {
    stop("Either n must be provided or both start_index and number_of_bernoullis_b2n must be provided.",
         call. = FALSE)
  }
  .Call(`bernoulli_b2n_range_`, start_index, number_of_bernoullis_b2n)
}

#' @rdname number_series
#' @export
max_bernoulli_b2n <- function() {
  .Call(`max_bernoulli_b2n_`)
}

#' @rdname number_series
#' @export
unchecked_bernoulli_b2n <- function(n) {
  .Call(`unchecked_bernoulli_b2n_`, n)
}

#' @rdname number_series
#' @export
tangent_t2n <- function(n = NULL, start_index = NULL, number_of_tangent_t2n = NULL) {
  if (!is.null(n)) {
    if (!is.null(start_index) || !is.null(number_of_tangent_t2n)) {
      stop("If n is provided, start_index and number_of_tangent_t2n should not be used.",
           call. = FALSE)
    }
    return(.Call(`tangent_t2n_`, n))
  }
  if (is.null(start_index) || is.null(number_of_tangent_t2n)) {
    stop("Either n must be provided or both start_index and number_of_tangent_t2n must be provided.",
         call. = FALSE)
  }
  .Call(`tangent_t2n_range_`, start_index, number_of_tangent_t2n)
}

#' @rdname number_series
#' @export
prime <- function(n) {
  .Call(`prime_`, n)
}

#' @rdname number_series
#' @export
max_prime <- function() {
  .Call(`max_prime_`)
}

#' @rdname number_series
#' @export
fibonacci <- function(n) {
  .Call(`fibonacci_`, n)
}

#' @rdname number_series
#' @export
unchecked_fibonacci <- function(n) {
  .Call(`unchecked_fibonacci_`, n)
}
