#' @title Hypergeometric Functions
#' @name hypergeometric_functions
#' @description
#' Functions to compute various hypergeometric functions, which are solutions to hypergeometric
#' differential equations and generalize many special functions.
#'
#' **Specialised Hypergeometric Functions:**
#'
#' * **hypergeometric_1F0(a, z):** : \deqn{_1F_0(a;z) = \sum_{n=0}^\infty \frac{(a)_nz^n}{n!}}
#'
#' * **hypergeometric_0F1(b, z):** : \deqn{_0F_1(;b;z) = \sum_{n=0}^\infty \frac{z^n}{(b)_n!}}
#'
#' * **hypergeometric_2F0(a1, a2, z):** : \deqn{_2F_0(a_1, a_2;z) = \sum_{n=0}^\infty \frac{(a_1)_n(a_2)_nz^n}{n!}}
#'
#' * **hypergeometric_1F1(a, b, z):** : \deqn{_1F_1(a, b;z) = \sum_{n=0}^\infty \frac{(a)_nz^n}{(b)_n!}}
#'
#' * **hypergeometric_1F1_regularized(a, b, z):** : \deqn{_1\tilde{F}_1(a, b;z) = \frac{_1F_1(a, b;z)}{\Gamma(b)}}
#'
#' * **log_hypergeometric_1F1(a, b, z):** : Numerically stable implementation of \eqn{\ln _1F_1(a, b;z)}
#'
#' **Generalised Hypergeometric Function pFq:**
#'
#' * `hypergeometric_pFq(a, b, z)`: General form with p numerator parameters and
#'   q denominator parameters:
#'
#' \deqn{_pF_q\left(\{a_1,...,a_p\}, \{b_1,...,b_q\}; z\right) = \sum_{n=0}^{\infty} \frac{\prod_{j=1}^{p}(a_j)_n}{\prod_{j=1}^{q}(b_j)_n}\frac{z^n}{n!}}
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
