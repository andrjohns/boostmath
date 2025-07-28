#' @title Rayleigh Distribution Functions
#' @name rayleigh_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Rayleigh distribution.
#' @param x quantile
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/rayleigh.html) for more details on the mathematical background.
#' @examples
#' # Rayleigh distribution with scale = 1
#' rayleigh_pdf(1)
#' rayleigh_lpdf(1)
#' rayleigh_cdf(1)
#' rayleigh_lcdf(1)
#' rayleigh_quantile(0.5)
NULL

#' @rdname rayleigh_distribution
#' @export
rayleigh_pdf <- function(x, scale = 1) {
  .Call(`rayleigh_pdf_`, x, scale)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_lpdf <- function(x, scale = 1) {
  .Call(`rayleigh_logpdf_`, x, scale)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_cdf <- function(x, scale = 1) {
  .Call(`rayleigh_cdf_`, x, scale)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_lcdf <- function(x, scale = 1) {
  .Call(`rayleigh_logcdf_`, x, scale)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_quantile <- function(p, scale = 1) {
  .Call(`rayleigh_quantile_`, p, scale)
}
