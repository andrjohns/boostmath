#' @title Linear Regression Functions
#' @name linear_regression
#' @description
#' Functions to perform simple ordinary least squares (OLS) linear regression.
#'
#' The OLS fit finds $c_0$ and $c_1$ that minimize
#'
#' \deqn{\sum_{i=1}^n (y_i - (c_0 + c_1 x_i))^2}
#'
#' producing the model $f(x)=c_0+c_1x$. The optional $R^2$ output uses
#'
#' \deqn{R^2 = 1 - \frac{\sum_i (y_i - \hat{y}_i)^2}{\sum_i (y_i - \bar{y})^2}}
#'
#' **Accuracy and Implementation Notes:**
#' Boost uses a numerically stable one-pass approach based on means, variances, and
#' covariances to reduce cancellation error.
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
