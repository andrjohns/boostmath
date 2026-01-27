#' @title Chatterjee Correlation Function
#' @name chatterjee_correlation
#' @description Compute the Chatterjee correlation coefficient, a rank-based coefficient:
#'
#' \deqn{\xi_n(X,Y) = 1 - \frac{3\sum_{i=1}^{n-1}|r_{i+1} - r_i|}{n^2 - 1}}
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/chatterjee_correlation.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param y A numeric vector.
#' @return A two-element numeric vector containing the test statistic and the p-value.
#' @examples
#' x <- c(1, 2, 3, 4, 5)
#' y <- c(2, 3, 5, 7, 11)
#' # Chatterjee correlation
#' chatterjee_correlation(x, y)
#' @export
chatterjee_correlation <- function(x, y) {
  .Call(`chatterjee_correlation_`, x, y)
}
