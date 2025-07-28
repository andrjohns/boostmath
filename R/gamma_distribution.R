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
#' gamma_pdf(2, 3, 4)
#' gamma_lpdf(2, 3, 4)
#' gamma_cdf(2, 3, 4)
#' gamma_lcdf(2, 3, 4)
#' gamma_quantile(0.5, 3, 4)
NULL

#' @rdname gamma_distribution
#' @export
gamma_pdf <- function(x, shape, scale) {
  .Call(`gamma_pdf_`, x, shape, scale)
}

#' @rdname gamma_distribution
#' @export
gamma_lpdf <- function(x, shape, scale) {
  .Call(`gamma_logpdf_`, x, shape, scale)
}

#' @rdname gamma_distribution
#' @export
gamma_cdf <- function(x, shape, scale) {
  .Call(`gamma_cdf_`, x, shape, scale)
}

#' @rdname gamma_distribution
#' @export
gamma_lcdf <- function(x, shape, scale) {
  .Call(`gamma_logcdf_`, x, shape, scale)
}

#' @rdname gamma_distribution
#' @export
gamma_quantile <- function(p, shape, scale) {
  .Call(`gamma_quantile_`, p, shape, scale)
}
