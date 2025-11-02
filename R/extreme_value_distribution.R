#' @title Extreme Value Distribution Functions
#' @name extreme_value_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Extreme Value distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/extreme_dist.html) for more details on the mathematical background.
#' @examples
#' # Extreme Value distribution with location = 0, scale = 1
#' dist <- extreme_value_distribution(0, 1)
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
#' extreme_value_pdf(0)
#' extreme_value_lpdf(0)
#' extreme_value_cdf(0)
#' extreme_value_lcdf(0)
#' extreme_value_quantile(0.5)
NULL

#' @rdname extreme_value_distribution
#' @export
extreme_value_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`extreme_value_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("extreme_value_distribution", "boost_distribution")
  )
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_pdf <- function(x, location = 0, scale = 1) {
  pdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_cdf <- function(x, location = 0, scale = 1) {
  cdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_quantile <- function(p, location = 0, scale = 1) {
  quantile(extreme_value_distribution(location, scale), p)
}
