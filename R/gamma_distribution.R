#' @title Gamma Distribution Functions
#' @name gamma_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Gamma distribution.
#' @param x quantile
#' @param shape shape parameter (shape > 0)
#' @param scale scale parameter (scale > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/gamma_dist.html) for more details on the mathematical background.
#' @examples
#' # Gamma distribution with shape = 3, scale = 4
#' dist <- gamma_distribution(3, 4)
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
#' gamma_pdf(2, 3, 4)
#' gamma_lpdf(2, 3, 4)
#' gamma_cdf(2, 3, 4)
#' gamma_lcdf(2, 3, 4)
#' gamma_quantile(0.5, 3, 4)
NULL

#' @rdname gamma_distribution
#' @export
gamma_distribution <- function(shape, scale = 1) {
  structure(
    list(
      extptr = .Call(`gamma_init_`, shape, scale),
      shape = shape,
      scale = scale
    ),
    class = c("gamma_distribution", "boost_distribution")
  )
}

#' @rdname gamma_distribution
#' @export
gamma_pdf <- function(x, shape, scale = 1) {
  pdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_lpdf <- function(x, shape, scale = 1) {
  logpdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_cdf <- function(x, shape, scale = 1) {
  cdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_lcdf <- function(x, shape, scale = 1) {
  logcdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_quantile <- function(p, shape, scale = 1) {
  quantile(gamma_distribution(shape, scale), p)
}
