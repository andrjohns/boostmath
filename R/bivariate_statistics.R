#' @title Bivariate Statistics Functions
#' @name bivariate_statistics
#' @description
#' Functions to compute bivariate statistics including covariance and the Pearson
#' correlation coefficient.
#'
#' **Covariance:**
#' The population covariance is
#'
#' \deqn{\operatorname{cov}(x, y) = \frac{1}{n}\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}
#'
#' **Correlation Coefficient:**
#' The Pearson correlation coefficient is
#'
#' \deqn{\rho_{x,y} = \frac{\operatorname{cov}(x, y)}{\sigma_x \sigma_y}}
#'
#' **Accuracy and Implementation Notes:**
#' The implementation follows numerically stable single-pass algorithms (Bennett et al.)
#' with parallel variants (Schubert et al.). Inputs are real-valued only; if integer types
#' are supplied, results are returned as double precision. If either input is constant,
#' the correlation coefficient is indeterminate and returns NaN.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bivariate_statistics.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param y A numeric vector.
#' @return A numeric value (or tuple for `means_and_covariance`) with the computed statistic.
#' @examples
#' # Covariance
#' covariance(c(1, 2, 3), c(4, 5, 6))
#' # Means and Covariance
#' means_and_covariance(c(1, 2, 3), c(4, 5, 6))
#' # Correlation Coefficient
#' correlation_coefficient(c(1, 2, 3), c(4, 5, 6))
NULL

#' @rdname bivariate_statistics
#' @export
covariance <- function(x, y) {
  .Call(`covariance_`, x, y)
}

#' @rdname bivariate_statistics
#' @export
means_and_covariance <- function(x, y) {
  .Call(`means_and_covariance_`, x, y)
}

#' @rdname bivariate_statistics
#' @export
correlation_coefficient <- function(x, y) {
  .Call(`correlation_coefficient_`, x, y)
}
