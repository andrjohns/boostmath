#' @title Factorials and Binomial Coefficients
#' @name factorials_and_binomial_coefficients
#' @description
#' Functions to compute factorials, double factorials, rising and falling factorials
#' (Pochhammer symbols), and binomial coefficients.
#'
#' These fundamental combinatorial functions appear in counting problems, probability
#' distributions, and series expansions of special functions.
#'
#' **Factorial Functions:**
#'
#' * `factorial_boost(i)`: Computes \eqn{i! = 1*2*3*...*i}
#'   - Standard factorial with overflow checking
#'   - Returns error for \eqn{i} > max_factorial()
#'
#' * `unchecked_factorial(i)`: Fast table lookup for small factorials
#'   - No overflow checking, assumes \eqn{i} is valid
#'   - Use when performance is critical and i is known to be small
#'
#' * `max_factorial()`: Returns the largest \eqn{i} for which \eqn{factorial_boost(i)} fits in the
#'   return type without overflow
#'
#' **Double Factorial:**
#'
#' * `double_factorial(i)`: Computes \eqn{i!! = i*(i-2)*(i-4)*...}
#'   - For even i: \eqn{i!! = i*(i-2)*...*4*2}
#'   - For odd i: \eqn{i!! = i*(i-2)*...*3*1}
#'
#' **Rising and Falling Factorials (Pochhammer Symbols):**
#'
#' * `rising_factorial(x, i)`: Computes \eqn{x^{(i)} = x(x+1)(x+2)...(x+i-1)}
#'   - Also called Pochhammer symbol or ascending factorial
#'   - Used in hypergeometric functions and series expansions
#'   - For integer \eqn{x}, equals \eqn{(x+i-1)! / (x-1)!}
#'
#' * `falling_factorial(x, i)`: Computes \eqn{(x)_i = x(x-1)(x-2)...(x-i+1)}
#'   - Also called descending factorial
#'   - Counts permutations: number of ways to arrange i items from x items
#'   - For integer \eqn{x}, \eqn{equals x! / (x-i)!}
#'
#' **Binomial Coefficients:**
#'
#' * `binomial_coefficient(n, k)`: Computes \eqn{C(n,k) = n! / (k!(n-k)!)}
#'   - "n choose k": number of ways to choose \eqn{k} items from \eqn{n} items
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/factorials.html)
#' for more details on the mathematical background.
#' @param i Non-negative integer input for factorials and double factorials
#' @param x Base value for rising and falling factorials (can be real-valued)
#' @param n Total number of elements for binomial coefficients
#' @param k Number of elements to choose for binomial coefficients (0 <= k <= n)
#' @return A single numeric value with the computed factorial, double factorial, rising factorial,
#' falling factorial, or binomial coefficient.
#' @examples
#' # Factorial of 5: 5! = 120
#' factorial_boost(5)
#' # Unchecked factorial of 5 (fast table lookup)
#' unchecked_factorial(5)
#' # Maximum factorial value that can be computed
#' max_factorial()
#' # Double factorial: 6!! = 6*4*2 = 48
#' double_factorial(6)
#' # Rising factorial: 3^(2) = 3*4 = 12
#' rising_factorial(3, 2)
#' # Falling factorial: 3^[2] = 3*2 = 6
#' falling_factorial(3, 2)
#' # Binomial coefficient: C(5,2) = 10
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
