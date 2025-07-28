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
#' arcsine_pdf(0.5)
#' arcsine_lpdf(0.5)
#' arcsine_cdf(0.5)
#' arcsine_lcdf(0.5)
#' arcsine_quantile(0.5)
NULL

#' @rdname arcsine_distribution
#' @export
arcsine_pdf <- function(x, x_min = 0, x_max = 1) {
  .Call(`arcsine_pdf_`, x, x_min, x_max)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lpdf <- function(x, x_min = 0, x_max = 1) {
  .Call(`arcsine_logpdf_`, x, x_min, x_max)
}

#' @rdname arcsine_distribution
#' @export
arcsine_cdf <- function(x, x_min = 0, x_max = 1) {
  .Call(`arcsine_cdf_`, x, x_min, x_max)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lcdf <- function(x, x_min = 0, x_max = 1) {
  .Call(`arcsine_logcdf_`, x, x_min, x_max)
}

#' @rdname arcsine_distribution
#' @export
arcsine_quantile <- function(p, x_min = 0, x_max = 1) {
  .Call(`arcsine_quantile_`, p, x_min, x_max)
}
