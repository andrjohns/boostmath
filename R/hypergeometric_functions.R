#' @title Hypergeometric Functions
#' @name hypergeometric_functions
#' @description
#' Functions to compute various hypergeometric functions, which are solutions to hypergeometric
#' differential equations and generalize many special functions.
#'
#' Hypergeometric functions are defined by series expansions where (a)_n denotes the rising
#' factorial (Pochhammer symbol). They appear in solutions to many differential equations
#' and unify numerous special functions.
#'
#' **Specific Hypergeometric Functions:**
#'
#' * **0F1(b, z):**
#'   - `hypergeometric_0F1(b, z)`: Zero numerator parameters, one denominator parameter
#'   - Implemented via defining series when convergent, continued fractions for divergent cases,
#'     or Bessel function relations
#'   - Domain error when b is an integer <= 0
#'
#' * **1F0(a, z):**
#'   - `hypergeometric_1F0(a, z)`: One numerator parameter, zero denominator parameters
#'
#' * **2F0(a1, a2, z):**
#'   - `hypergeometric_2F0(a1, a2, z)`: Two numerator parameters, zero denominator parameters
#'
#' * **1F1(a, b, z):** Confluent hypergeometric function (Kummer's function)
#'   - `hypergeometric_1F1(a, b, z)`: Standard form, solves Kummer's equation
#'   - Equivalent to Mathematica's Hypergeometric1F1\[a, b, z\] and Maple's KummerM(a, b, z)
#'   - For |z| < 1, has a convergent hypergeometric series expansion
#'
#' * **Regularised 1F1:**
#'   - `hypergeometric_1F1_regularized(a, b, z)`: Normalised version that avoids
#'     spurious overflow/underflow
#'
#' * **Logarithmic 1F1:**
#'   - `log_hypergeometric_1F1(a, b, z)`: Returns log of 1F1 for numerical stability
#'
#' **Generalised Hypergeometric Function pFq:**
#'
#' * `hypergeometric_pFq(a, b, z)`: General form with p numerator parameters and
#'   q denominator parameters
#'   - a: vector of upper (numerator) parameters
#'   - b: vector of lower (denominator) parameters
#'   - Uses direct summation of the series with optimizations
#'   - Example: pFq with a = (2,3,4) and b = (5,6,7,8) computes 3F4
#'
#' **Implementation:**
#'
#' The 1F1 function uses multiple computational methods including direct series,
#' Kummer's relation, asymptotic expansions, Tricomi's approximation, Luke's rational
#' approximation, and recurrence relations, selected based on parameter ranges for
#' optimal accuracy and efficiency.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hypergeometric.html) for more details on the mathematical background.
#' @param a Parameter of the hypergeometric function (numerator parameter)
#' @param b Denominator parameter of the hypergeometric function
#' @param z Argument of the hypergeometric function
#' @param a1 First numerator parameter (for 2F0)
#' @param a2 Second numerator parameter (for 2F0)
#' @return A single numeric value with the computed hypergeometric function.
#' @examples
#' # Hypergeometric Function 1F0
#' hypergeometric_1F0(2, 0.2)
#' # Hypergeometric Function 0F1
#' hypergeometric_0F1(1, 0.8)
#' # Hypergeometric Function 2F0
#' hypergeometric_2F0(0.1, -1, 0.1)
#' # Hypergeometric Function 1F1 (Kummer's function)
#' hypergeometric_1F1(2, 3, 1)
#' # Regularised Hypergeometric Function 1F1
#' hypergeometric_1F1_regularized(2, 3, 1)
#' # Logarithm of the Hypergeometric Function 1F1
#' log_hypergeometric_1F1(2, 3, 1)
#' # Generalised Hypergeometric Function pFq (3F4 example)
#' hypergeometric_pFq(c(2, 3, 4), c(5, 6, 7, 8), 0.5)
NULL

#' @rdname hypergeometric_functions
#' @export
hypergeometric_1F0 <- function(a, z) {
  .Call(`hypergeometric_1F0_`, a, z)
}

#' @rdname hypergeometric_functions
#' @export
hypergeometric_0F1 <- function(b, z) {
  .Call(`hypergeometric_0F1_`, b, z)
}

#' @rdname hypergeometric_functions
#' @export
hypergeometric_2F0 <- function(a1, a2, z) {
  .Call(`hypergeometric_2F0_`, a1, a2, z)
}

#' @rdname hypergeometric_functions
#' @export
hypergeometric_1F1 <- function(a, b, z) {
  .Call(`hypergeometric_1F1_`, a, b, z)
}

#' @rdname hypergeometric_functions
#' @export
hypergeometric_1F1_regularized <- function(a, b, z) {
  .Call(`hypergeometric_1F1_regularized_`, a, b, z)
}

#' @rdname hypergeometric_functions
#' @export
log_hypergeometric_1F1 <- function(a, b, z) {
  .Call(`log_hypergeometric_1F1_`, a, b, z)
}

#' @rdname hypergeometric_functions
#' @export
hypergeometric_pFq <- function(a, b, z) {
  .Call(`hypergeometric_pFq_`, a, b, z)
}
