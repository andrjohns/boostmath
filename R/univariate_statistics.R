#' @title Univariate Statistics Functions
#' @name univariate_statistics
#' @description Functions to compute various univariate statistics.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/univariate_statistics.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param ... Additional arguments (not used).
#' @return A numeric value or vector with the computed statistic.
#' @examples
#' # Mean
#' mean_boost(c(1, 2, 3, 4, 5))
#' # Variance
#' variance(c(1, 2, 3, 4, 5))
#' # Sample Variance
#' sample_variance(c(1, 2, 3, 4, 5))
#' # Mean and Sample Variance
#' mean_and_sample_variance(c(1, 2, 3, 4, 5))
#' # Skewness
#' skewness(c(1, 2, 3, 4, 5))
#' # Kurtosis
#' kurtosis(c(1, 2, 3, 4, 5))
#' # Excess Kurtosis
#' excess_kurtosis(c(1, 2, 3, 4, 5))
#' # First Four Moments
#' first_four_moments(c(1, 2, 3, 4, 5))
#' # Median
#' median_boost(c(1, 2, 3, 4, 5))
#' # Median Absolute Deviation
#' median_absolute_deviation(c(1, 2, 3, 4, 5))
#' # Interquartile Range
#' interquartile_range(c(1, 2, 3, 4, 5))
#' # Gini Coefficient
#' gini_coefficient(c(1, 2, 3, 4, 5))
#' # Sample Gini Coefficient
#' sample_gini_coefficient(c(1, 2, 3, 4, 5))
#' # Mode
#' mode(c(1, 2, 2, 3, 4))
NULL

#' @rdname univariate_statistics
#' @export
mean_boost <- function(x) {
  .Call(`mean_`, x)
}

#' @rdname univariate_statistics
#' @exportS3Method
variance.default <- function(x, ...) {
  .Call(`variance_`, x)
}

#' @rdname univariate_statistics
#' @export
sample_variance <- function(x) {
  .Call(`sample_variance_`, x)
}

#' @rdname univariate_statistics
#' @export
mean_and_sample_variance <- function(x) {
  .Call(`mean_and_sample_variance_`, x)
}

#' @rdname univariate_statistics
#' @exportS3Method
skewness.default <- function(x, ...) {
  .Call(`skewness_`, x)
}

#' @rdname univariate_statistics
#' @exportS3Method
kurtosis.default <- function(x, ...) {
  .Call(`kurtosis_`, x)
}

#' @rdname univariate_statistics
#' @export
excess_kurtosis <- function(x) {
  .Call(`excess_kurtosis_`, x)
}

#' @rdname univariate_statistics
#' @export
first_four_moments <- function(x) {
  .Call(`first_four_moments_`, x)
}

#' @rdname univariate_statistics
#' @export
median_boost <- function(x) {
  .Call(`median_`, x)
}

#' @rdname univariate_statistics
#' @export
median_absolute_deviation <- function(x) {
  .Call(`median_absolute_deviation_`, x)
}

#' @rdname univariate_statistics
#' @export
interquartile_range <- function(x) {
  .Call(`interquartile_range_`, x)
}

#' @rdname univariate_statistics
#' @export
gini_coefficient <- function(x) {
  .Call(`gini_coefficient_`, x)
}

#' @rdname univariate_statistics
#' @export
sample_gini_coefficient <- function(x) {
  .Call(`sample_gini_coefficient_`, x)
}

#' @rdname univariate_statistics
#' @export
mode.default <- function(x, ...) {
  .Call(`mode_`, x)
}
