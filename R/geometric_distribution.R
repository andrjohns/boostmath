#' @title Geometric Distribution Functions
#' @name geometric_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Geometric distribution.
#' @param x quantile (non-negative integer)
#' @param prob probability of success (0 < prob < 1)
#' @param p probability (0 <= p <= 1)
#' @param trials number of trials
#' @param failures number of failures
#' @param alpha Largest acceptable probability that the true value of the success fraction is less than the value returned (by `geometric_find_lower_bound_on_p`) or greater than the value returned (by `geometric_find_upper_bound_on_p`).
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/geometric_dist.html) for more details on the mathematical background.
#' @examples
#' # Geometric distribution with probability of success prob = 0.5
#' dist <- geometric_distribution(0.5)
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
#' geometric_pdf(3, 0.5)
#' geometric_lpdf(3, 0.5)
#' geometric_cdf(3, 0.5)
#' geometric_lcdf(3, 0.5)
#' geometric_quantile(0.5, 0.5)
#' \dontrun{
#' # Find lower bound on p given 5 trials with 95% confidence
#' geometric_find_lower_bound_on_p(5, 0.05)
#' # Find upper bound on p given 5 trials with 95% confidence
#' geometric_find_upper_bound_on_p(5, 0.05)
#' # Find minimum number of trials to observe 3 failures with p = 0.5 at 95% confidence
#' geometric_find_minimum_number_of_trials(3, 0.5, 0.05)
#' # Find maximum number of trials to observe 3 failures with p = 0.5 at 95% confidence
#' geometric_find_maximum_number_of_trials(3, 0.5, 0.05)
#' }
NULL

#' @rdname geometric_distribution
#' @export
geometric_distribution <- function(prob) {
  structure(
    list(
      extptr = .Call(`geometric_init_`, prob),
      prob = prob
    ),
    class = c("geometric_distribution", "boost_distribution")
  )
}

#' @rdname geometric_distribution
#' @export
geometric_pdf <- function(x, prob) {
  pdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_lpdf <- function(x, prob) {
  logpdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_cdf <- function(x, prob) {
  cdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_lcdf <- function(x, prob) {
  logcdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_quantile <- function(p, prob) {
  quantile(geometric_distribution(prob), p)
}

#' @rdname geometric_distribution
#' @export
geometric_find_lower_bound_on_p <- function(trials, alpha) {
  .Call(`geometric_find_lower_bound_on_p_`, trials, alpha)
}

#' @rdname geometric_distribution
#' @export
geometric_find_upper_bound_on_p <- function(trials, alpha) {
  .Call(`geometric_find_upper_bound_on_p_`, trials, alpha)
}

#' @rdname geometric_distribution
#' @export
geometric_find_minimum_number_of_trials <- function(failures, prob, alpha) {
  .Call(`geometric_find_minimum_number_of_trials_`, failures, prob, alpha)
}

#' @rdname geometric_distribution
#' @export
geometric_find_maximum_number_of_trials <- function(failures, prob, alpha) {
  .Call(`geometric_find_maximum_number_of_trials_`, failures, prob, alpha)
}
