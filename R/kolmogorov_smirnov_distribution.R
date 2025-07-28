#' @title Kolmogorov-Smirnov Distribution Functions
#' @name kolmogorov_smirnov_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Kolmogorov-Smirnov distribution.
#' @param x quantile
#' @param n sample size (n > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/kolmogorov_smirnov_dist.html) for more details on the mathematical background.
#' @examples
#' # Kolmogorov-Smirnov distribution with sample size n = 10
#' kolmogorov_smirnov_pdf(0.5, 10)
#' kolmogorov_smirnov_lpdf(0.5, 10)
#' kolmogorov_smirnov_cdf(0.5, 10)
#' kolmogorov_smirnov_lcdf(0.5, 10)
#' kolmogorov_smirnov_quantile(0.5, 10)
NULL

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_pdf <- function(x, n) {
  .Call(`kolmogorov_smirnov_pdf_`, x, n)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_lpdf <- function(x, n) {
  .Call(`kolmogorov_smirnov_logpdf_`, x, n)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_cdf <- function(x, n) {
  .Call(`kolmogorov_smirnov_cdf_`, x, n)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_lcdf <- function(x, n) {
  .Call(`kolmogorov_smirnov_logcdf_`, x, n)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_quantile <- function(p, n) {
  .Call(`kolmogorov_smirnov_quantile_`, p, n)
}
