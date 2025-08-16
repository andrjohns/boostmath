#' @title Ljung-Box Test for Autocorrelation
#' @name ljung_box_test
#' @description Functions to perform the Ljung-Box test for autocorrelation.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ljung_box.html) for more details on the mathematical background.
#' @param v A numeric vector.
#' @param lags A single integer value.
#' @param fit_dof A single integer value.
#' @return A two-element numeric vector containing the test statistic and the p-value.
#' @examples
#' # Ljung-Box test for autocorrelation
#' ljung_box(c(1, 2, 3, 4, 5), lags = 2, fit_dof = 0)
#' @export
ljung_box <- function(v, lags = -1, fit_dof = 0) {
  .Call(`ljung_box_`, v, lags, fit_dof)
}
