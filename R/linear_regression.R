#' @title Linear Regression Functions
#' @name linear_regression
#' @description Functions to perform linear regression.
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
