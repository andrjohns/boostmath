#' @title Number Series
#' @name number_series
#' @description
#' Functions to compute Bernoulli numbers, Tangent numbers, Prime numbers, and Fibonacci numbers.
#' The library provides efficient implementations using table lookups for smaller indices and
#' advanced algorithms for larger values.
#'
#' **Bernoulli Numbers B(2n):**
#'
#' The Bernoulli numbers are a sequence of rational numbers useful for Taylor series expansions,
#' the Euler-Maclaurin formula, and the Riemann zeta function.
#' - `bernoulli_b2n(n)`: Returns the (2n)-th Bernoulli number \eqn{B_{2n}}. Note that odd Bernoulli numbers are 0 (except B_1 = -1/2).
#' - `max_bernoulli_b2n()`: Returns the largest n such that \eqn{B_{2n}} can be represented in the return type.
#' - `unchecked_bernoulli_b2n(n)`: A faster version without overflow checks.
#' - `bernoulli_b2n(start_index, number_of_bernoullis_b2n)`: Computes a range of Bernoulli numbers.
#'
#' **Tangent Numbers T(n):**
#'
#' Tangent numbers (or zag functions) appear in the Maclaurin series of tan(x).
#' - `tangent_t2n(n)`: Returns the n-th Tangent number.
#' - `tangent_t2n(start_index, number_of_tangent_t2n)`: Computes a range of Tangent numbers.
#'
#' **Prime Numbers:**
#'
#' Fast table lookup for the first 10,000 prime numbers.
#' - `prime(n)`: Returns the n-th prime number (0-indexed, so prime(0) = 2).
#' - `max_prime()`: Returns the maximum index n supported (currently 10,000).
#'
#' **Fibonacci Numbers F(n):**
#'
#' Computes Fibonacci numbers defined by \eqn{F_n = F_{n-1} + F_{n-2}} with \eqn{F_0 = 0, F_1 = 1}.
#' - `fibonacci(n)`: Returns the n-th Fibonacci number.
#' - `unchecked_fibonacci(n)`: A faster version without overflow checks.
#'
#' Implementation uses table lookup for small values and iterative algorithms for larger values.
#'
#' @param n Index of the number to compute (must be a non-negative integer).
#' @param start_index The starting index for computing a range of numbers.
#' @param number_of_bernoullis_b2n The number of Bernoulli numbers to compute in the range.
#' @param number_of_tangent_t2n The number of Tangent numbers to compute in the range.
#' @return A single numeric or integer value for scalar inputs, or a vector for range computations.
#'         For `max_` functions, returns the maximum supported index.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/number_series.html)
#'
#' @examples
#' \dontrun{
#' # 10th Bernoulli number B_20 (index is doubled)
#' bernoulli_b2n(10)
#' # Maximum supported index for Bernoulli numbers
#' max_bernoulli_b2n()
#' # Range of Bernoulli numbers B_0, B_2, ..., B_18 (10 numbers)
#' bernoulli_b2n(start_index = 0, number_of_bernoullis_b2n = 10)
#'
#' # 10th Tangent number
#' tangent_t2n(10)
#'
#' # 10th Prime number (0-indexed)
#' prime(10)
#'
#' # 10th Fibonacci number
#' fibonacci(10)
#' }
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
