#' @title Skew Normal Distribution Functions
#' @name skew_normal_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Skew Normal distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param shape shape parameter (default is 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/skew_normal_dist.html) for more details on the mathematical background.
#' @examples
#' # Skew Normal distribution with location = 0, scale = 1, shape = 0
#' dist <- skew_normal_distribution(0, 1, 0)
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
#' skew_normal_pdf(0)
#' skew_normal_lpdf(0)
#' skew_normal_cdf(0)
#' skew_normal_lcdf(0)
#' skew_normal_quantile(0.5)
NULL

#' @rdname skew_normal_distribution
#' @export
skew_normal_distribution <- function(location = 0, scale = 1, shape = 0) {
  structure(
    list(
      extptr = .Call(`skew_normal_init_`, location, scale, shape),
      location = location,
      scale = scale,
      shape = shape
    ),
    class = c("skew_normal_distribution", "boost_distribution")
  )
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_pdf <- function(x, location = 0, scale = 1, shape = 0) {
  pdf(skew_normal_distribution(location, scale, shape), x)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_lpdf <- function(x, location = 0, scale = 1, shape = 0) {
  logpdf(skew_normal_distribution(location, scale, shape), x)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_cdf <- function(x, location = 0, scale = 1, shape = 0) {
  cdf(skew_normal_distribution(location, scale, shape), x)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_lcdf <- function(x, location = 0, scale = 1, shape = 0) {
  logcdf(skew_normal_distribution(location, scale, shape), x)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_quantile <- function(p, location = 0, scale = 1, shape = 0) {
  quantile(skew_normal_distribution(location, scale, shape), p)
}
