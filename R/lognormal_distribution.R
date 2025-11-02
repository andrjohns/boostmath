#' @title Log Normal Distribution Functions
#' @name lognormal_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Log Normal distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/lognormal_dist.html) for more details on the mathematical background.
#' @examples
#' # Log Normal distribution with location = 0, scale = 1
#' dist <- lognormal_distribution(0, 1)
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
#' lognormal_pdf(0)
#' lognormal_lpdf(0)
#' lognormal_cdf(0)
#' lognormal_lcdf(0)
#' lognormal_quantile(0.5)
NULL

#' @rdname lognormal_distribution
#' @export
lognormal_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`lognormal_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("lognormal_distribution", "boost_distribution")
  )
}

#' @rdname lognormal_distribution
#' @export
lognormal_pdf <- function(x, location = 0, scale = 1) {
  pdf(lognormal_distribution(location, scale), x)
}

#' @rdname lognormal_distribution
#' @export
lognormal_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(lognormal_distribution(location, scale), x)
}

#' @rdname lognormal_distribution
#' @export
lognormal_cdf <- function(x, location = 0, scale = 1) {
  cdf(lognormal_distribution(location, scale), x)
}

#' @rdname lognormal_distribution
#' @export
lognormal_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(lognormal_distribution(location, scale), x)
}

#' @rdname lognormal_distribution
#' @export
lognormal_quantile <- function(p, location = 0, scale = 1) {
  quantile(lognormal_distribution(location, scale), p)
}
