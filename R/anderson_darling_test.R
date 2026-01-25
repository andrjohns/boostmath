#' @title Anderson-Darling Test for Normality
#' @name anderson_darling_test
#' @description
#' Performs the Anderson-Darling test for normality by computing the A² test statistic.
#'
#' The Anderson-Darling test evaluates whether a sample comes from a normal distribution
#' by computing an integral over the empirical cumulative distribution function (ECDF)
#' and comparing it against the normal distribution's CDF.
#'
#' **Interpretation:**
#' * When A²/n approaches zero as sample size increases, the normality hypothesis is supported
#' * When A²/n converges to a positive finite value, the normality hypothesis lacks support
#'
#' **Important:** The input data vector `x` must be sorted in ascending order. Unsorted
#' data will trigger an error.
#'
#' **Parameter Modes:**
#' * If `mu` and `sd` are provided, the test compares against N(mu, sd²)
#' * If `mu` and `sd` are not provided (default), they are estimated from the data
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/anderson_darling.html) for more details on the mathematical background.
#' @param x A numeric vector of sample data (must be sorted in ascending order).
#' @param mu The mean of the normal distribution to test against. Default is 0.
#' @param sd The standard deviation of the normal distribution to test against. Default is 1.
#' @return The Anderson-Darling A² test statistic.
#' @examples
#' # Anderson-Darling test for normality with sorted data
#' x <- sort(rnorm(100))
#' anderson_darling_normality_statistic(x, 0, 1)
#' @export
anderson_darling_normality_statistic <- function(x, mu = 0, sd = 1) {
  .Call(`anderson_darling_normality_statistic_`, x, mu, sd)
}
