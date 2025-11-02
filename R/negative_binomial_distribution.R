#' @title Negative Binomial Distribution Functions
#' @name negative_binomial_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Negative Binomial distribution.
#' @param x quantile
#' @param successes number of successes (successes >= 0)
#' @param success_fraction probability of success on each trial (0 <= success_fraction <= 1)
#' @param failures number of failures (failures >= 0)
#' @param trials number of trials
#' @param alpha significance level (0 < alpha < 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/negative_binomial_dist.html) for more details on the mathematical background.
#' @examples
#' # Negative Binomial distribution with successes = 5, success_fraction = 0.5
#' dist <- negative_binomial_distribution(5, 0.5)
#' # Apply generic functions
#' cdf(dist, 0.5)
#' logcdf(dist, 0.5)
#' pdf(dist, 0.5)
#' logpdf(dist, 0.5)
#' hazard(dist, 0.5)
#' chf(dist, 0.5)
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
#' negative_binomial_pdf(3, 5, 0.5)
#' negative_binomial_lpdf(3, 5, 0.5)
#' negative_binomial_cdf(3, 5, 0.5)
#' negative_binomial_lcdf(3, 5, 0.5)
#' negative_binomial_quantile(0.5, 5, 0.5)
#'
#' \dontrun{
#' # Find lower bound on p given 10 trials and 5 successes with 95% confidence
#' negative_binomial_find_lower_bound_on_p(10, 5, 0.05)
#' # Find upper bound on p given 10 trials and 5 successes with 95% confidence
#' negative_binomial_find_upper_bound_on_p(10, 5, 0.05)
#' # Find minimum number of trials to observe 3 failures with success fraction 0.5 at 95% confidence
#' negative_binomial_find_minimum_number_of_trials(3, 0.5, 0.05)
#' # Find maximum number of trials to observe 3 failures with success fraction 0.5 at 95% confidence
#' negative_binomial_find_maximum_number_of_trials(3, 0.5, 0.05)
#' }
NULL

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_distribution <- function(successes, success_fraction) {
  structure(
    list(
      extptr = .Call(`negative_binomial_init_`, successes, success_fraction),
      successes = successes,
      success_fraction = success_fraction
    ),
    class = c("negative_binomial_distribution", "boost_distribution")
  )
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_pdf <- function(x, successes, success_fraction) {
  pdf(negative_binomial_distribution(successes, success_fraction), x)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_lpdf <- function(x, successes, success_fraction) {
  logpdf(negative_binomial_distribution(successes, success_fraction), x)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_cdf <- function(x, successes, success_fraction) {
  cdf(negative_binomial_distribution(successes, success_fraction), x)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_lcdf <- function(x, successes, success_fraction) {
  logcdf(negative_binomial_distribution(successes, success_fraction), x)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_quantile <- function(p, successes, success_fraction) {
  quantile(negative_binomial_distribution(successes, success_fraction), p)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_find_lower_bound_on_p <- function(trials, successes, alpha) {
  .Call(`negative_binomial_find_lower_bound_on_p_`, trials, successes, alpha)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_find_upper_bound_on_p <- function(trials, successes, alpha) {
  .Call(`negative_binomial_find_upper_bound_on_p_`, trials, successes, alpha)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_find_minimum_number_of_trials <- function(failures, success_fraction, alpha) {
  .Call(`negative_binomial_find_minimum_number_of_trials_`, failures, success_fraction, alpha)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_find_maximum_number_of_trials <- function(failures, success_fraction, alpha) {
  .Call(`negative_binomial_find_maximum_number_of_trials_`, failures, success_fraction, alpha)
}
