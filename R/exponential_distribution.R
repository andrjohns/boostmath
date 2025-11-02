#' @title Exponential Distribution Functions
#' @name exponential_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Exponential distribution.
#' @param x quantile
#' @param lambda rate parameter (lambda > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/exp_dist.html) for more details on the mathematical background.
#' @examples
#' # Exponential distribution with rate parameter lambda = 2
#' dist <- exponential_distribution(2)
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
#' exponential_pdf(1, 2)
#' exponential_lpdf(1, 2)
#' exponential_cdf(1, 2)
#' exponential_lcdf(1, 2)
#' exponential_quantile(0.5, 2)
NULL

#' @rdname exponential_distribution
#' @export
exponential_distribution <- function(lambda = 1) {
  structure(
    list(
      extptr = .Call(`exponential_init_`, lambda),
      rate = lambda
    ),
    class = c("exponential_distribution", "boost_distribution")
  )
}

#' @rdname exponential_distribution
#' @export
exponential_pdf <- function(x, lambda = 1) {
  pdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_lpdf <- function(x, lambda = 1) {
  logpdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_cdf <- function(x, lambda = 1) {
  cdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_lcdf <- function(x, lambda = 1) {
  logcdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_quantile <- function(p, lambda = 1) {
  quantile(exponential_distribution(lambda), p)
}
