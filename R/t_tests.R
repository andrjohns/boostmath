#' @title Student's T-Tests
#' @name t_tests
#' @description
#' Functions for performing various Student's t-tests to compare means of populations.
#'
#' **One-Sample T-Test:**
#' Tests if the population mean differs from a specified `assumed_mean`.
#' \deqn{t = \frac{\bar{x} - \mu_0}{s / \sqrt{n}}}{t = (sample_mean - assumed_mean) / (sample_std_dev / sqrt(n))}
#' Available in two forms:
#' *   `one_sample_t_test`: Takes a vector of data.
#' *   `one_sample_t_test_params`: Takes summary statistics (mean, variance, sample size) directly.
#'
#' **Two-Sample T-Test (`two_sample_t_test`):**
#' Tests if the means of two independent samples differ.
#' Automatically handles unequal variances (Welch's t-test) or equal variances based on the data.
#'
#' **Paired Samples T-Test (`paired_samples_t_test`):**
#' Tests if the means of two dependent (paired) samples differ.
#' Equivalent to a one-sample t-test on the differences between pairs.
#'
#' @param sample_mean Sample mean (for `one_sample_t_test_params`).
#' @param sample_variance Sample variance (for `one_sample_t_test_params`).
#' @param num_samples Number of samples (for `one_sample_t_test_params`).
#' @param assumed_mean The hypothesised population mean to compare against.
#' @param u A numeric vector of data values for the first sample.
#' @param v A numeric vector of data values for the second sample.
#'
#' @return A two-element numeric vector containing:
#' *   The **t-statistic**.
#' *   The **p-value** (two-sided).
#'
#' @seealso
#' [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/t_test.html)
#'
#' @examples
#' # --- One Sample T-Test ---
#' # Using raw data:
#' data <- c(5, 6, 7, 5, 6)
#' one_sample_t_test(data, assumed_mean = 4)
#'
#' # Using summary statistics:
#' # Mean = 5.8, Variance = 0.7, N = 5
#' one_sample_t_test_params(sample_mean = 5.8, sample_variance = 0.7,
#'                          num_samples = 5, assumed_mean = 4)
#'
#' # --- Two Sample T-Test ---
#' sample1 <- c(5, 6, 7, 5, 6)
#' sample2 <- c(4, 5, 6, 4, 5)
#' two_sample_t_test(sample1, sample2)
#'
#' # --- Paired Samples T-Test ---
#' # Pre-test vs Post-test
#' pre <- c(5, 6, 7, 5, 6)
#' post <- c(6, 7, 8, 6, 7)
#' paired_samples_t_test(pre, post)
NULL

#' @rdname t_tests
#' @export
one_sample_t_test_params <- function(sample_mean, sample_variance, num_samples, assumed_mean) {
  .Call(`one_sample_t_test_params_`, sample_mean, sample_variance, num_samples, assumed_mean)
}

#' @rdname t_tests
#' @export
one_sample_t_test <- function(u, assumed_mean) {
  .Call(`one_sample_t_test_`, u, assumed_mean)
}

#' @rdname t_tests
#' @export
two_sample_t_test <- function(u, v) {
  .Call(`two_sample_t_test_`, u, v)
}

#' @rdname t_tests
#' @export
paired_samples_t_test <- function(u, v) {
  .Call(`paired_samples_t_test_`, u, v)
}
