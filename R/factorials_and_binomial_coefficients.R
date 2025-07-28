#' @title Factorials and Binomial Coefficients
#' @name factorials_and_binomial_coefficients
#' @description Functions to compute factorials, double factorials, rising and falling factorials, and binomial coefficients.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/factorials.html) for more details on the mathematical background.
#' @param i Non-negative integer input for factorials and double factorials.
#' @param x Base value for rising and falling factorials.
#' @param n Total number of elements for binomial coefficients.
#' @param k Number of elements to choose for binomial coefficients.
#' @return A single numeric value with the computed factorial, double factorial, rising factorial, falling factorial, or binomial coefficient.
#' @examples
#' # Factorial of 5
#' factorial_boost(5)
#' # Unchecked factorial of 5 (using table lookup)
#' unchecked_factorial(5)
#' # Maximum factorial value that can be computed
#' max_factorial()
#' # Double factorial of 6
#' double_factorial(6)
#' # Rising factorial of 3 with exponent 2
#' rising_factorial(3, 2)
#' # Falling factorial of 3 with exponent 2
#' falling_factorial(3, 2)
#' # Binomial coefficient "5 choose 2"
#' binomial_coefficient(5, 2)
NULL

#' @rdname factorials_and_binomial_coefficients
#' @export
factorial_boost <- function(i) {
  .Call(`factorial_`, i)
}

#' @rdname factorials_and_binomial_coefficients
#' @export
unchecked_factorial <- function(i) {
  .Call(`unchecked_factorial_`, i)
}

#' @rdname factorials_and_binomial_coefficients
#' @export
max_factorial <- function() {
  .Call(`max_factorial_`)
}

#' @rdname factorials_and_binomial_coefficients
#' @export
double_factorial <- function(i) {
  .Call(`double_factorial_`, i)
}

#' @rdname factorials_and_binomial_coefficients
#' @export
rising_factorial <- function(x, i) {
  .Call(`rising_factorial_`, x, i)
}

#' @rdname factorials_and_binomial_coefficients
#' @export
falling_factorial <- function(x, i) {
  .Call(`falling_factorial_`, x, i)
}

#' @rdname factorials_and_binomial_coefficients
#' @export
binomial_coefficient <- function(n, k) {
  .Call(`binomial_coefficient_`, n, k)
}
