#' @title Anderson-Darling Test for Normality
#' @name anderson_darling_test
#' @description Functions to perform the Anderson-Darling test for normality.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/anderson_darling.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param mu A single numeric value.
#' @param sd A single numeric value.
#' @return A numeric value or vector with the computed statistic.
#' @examples
#' # Anderson-Darling test for normality
#' anderson_darling_normality_statistic(c(1, 2, 3, 4, 5), 0, 1)
#' @export
anderson_darling_normality_statistic <- function(x, mu = 0, sd = 1) {
  .Call(`anderson_darling_normality_statistic_`, x, mu, sd)
}
