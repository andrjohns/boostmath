#' @title Ljung-Box Test for Autocorrelation
#' @name ljung_box_test
#' @description
#' Functions to perform the Ljung-Box test for autocorrelation in residuals.
#'
#' The test statistic is
#'
#' \deqn{Q := n(n+2)\sum_{k=1}^{\ell} \frac{\hat{r}_k^2}{n-k}}
#'
#' Where:
#'
#' \deqn{\hat{r}_k := \frac{\sum_{i=k}^{n-1}(v_i-\bar{v})(v_{i-k} - \bar{v})}{\sum_{i=0}^{n-1}(v_i-\bar{v})^2}}
#'
#' Where: \eqn{n} is the sample size (length of \eqn{v}) and \eqn{\ell} is the number of lags
#'
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
