#' @title Inverse Gamma Distribution Functions
#' @name inverse_gamma_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Inverse Gamma distribution.
#' @param x quantile
#' @param shape shape parameter (shape > 0)
#' @param scale scale parameter (scale > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gamma_dist.html) for more details on the mathematical background.
#' @examples
#' # Inverse Gamma distribution with shape = 3, scale = 4
#' inverse_gamma_pdf(2, 3, 4)
#' inverse_gamma_lpdf(2, 3, 4)
#' inverse_gamma_cdf(2, 3, 4)
#' inverse_gamma_lcdf(2, 3, 4)
#' inverse_gamma_quantile(0.5, 3, 4)
NULL

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_pdf <- function(x, shape, scale) {
  .Call(`inverse_gamma_pdf_`, x, shape, scale)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_lpdf <- function(x, shape, scale) {
  .Call(`inverse_gamma_logpdf_`, x, shape, scale)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_cdf <- function(x, shape, scale) {
  .Call(`inverse_gamma_cdf_`, x, shape, scale)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_lcdf <- function(x, shape, scale) {
  .Call(`inverse_gamma_logcdf_`, x, shape, scale)
}

#' @rdname inverse_gamma_distribution
#' @export
inverse_gamma_quantile <- function(p, shape, scale) {
  .Call(`inverse_gamma_quantile_`, p, shape, scale)
}
