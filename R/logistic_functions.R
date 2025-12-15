#' @title Logistic Functions
#' @name logistic_functions
#' @description Functions to compute the logit and logistic sigmoid functions
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/logistic.html)
#' for more details on the mathematical background.
#' @param x Numeric value for which to compute the functions
#' @return A single numeric value with the computed logit or logistic sigmoid function.
#' @examples
#' # Logistic Sigmoid Function
#' logistic_sigmoid(0.5)
#' # Logit Function
#' logit(0.7)
NULL

#' @rdname logistic_functions
#' @export
logistic_sigmoid <- function(x) {
  .Call(`logistic_sigmoid_`, x)
}

#' @rdname logistic_functions
#' @export
logit <- function(x) {
  .Call(`logit_`, x)
}
