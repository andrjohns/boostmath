#' @title Bernoulli Distribution Functions
#' @name bernoulli_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Bernoulli distribution.
#' @param x quantile (0 or 1)
#' @param p_success probability of success (0 <= p_success <= 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/bernoulli_dist.html) for more details on the mathematical background.
#' @examples
#' bernoulli_pdf(1, 0.5)
#' bernoulli_lpdf(1, 0.5)
#' bernoulli_cdf(1, 0.5)
#' bernoulli_lcdf(1, 0.5)
#' bernoulli_quantile(0.5, 0.5)
NULL

#' @rdname bernoulli_distribution
#' @export
bernoulli_pdf <- function(x, p_success) {
  .Call(`bernoulli_pdf_`, x, p_success)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_lpdf <- function(x, p_success) {
  .Call(`bernoulli_logpdf_`, x, p_success)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_cdf <- function(x, p_success) {
  .Call(`bernoulli_cdf_`, x, p_success)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_lcdf <- function(x, p_success) {
  .Call(`bernoulli_logcdf_`, x, p_success)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_quantile <- function(p, p_success) {
  .Call(`bernoulli_quantile_`, p, p_success)
}
