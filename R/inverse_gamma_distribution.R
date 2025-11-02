#' @title Inverse Gamma Distribution Functions
#' @name inverse_gamma_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Inverse Gamma distribution.
#' @param x quantile
#' @param shape shape parameter (shape > 0)
#' @param scale scale parameter (scale > 0; default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gamma_dist.html) for more details on the mathematical background.
#' @examples
#' # Inverse Gamma distribution with shape = 5, scale = 4
#' dist <- inverse_gamma_distribution(5, 4)
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
#' inverse_gamma_pdf(2, 5, 4)
#' inverse_gamma_lpdf(2, 5, 4)
#' inverse_gamma_cdf(2, 5, 4)
#' inverse_gamma_lcdf(2, 5, 4)
#' inverse_gamma_quantile(0.5, 5, 4)
NULL

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_distribution <- function(shape, scale = 1) {
  structure(
    list(
      extptr = .Call(`inverse_gamma_init_`, shape, scale),
      shape = shape,
      scale = scale
    ),
    class = c("inverse_gamma_distribution", "boost_distribution")
  )
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_pdf <- function(x, shape, scale = 1) {
  pdf(inverse_gamma_distribution(shape, scale), x)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_lpdf <- function(x, shape, scale = 1) {
  logpdf(inverse_gamma_distribution(shape, scale), x)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_cdf <- function(x, shape, scale = 1) {
  cdf(inverse_gamma_distribution(shape, scale), x)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_lcdf <- function(x, shape, scale = 1) {
  logcdf(inverse_gamma_distribution(shape, scale), x)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_quantile <- function(p, shape, scale = 1) {
  quantile(inverse_gamma_distribution(shape, scale), p)
}
