#' @title Anderson-Darling Test for Normality
#' @name anderson_darling_test
#' @description
#' Performs the Anderson-Darling test for normality by computing the \eqn{A^2} test statistic:
#'
#' \deqn{A^2 = n\int_{-\infty}^{\infty}\frac{(F_n(x)-F(x))^2F'(x)}{F(x)(1-F(x))}dx}
#'
#' The Anderson-Darling test evaluates whether a sample comes from a normal distribution
#' by computing an integral over the empirical cumulative distribution function (ECDF)
#' and comparing it against the normal distribution's CDF.
#'
#' **Interpretation:**
#' * When \eqn{A^2/n} approaches zero as sample size increases, the normality hypothesis is supported
#' * When \eqn{A^2/n} converges to a positive finite value, the normality hypothesis lacks support
#'
#' **Important:** The input data vector `x` must be sorted in ascending order. Unsorted
#' data will trigger an error.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/anderson_darling.html) for more details on the mathematical background.
#' @param x A numeric vector of sample data (must be sorted in ascending order).
#' @param mu The mean of the normal distribution to test against. Default is 0.
#' @param sd The standard deviation of the normal distribution to test against. Default is 1.
#' @return The Anderson-Darling \eqn{A^2} test statistic.
#' @examples
#' # Anderson-Darling test for normality with sorted data
#' x <- sort(rnorm(100))
#' anderson_darling_normality_statistic(x, 0, 1)
#' @export
anderson_darling_normality_statistic <- function(x, mu = 0, sd = 1) {
  .Call(`anderson_darling_normality_statistic_`, x, mu, sd)
}
