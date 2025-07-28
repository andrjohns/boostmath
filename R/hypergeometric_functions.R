#' @title Hypergeometric Functions
#' @name hypergeometric_functions
#' @description Functions to compute various hypergeometric functions.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hypergeometric.html) for more details on the mathematical background.
#' @param a Parameter of the hypergeometric function
#' @param b Second parameter of the hypergeometric function
#' @param z Argument of the hypergeometric function
#' @param a1 First parameter of the hypergeometric function
#' @param a2 Second parameter of the hypergeometric function
#' @return A single numeric value with the computed hypergeometric function.
#' @examples
#' # Hypergeometric Function 1F0
#' hypergeometric_1F0(2, 0.2)
#' # Hypergeometric Function 0F1
#' hypergeometric_0F1(1, 0.8)
#' # Hypergeometric Function 2F0
#' hypergeometric_2F0(0.1, -1, 0.1)
#' # Hypergeometric Function 1F1
#' hypergeometric_1F1(2, 3, 1)
#' # Regularised Hypergeometric Function 1F1
#' hypergeometric_1F1_regularized(2, 3, 1)
#' # Logarithm of the Hypergeometric Function 1F1
#' log_hypergeometric_1F1(2, 3, 1)
#' # Hypergeometric Function pFq
#' hypergeometric_pFq(c(2, 3), c(4, 5), 6)
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
