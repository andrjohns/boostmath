#' @title Runs Tests
#' @name runs_tests
#' @description Functions for Runs Tests.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/runs_test.html) for more details on the mathematical background.
#' @param v A numeric vector.
#' @param threshold A single numeric value.
#' @return A two-element numeric vector containing the t-statistic and the p-value.
#' @examples
#' # Runs Above and Below Threshold
#' runs_above_and_below_threshold(c(1, 2, 3, 4, 5), threshold = 3)
#' # Runs Above and Below Median
#' runs_above_and_below_median(c(1, 2, 3, 4, 5))
NULL

#' @rdname runs_tests
#' @export
runs_above_and_below_threshold <- function(v, threshold) {
  .Call(`runs_above_and_below_threshold_`, v, threshold)
}

#' @rdname runs_tests
#' @export
runs_above_and_below_median <- function(v) {
  .Call(`runs_above_and_below_median_`, v)
}
