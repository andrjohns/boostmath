#' @title Binomial Distribution Functions
#' @name binomial_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Binomial distribution.
#' @param k number of successes (0 <= k <= n)
#' @param n number of trials (n >= 0)
#' @param prob probability of success on each trial (0 <= prob <= 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/binomial_dist.html) for more details on the mathematical background.
#' @examples
#' # Binomial dist ribution with n = 10, prob = 0.5
#' binomial_pdf(3, 10, 0.5)
#' binomial_lpdf(3, 10, 0.5)
#' binomial_cdf(3, 10, 0.5)
#' binomial_lcdf(3, 10, 0.5)
#' binomial_quantile(0.5, 10, 0.5)
NULL

#' @rdname binomial_distribution
#' @export
binomial_pdf <- function(k, n, prob) {
  .Call(`binomial_pdf_`, k, n, prob)
}

#' @rdname binomial_distribution
#' @export
binomial_lpdf <- function(k, n, prob) {
  .Call(`binomial_logpdf_`, k, n, prob)
}

#' @rdname binomial_distribution
#' @export
binomial_cdf <- function(k, n, prob) {
  .Call(`binomial_cdf_`, k, n, prob)
}

#' @rdname binomial_distribution
#' @export
binomial_lcdf <- function(k, n, prob) {
  .Call(`binomial_logcdf_`, k, n, prob)
}

#' @rdname binomial_distribution
#' @export
binomial_quantile <- function(p, n, prob) {
  .Call(`binomial_quantile_`, p, n, prob)
}
