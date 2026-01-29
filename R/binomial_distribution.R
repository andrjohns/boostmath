#' @title Binomial Distribution Functions
#' @name binomial_distribution
#' @description
#' Functions to compute the probability mass function (pmf), cumulative distribution
#' function, quantile function, and confidence bounds for the Binomial distribution.
#'
#' The Binomial distribution models the number of successes $k$ in $n$ independent
#' trials with success probability $p$. The pmf is
#'
#' \deqn{P(X = k) = \binom{n}{k} p^k (1 - p)^{n-k}}
#'
#' for integers \deqn{0 \le k \le n}, and the CDF gives \deqn{P(X \le k)}.
#'
#' **Accuracy and Implementation Notes:**
#' CDF and related functions are implemented using incomplete beta functions (`ibeta`,
#' `ibetac`). The pmf is evaluated via `ibeta_derivative` for stability. Quantiles are
#' obtained numerically (TOMS 748), since no closed-form inverse exists for discrete $k$.
#' As a discrete distribution, quantiles are rounded outward to ensure at least the
#' requested coverage; use complements for improved tail accuracy.
#'
#' **Confidence Bounds:**
#' `binomial_find_lower_bound_on_p` and `binomial_find_upper_bound_on_p` implement
#' Clopper-Pearson exact intervals (default) or Jeffreys prior intervals, as described
#' in the Boost documentation.
#'
#' @param k Number of successes (0 <= k <= n).
#' @param n Number of trials (n >= 0).
#' @param prob Probability of success on each trial (0 <= prob <= 1).
#' @param p Probability (0 <= p <= 1).
#' @param alpha Largest acceptable probability that the true value of the success fraction is less than the value returned (by `binomial_find_lower_bound_on_p`) or greater than the value returned (by `binomial_find_upper_bound_on_p`).
#' @param method Method to use for calculating the confidence bounds. Options are "clopper_pearson_exact" (default) and "jeffreys_prior".
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/binomial_dist.html) for more details on the mathematical background.
#' @examples
#' # Binomial distribution with n = 10, prob = 0.5
#' dist <- binomial_distribution(10, 0.5)
#' # Apply generic functions
#' cdf(dist, 2)
#' logcdf(dist, 2)
#' pdf(dist, 2)
#' logpdf(dist, 2)
#' hazard(dist, 2)
#' chf(dist, 2)
#' mean(dist)
#' median(dist)
#' mode(dist)
#' range(dist)
#' quantile(dist, 0.2)
#' standard_deviation(dist)
#' support(dist)
#' variance(dist)
#' skewness(dist)
#' kurtosis(dist)
#' kurtosis_excess(dist)
#'
#' # Convenience functions
#' binomial_pdf(3, 10, 0.5)
#' binomial_lpdf(3, 10, 0.5)
#' binomial_cdf(3, 10, 0.5)
#' binomial_lcdf(3, 10, 0.5)
#' binomial_quantile(0.5, 10, 0.5)
#'
#' \dontrun{
#' # Find lower bound on p given k = 3 successes in n = 10 trials with 95% confidence
#' binomial_find_lower_bound_on_p(10, 3, 0.05)
#' # Find upper bound on p given k = 3 successes in n = 10 trials with 95% confidence
#' binomial_find_upper_bound_on_p(10, 3, 0.05)
#' # Find minimum number of trials n to observe k = 3 successes with p = 0.5 at 95% confidence
#' binomial_find_minimum_number_of_trials(3, 0.5, 0.05)
#' # Find maximum number of trials n to observe k = 3 successes with p = 0.5 at 95% confidence
#' binomial_find_maximum_number_of_trials(3, 0.5, 0.05)
#' }
NULL

#' @rdname binomial_distribution
#' @export
binomial_distribution <- function(n, prob) {
  structure(
    list(
      extptr = .Call(`binomial_init_`, n, prob),
      n = n,
      prob = prob
    ),
    class = c("binomial_distribution", "boost_distribution")
  )
}

#' @rdname binomial_distribution
#' @export
binomial_pdf <- function(k, n, prob) {
  pdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_lpdf <- function(k, n, prob) {
  logpdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_cdf <- function(k, n, prob) {
  cdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_lcdf <- function(k, n, prob) {
  logcdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_quantile <- function(p, n, prob) {
  quantile(binomial_distribution(n, prob), p)
}

#' @rdname binomial_distribution
#' @export
binomial_find_lower_bound_on_p <- function(n, k, alpha, method = "clopper_pearson_exact") {
  if (!(method %in% c("clopper_pearson_exact", "jeffreys_prior"))) {
    stop("Invalid method. Choose from 'clopper_pearson_exact' or 'jeffreys_prior'.")
  }
  .Call(`binomial_find_lower_bound_on_p_`, n, k, alpha, method)
}

#' @rdname binomial_distribution
#' @export
binomial_find_upper_bound_on_p <- function(n, k, alpha, method = "clopper_pearson_exact") {
  if (!(method %in% c("clopper_pearson_exact", "jeffreys_prior"))) {
    stop("Invalid method. Choose from 'clopper_pearson_exact' or 'jeffreys_prior'.")
  }
  .Call(`binomial_find_upper_bound_on_p_`, n, k, alpha, method)
}

#' @rdname binomial_distribution
#' @export
binomial_find_minimum_number_of_trials <- function(k, prob, alpha) {
  .Call(`binomial_find_minimum_number_of_trials_`, k, prob, alpha)
}

#' @rdname binomial_distribution
#' @export
binomial_find_maximum_number_of_trials <- function(k, prob, alpha) {
  .Call(`binomial_find_maximum_number_of_trials_`, k, prob, alpha)
}
