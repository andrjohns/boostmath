#' @title Ljung-Box Test for Autocorrelation
#' @name ljung_box_test
#' @description
#' Functions to perform the Ljung-Box test for autocorrelation in residuals.
#'
#' The test statistic is
#'
#' \deqn{Q = n(n+2)\sum_{k=1}^{\ell} \frac{\hat{\rho}_k^2}{n-k}}
#'
#' where $n$ is the sample size, \deqn{\ell} is the number of lags, and \deqn{\hat{\rho}_k}
#' are sample autocorrelations. The p-value is computed against a chi-squared
#' approximation with adjusted degrees of freedom.
#'
#' **Implementation Notes:**
#' By default, the number of lags is chosen as \deqn{\log(n)} for \deqn{O(n \log n)} complexity.
#' `fit_dof` adjusts only the p-value to account for model parameters.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ljung_box.html) for more details on the mathematical background.
#' @param v A numeric vector.
#' @param lags A single integer value (default uses \deqn{\log(n)}).
#' @param fit_dof A single integer value.
#' @return A two-element numeric vector containing the test statistic and the p-value.
#' @examples
#' # Ljung-Box test for autocorrelation
#' ljung_box(c(1, 2, 3, 4, 5), lags = 2, fit_dof = 0)
#' @export
ljung_box <- function(v, lags = -1, fit_dof = 0) {
  .Call(`ljung_box_`, v, lags, fit_dof)
}
