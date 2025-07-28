#' @title Laplace Distribution Functions
#' @name laplace_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Laplace distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/laplace_dist.html) for more details on the mathematical background.
#' @examples
#' # Laplace distribution with location = 0, scale = 1
#' laplace_pdf(0)
#' laplace_lpdf(0)
#' laplace_cdf(0)
#' laplace_lcdf(0)
#' laplace_quantile(0.5)
NULL

#' @rdname laplace_distribution
#' @export
laplace_pdf <- function(x, location = 0, scale = 1) {
  .Call(`laplace_pdf_`, x, location, scale)
}

#' @rdname laplace_distribution
#' @export
laplace_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`laplace_logpdf_`, x, location, scale)
}

#' @rdname laplace_distribution
#' @export
laplace_cdf <- function(x, location = 0, scale = 1) {
  .Call(`laplace_cdf_`, x, location, scale)
}

#' @rdname laplace_distribution
#' @export
laplace_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`laplace_logcdf_`, x, location, scale)
}

#' @rdname laplace_distribution
#' @export
laplace_quantile <- function(p, location = 0, scale = 1) {
  .Call(`laplace_quantile_`, p, location, scale)
}
