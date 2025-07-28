#' @title Exponential Distribution Functions
#' @name exponential_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Exponential distribution.
#' @param x quantile
#' @param lambda rate parameter (lambda > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/exp_dist.html) for more details on the mathematical background.
#' @examples
#' # Exponential distribution with rate parameter lambda = 2
#' exponential_pdf(1, 2)
#' exponential_lpdf(1, 2)
#' exponential_cdf(1, 2)
#' exponential_lcdf(1, 2)
#' exponential_quantile(0.5, 2)
NULL

#' @rdname exponential_distribution
#' @export
exponential_pdf <- function(x, lambda) {
  .Call(`exponential_pdf_`, x, lambda)
}

#' @rdname exponential_distribution
#' @export
exponential_lpdf <- function(x, lambda) {
  .Call(`exponential_logpdf_`, x, lambda)
}

#' @rdname exponential_distribution
#' @export
exponential_cdf <- function(x, lambda) {
  .Call(`exponential_cdf_`, x, lambda)
}

#' @rdname exponential_distribution
#' @export
exponential_lcdf <- function(x, lambda) {
  .Call(`exponential_logcdf_`, x, lambda)
}

#' @rdname exponential_distribution
#' @export
exponential_quantile <- function(p, lambda) {
  .Call(`exponential_quantile_`, p, lambda)
}
