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
#' skew_normal_pdf(0)
#' skew_normal_lpdf(0)
#' skew_normal_cdf(0)
#' skew_normal_lcdf(0)
#' skew_normal_quantile(0.5)
NULL

#' @rdname skew_normal_distribution
#' @export
skew_normal_pdf <- function(x, location = 0, scale = 1, shape = 0) {
  .Call(`skew_normal_pdf_`, x, location, scale, shape)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_lpdf <- function(x, location = 0, scale = 1, shape = 0) {
  .Call(`skew_normal_logpdf_`, x, location, scale, shape)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_cdf <- function(x, location = 0, scale = 1, shape = 0) {
  .Call(`skew_normal_cdf_`, x, location, scale, shape)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_lcdf <- function(x, location = 0, scale = 1, shape = 0) {
  .Call(`skew_normal_logcdf_`, x, location, scale, shape)
}

#' @rdname skew_normal_distribution
#' @export
skew_normal_quantile <- function(p, location = 0, scale = 1, shape = 0) {
  .Call(`skew_normal_quantile_`, p, location, scale, shape)
}
