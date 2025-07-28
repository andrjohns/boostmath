#' @title Inverse Gaussian Distribution Functions
#' @name inverse_gaussian_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Inverse Gaussian distribution.
#' @param x quantile
#' @param mu mean parameter (mu > 0)
#' @param lambda scale (precision) parameter (lambda > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gaussian_dist.html) for more details on the mathematical background.
#' @examples
#' # Inverse Gaussian distribution with mu = 3, lambda = 4
#' inverse_gaussian_pdf(2, 3, 4)
#' inverse_gaussian_lpdf(2, 3, 4)
#' inverse_gaussian_cdf(2, 3, 4)
#' inverse_gaussian_lcdf(2, 3, 4)
#' inverse_gaussian_quantile(0.5, 3, 4)
NULL

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_pdf <- function(x, mu, lambda) {
  .Call(`inverse_gaussian_pdf_`, x, mu, lambda)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_lpdf <- function(x, mu, lambda) {
  .Call(`inverse_gaussian_logpdf_`, x, mu, lambda)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_cdf <- function(x, mu, lambda) {
  .Call(`inverse_gaussian_cdf_`, x, mu, lambda)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_lcdf <- function(x, mu, lambda) {
  .Call(`inverse_gaussian_logcdf_`, x, mu, lambda)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_quantile <- function(p, mu, lambda) {
  .Call(`inverse_gaussian_quantile_`, p, mu, lambda)
}
