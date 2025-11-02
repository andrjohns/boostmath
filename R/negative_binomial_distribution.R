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
