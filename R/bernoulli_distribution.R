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

#' @export
bernoulli_distribution <- function(p_success) {
  structure(
    list(
      extptr = .Call(`binomial_init_`, 1, p_success),
      success_fraction = p_success
    ),
    class = c("bernoulli_distribution", "boost_distribution")
  )
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_pdf <- function(x, p_success) {
  pdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_lpdf <- function(x, p_success) {
  logpdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_cdf <- function(x, p_success) {
  cdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_lcdf <- function(x, p_success) {
  logcdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_quantile <- function(p, p_success) {
  quantile(bernoulli_distribution(p_success), p)
}
