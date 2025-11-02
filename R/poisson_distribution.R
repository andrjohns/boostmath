#' @title Poisson Distribution Functions
#' @name poisson_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Poisson distribution.
#' @param x quantile
#' @param lambda rate parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/poisson_dist.html) for more details on the mathematical background.
#' @examples
#' # Poisson distribution with lambda = 1
#' dist <- poisson_distribution(1)
#' # Apply generic functions
#' cdf(dist, 5)
#' logcdf(dist, 5)
#' pdf(dist, 5)
#' logpdf(dist, 5)
#' hazard(dist, 5)
#' chf(dist, 5)
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
#' poisson_pdf(0, 1)
#' poisson_lpdf(0, 1)
#' poisson_cdf(0, 1)
#' poisson_lcdf(0, 1)
#' poisson_quantile(0.5, 1)
NULL

#' @rdname poisson_distribution
#' @export
poisson_distribution <- function(lambda = 1) {
  structure(
    list(
      extptr = .Call(`poisson_init_`, lambda),
      lambda = lambda
    ),
    class = c("poisson_distribution", "boost_distribution")
  )
}

#' @rdname poisson_distribution
#' @export
poisson_pdf <- function(x, lambda = 1) {
  pdf(poisson_distribution(lambda), x)
}

#' @rdname poisson_distribution
#' @export
poisson_lpdf <- function(x, lambda = 1) {
  logpdf(poisson_distribution(lambda), x)
}

#' @rdname poisson_distribution
#' @export
poisson_cdf <- function(x, lambda = 1) {
  cdf(poisson_distribution(lambda), x)
}

#' @rdname poisson_distribution
#' @export
poisson_lcdf <- function(x, lambda = 1) {
  logcdf(poisson_distribution(lambda), x)
}

#' @rdname poisson_distribution
#' @export
poisson_quantile <- function(p, lambda = 1) {
  quantile(poisson_distribution(lambda), p)
}
