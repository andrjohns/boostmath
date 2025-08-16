#' @title Bivariate Statistics Functions
#' @name bivariate_statistics
#' @description Functions to compute various bivariate statistics.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bivariate_statistics.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param y A numeric vector.
#' @return A numeric value or vector with the computed statistic.
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
