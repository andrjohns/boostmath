#' @title Weibull Distribution Functions
#' @name weibull_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Weibull distribution.
#' @param x quantile
#' @param shape shape parameter
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/weibull_dist.html) for more details on the mathematical background.
#' @examples
#' # Weibull distribution with shape = 1, scale = 1
#' dist <- weibull_distribution(1, 1)
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
#' weibull_pdf(1, shape = 1, scale = 1)
#' weibull_lpdf(1, shape = 1, scale = 1)
#' weibull_cdf(1, shape = 1, scale = 1)
#' weibull_lcdf(1, shape = 1, scale = 1)
#' weibull_quantile(0.5, shape = 1, scale = 1)
NULL

#' @rdname weibull_distribution
#' @export
weibull_distribution <- function(shape, scale = 1) {
  structure(
    list(
      extptr = .Call(`weibull_init_`, shape, scale),
      shape = shape,
      scale = scale
    ),
    class = c("weibull_distribution", "boost_distribution")
  )
}

#' @rdname weibull_distribution
#' @export
weibull_pdf <- function(x, shape, scale = 1) {
  pdf(weibull_distribution(shape, scale), x)
}

#' @rdname weibull_distribution
#' @export
weibull_lpdf <- function(x, shape, scale = 1) {
  logpdf(weibull_distribution(shape, scale), x)
}

#' @rdname weibull_distribution
#' @export
weibull_cdf <- function(x, shape, scale = 1) {
  cdf(weibull_distribution(shape, scale), x)
}

#' @rdname weibull_distribution
#' @export
weibull_lcdf <- function(x, shape, scale = 1) {
  logcdf(weibull_distribution(shape, scale), x)
}

#' @rdname weibull_distribution
#' @export
weibull_quantile <- function(p, shape, scale = 1) {
  quantile(weibull_distribution(shape, scale), p)
}
