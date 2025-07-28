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
#' lognormal_pdf(0)
#' lognormal_lpdf(0)
#' lognormal_cdf(0)
#' lognormal_lcdf(0)
#' lognormal_quantile(0.5)
NULL

#' @rdname lognormal_distribution
#' @export
lognormal_pdf <- function(x, location = 0, scale = 1) {
  .Call(`lognormal_pdf_`, x, location, scale)
}

#' @rdname lognormal_distribution
#' @export
lognormal_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`lognormal_logpdf_`, x, location, scale)
}

#' @rdname lognormal_distribution
#' @export
lognormal_cdf <- function(x, location = 0, scale = 1) {
  .Call(`lognormal_cdf_`, x, location, scale)
}

#' @rdname lognormal_distribution
#' @export
lognormal_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`lognormal_logcdf_`, x, location, scale)
}

#' @rdname lognormal_distribution
#' @export
lognormal_quantile <- function(p, location = 0, scale = 1) {
  .Call(`lognormal_quantile_`, p, location, scale)
}
