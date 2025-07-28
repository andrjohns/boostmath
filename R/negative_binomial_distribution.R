#' @title Negative Binomial Distribution Functions
#' @name negative_binomial_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Negative Binomial distribution.
#' @param x quantile
#' @param successes number of successes (successes >= 0)
#' @param success_fraction probability of success on each trial (0 <= success_fraction <= 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/negative_binomial_dist.html) for more details on the mathematical background.
#' @examples
#' negative_binomial_pdf(3, 5, 0.5)
#' negative_binomial_lpdf(3, 5, 0.5)
#' negative_binomial_cdf(3, 5, 0.5)
#' negative_binomial_lcdf(3, 5, 0.5)
#' negative_binomial_quantile(0.5, 5, 0.5)
NULL


#' @rdname negative_binomial_distribution
#' @export
negative_binomial_pdf <- function(x, successes, success_fraction) {
  .Call(`negative_binomial_pdf_`, x, successes, success_fraction)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_lpdf <- function(x, successes, success_fraction) {
  .Call(`negative_binomial_logpdf_`, x, successes, success_fraction)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_cdf <- function(x, successes, success_fraction) {
  .Call(`negative_binomial_cdf_`, x, successes, success_fraction)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_lcdf <- function(x, successes, success_fraction) {
  .Call(`negative_binomial_logcdf_`, x, successes, success_fraction)
}

#' @rdname negative_binomial_distribution
#' @export
negative_binomial_quantile <- function(p, successes, success_fraction) {
  .Call(`negative_binomial_quantile_`, p, successes, success_fraction)
}
