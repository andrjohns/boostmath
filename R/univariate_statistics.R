#' @title Univariate Statistics
#' @name univariate_statistics
#' @description
#' Functions to compute robust univariate statistics from a dataset.
#'
#' **Central Tendency:**
#' *   `mean_boost`: Computes the arithmetic mean using Higham's numerically stable algorithm.
#' *   `median_boost`: Computes the median (robust to outliers).
#' *   `mode`: Computes the mode(s) of the dataset.
#'
#' **Dispersion (Spread):**
#' *   `variance`: Computes the population variance using Higham's algorithm.
#' *   `sample_variance`: Computes the sample variance (unbiased estimator).
#' *   `mean_and_sample_variance`: Efficiently computes both mean and sample variance in one pass.
#' *   `median_absolute_deviation`: Computes the Median Absolute Deviation (MAD), a robust measure of variability.
#' *   `interquartile_range`: Computes the Interquartile Range (IQR = Q3 - Q1), robust to outliers.
#'
#' **Shape:**
#' *   `skewness`: Measures the asymmetry of the distribution (Pebay's algorithm).
#' *   `kurtosis`: Measures the "tailedness" of the distribution (Pebay's algorithm).
#' *   `excess_kurtosis`: Kurtosis minus 3 (Normal distribution has 0 excess kurtosis).
#' *   `first_four_moments`: Computes Mean, Variance, Skewness, and Kurtosis in a single pass.
#'
#' **Inequality:**
#' *   `gini_coefficient`: Computes the Gini coefficient (population). range \eqn{[0, 1 - 1/n]}.
#' *   `sample_gini_coefficient`: Computes the sample Gini coefficient. range \eqn{[0, 1]}.
#'
#' @details
#' These functions are designed to be numerically stable and efficient.
#' Most implementations follow algorithms described by Higham (Accuracy and Stability of Numerical Algorithms) or Pebay (Sandia Labs) for one-pass parallel computation.
#'
#' @param x A numeric vector containing the dataset.
#' @param ... Additional arguments (for S3 compatibility, e.g., with defaults).
#'
#' @return A numeric value (or vector for moments/mode) with the computed statistic.
#'
#' @references
#' Higham, N. J. (2002). Accuracy and stability of numerical algorithms. SIAM.
#' Pebay, P. P. (2008). Formulas for Robust, One-Pass Parallel Computation of Covariances and Arbitrary-Order Statistical Moments. Sandia Report.
#'
#' @seealso
#' [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/univariate_statistics.html)
#'
#' @examples
#' data <- c(1, 2, 3, 4, 100) # Dataset with an outlier
#'
#' # --- Central Tendency ---
#' mean_boost(data)
#' median_boost(data) # Less affected by 100
#' mode(c(1, 2, 2, 3))
#'
#' # --- Dispersion ---
#' variance(data)
#' sample_variance(data)
#' median_absolute_deviation(data) # Robust
#' interquartile_range(data)       # Robust
#'
#' # --- Shape ---
#' skewness(data)
#' excess_kurtosis(data)
#' first_four_moments(data)
#'
#' # --- Inequality ---
#' gini_coefficient(c(1, 0, 0, 0)) # High inequality

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
