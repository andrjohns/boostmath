#' @title Signal Statistics Functions
#' @name signal_statistics
#' @description Functions to compute various signal statistics.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/signal_statistics.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param signal A numeric vector.
#' @param noisy_signal A numeric vector.
#' @param signal_kurtosis A single numeric value.
#' @param noise_kurtosis A single numeric value.
#' @return A numeric value or vector with the computed statistic.
#' @examples
#' # Absolute Gini Coefficient
#' absolute_gini_coefficient(c(1, 2, 3, 4, 5))
#' # Sample Absolute Gini Coefficient
#' sample_absolute_gini_coefficient(c(1, 2, 3, 4, 5))
#' # Hoyer Sparsity
#' hoyer_sparsity(c(1, 0, 0, 2, 3))
#'
#' signal <- c(1, 2, 3)
#' noisy_signal <- c(1.1, 2.1, 3.1)
#' # Oracle SNR
#' oracle_snr(signal, noisy_signal)
#' # Oracle SNR in dB
#' oracle_snr_db(signal, noisy_signal)
#' # M2M4 SNR Estimator
#' m2m4_snr_estimator(noisy_signal, 3, 2)
#' # M2M4 SNR Estimator in dB
#' m2m4_snr_estimator_db(noisy_signal, 3, 2)
NULL

#' @rdname signal_statistics
#' @export
absolute_gini_coefficient <- function(x) {
  .Call(`absolute_gini_coefficient_`, x)
}

#' @rdname signal_statistics
#' @export
sample_absolute_gini_coefficient <- function(x) {
  .Call(`sample_absolute_gini_coefficient_`, x)
}

#' @rdname signal_statistics
#' @export
hoyer_sparsity <- function(x) {
  .Call(`hoyer_sparsity_`, x)
}

#' @rdname signal_statistics
#' @export
oracle_snr <- function(signal, noisy_signal) {
  .Call(`oracle_snr_`, signal, noisy_signal)
}

#' @rdname signal_statistics
#' @export
oracle_snr_db <- function(signal, noisy_signal) {
  .Call(`oracle_snr_db_`, signal, noisy_signal)
}

#' @rdname signal_statistics
#' @export
m2m4_snr_estimator <- function(noisy_signal, signal_kurtosis = 1, noise_kurtosis = 3) {
  .Call(`m2m4_snr_estimator_`, noisy_signal, signal_kurtosis, noise_kurtosis)
}

#' @rdname signal_statistics
#' @export
m2m4_snr_estimator_db <- function(noisy_signal, signal_kurtosis = 1, noise_kurtosis = 3) {
  .Call(`m2m4_snr_estimator_db_`, noisy_signal, signal_kurtosis, noise_kurtosis)
}
