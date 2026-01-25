#' @title Signal Statistics
#' @name signal_statistics
#' @description
#' Functions for computing statistics commonly used in signal analysis, such as sparsity measures and Signal-to-Noise Ratio (SNR) estimators.
#'
#' **Absolute Gini Coefficient:**
#' The Gini coefficient is a measure of the sparsity of a signal (expansion in a basis).
#' *   `absolute_gini_coefficient`: Computes the population Gini coefficient.
#' *   `sample_absolute_gini_coefficient`: Computes the sample Gini coefficient.
#' A Gini coefficient of 0 implies every element has equal magnitude (least sparse).
#' A Gini coefficient of 1 implies only one element is non-zero (most sparse).
#'
#' **Hoyer Sparsity:**
#' A measure of sparsity based on the ratio of the L1 and L2 norms:
#' \deqn{H(v) = \frac{\sqrt{N} - \frac{\|v\|_1}{\|v\|_2}}{\sqrt{N} - 1}}{H(v) = (sqrt(N) - L1(v)/L2(v)) / (sqrt(N) - 1)}
#' Returns 1 for maximum sparsity (one non-zero element) and 0 for minimum sparsity (all elements equal).
#'
#' **Oracle SNR:**
#' Computes the Signal-to-Noise Ratio (SNR) when the true signal is known (Oracle).
#' *   `oracle_snr`: \eqn{\frac{\|s\|^2}{\|s - x\|^2}}{||s||^2 / ||s - x||^2} where \eqn{s} is the signal and \eqn{x} is the noisy signal.
#' *   `oracle_snr_db`: Returns the SNR in decibels (dB): \eqn{10 \log_{10}(\text{SNR})}{10 * log10(SNR)}.
#'
#' **M2M4 SNR Estimator:**
#' A "blind" estimator (requires no clean signal reference) using the M2M4 property (uses 2nd and 4th moments).
#' Useful for "in-service" estimation.
#' *   `m2m4_snr_estimator`: Returns the estimated SNR ratio.
#' *   `m2m4_snr_estimator_db`: Returns the estimated SNR in dB.
#' Works best for SNR between -3 dB and 15 dB. Requires assumptions about signal and noise kurtosis (default signal=1, noise=3 for Gaussian).
#'
#' @param x A numeric vector representing the signal or coefficients.
#' @param signal A numeric vector representing the true (clean) signal.
#' @param noisy_signal A numeric vector representing the signal with noise.
#' @param signal_kurtosis Kurtosis of the signal (for M2M4). Default is 1 (e.g., constant amplitude).
#' @param noise_kurtosis Kurtosis of the noise (for M2M4). Default is 3 (Gaussian noise).
#'
#' @return A numeric value representing the computed statistic.
#'
#' @references
#' Hurley, N., & Rickard, S. (2009). Comparing measures of sparsity. IEEE Transactions on Information Theory, 55(10), 4723-4741.
#' Pauluzzi, D. R., & Beaulieu, N. C. (2000). A comparison of SNR estimation techniques for the AWGN channel. IEEE Transactions on Communications, 48(10), 1681-1691.
#'
#' @seealso
#' [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/signal_statistics.html)
#'
#' @examples
#' # --- Sparsity Measures ---
#'
#' # Gini Coefficient
#' vec <- c(1, 0, 0, 0)
#' # High sparsity -> High Gini coefficient
#' sample_absolute_gini_coefficient(vec)
#'
#' vec_uniform <- c(1, 1, 1, 1)
#' # Low sparsity -> Low Gini coefficient
#' absolute_gini_coefficient(vec_uniform)
#'
#' # Hoyer Sparsity
#' hoyer_sparsity(vec)      # Returns 1
#' hoyer_sparsity(vec_uniform) # Returns 0
#'
#' # --- SNR Estimation ---
#'
#' s <- sin(seq(0, 10, length.out = 100))
#' n <- rnorm(100, sd = 0.5)
#' x <- s + n
#'
#' # Oracle SNR (Known signal)
#' oracle_snr_db(s, x)
#'
#' # M2M4 Blind SNR Estimation
#' # Assuming signal kurtosis = 1.5 (sinusoid) and Gaussian noise (kurtosis = 3)
#' m2m4_snr_estimator_db(x, signal_kurtosis = 1.5, noise_kurtosis = 3)
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
