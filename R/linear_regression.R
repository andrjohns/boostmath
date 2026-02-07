#' @title Linear Regression Functions
#' @name linear_regression
#' @description
#' Functions to perform simple ordinary least squares (OLS) linear regression.
#'
#' The OLS fit finds \eqn{c_0} and \eqn{c_1} that minimize
#'
#' \deqn{\mathcal{L}(c_0, c_1) := \sum_{i=0}^{n-1} (y_i - c_0 - c_1 x_i)^2}
#'
#' producing the model \eqn{f(x)=c_0+c_1x}. The optional \eqn{R^2} output uses
#'
#' \deqn{R^2 = 1 - \frac{\sum_i (y_i - c_0 - c_1x_i)^2}{\sum_i (y_i - \bar{y})^2}}
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/linear_regression.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param y A numeric vector.
#' @return A two-element numeric vector containing the intercept and slope of the regression line,
#'        or a three-element vector containing the intercept, slope, and R-squared value if applicable.
#' @examples
#' # Simple Ordinary Least Squares
#' x <- c(1, 2, 3, 4, 5)
#' y <- c(2, 3, 5, 7, 11)
#' simple_ordinary_least_squares(x, y)
#' # Simple Ordinary Least Squares with R-squared
#' simple_ordinary_least_squares_with_R_squared(x, y)
NULL

#' @rdname linear_regression
#' @export
simple_ordinary_least_squares <- function(x, y) {
  .Call(`simple_ordinary_least_squares_`, x, y)
}

#' @rdname linear_regression
#' @export
simple_ordinary_least_squares_with_R_squared <- function(x, y) {
  .Call(`simple_ordinary_least_squares_with_R_squared_`, x, y)
}
