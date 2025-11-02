#' @title Arcsine Distribution Functions
#' @name arcsine_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the arcsine distribution.
#' @param x quantile
#' @param p probability
#' @param x_min minimum value of the distribution (default is 0)
#' @param x_max maximum value of the distribution (default is 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/arcine_dist.html) for more details on the mathematical background.
#' @examples
#' # Arcsine distribution with default parameters
#' dist <- arcsine_distribution()
#' # Apply generic functions
#' cdf(dist, 0.5)
#' logcdf(dist, 0.5)
#' pdf(dist, 0.5)
#' logpdf(dist, 0.5)
#' hazard(dist, 0.5)
#' chf(dist, 0.5)
#' mean(dist)
#' median(dist)
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
#' arcsine_pdf(0.5)
#' arcsine_lpdf(0.5)
#' arcsine_cdf(0.5)
#' arcsine_lcdf(0.5)
#' arcsine_quantile(0.5)
NULL

#' @rdname arcsine_distribution
#' @export
arcsine_distribution <- function(x_min = 0, x_max = 1) {
  structure(
    list(
      extptr = .Call(`arcsine_init_`, x_min, x_max),
      x_min = x_min,
      x_max = x_max
    ),
    class = c("arcsine_distribution", "boost_distribution")
  )
}

#' @rdname arcsine_distribution
#' @export
arcsine_pdf <- function(x, x_min = 0, x_max = 1) {
  pdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lpdf <- function(x, x_min = 0, x_max = 1) {
  logpdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_cdf <- function(x, x_min = 0, x_max = 1) {
  cdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lcdf <- function(x, x_min = 0, x_max = 1) {
  logcdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_quantile <- function(p, x_min = 0, x_max = 1) {
  quantile(arcsine_distribution(x_min, x_max), p)
}
