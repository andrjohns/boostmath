#' @title Weibull Distribution Functions
#' @name weibull_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Weibull distribution.
#' @param x quantile
#' @param shape shape parameter (default is 1)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/weibull_dist.html) for more details on the mathematical background.
#' @examples
#' # Weibull distribution with shape = 1, scale = 1
#' weibull_pdf(1)
#' weibull_lpdf(1)
#' weibull_cdf(1)
#' weibull_lcdf(1)
#' weibull_quantile(0.5)
NULL

#' @rdname weibull_distribution
#' @export
weibull_pdf <- function(x, shape = 1, scale = 1) {
  .Call(`weibull_pdf_`, x, shape, scale)
}

#' @rdname weibull_distribution
#' @export
weibull_lpdf <- function(x, shape = 1, scale = 1) {
  .Call(`weibull_logpdf_`, x, shape, scale)
}

#' @rdname weibull_distribution
#' @export
weibull_cdf <- function(x, shape = 1, scale = 1) {
  .Call(`weibull_cdf_`, x, shape, scale)
}

#' @rdname weibull_distribution
#' @export
weibull_lcdf <- function(x, shape = 1, scale = 1) {
  .Call(`weibull_logcdf_`, x, shape, scale)
}

#' @rdname weibull_distribution
#' @export
weibull_quantile <- function(p, shape = 1, scale = 1) {
  .Call(`weibull_quantile_`, p, shape, scale)
}
