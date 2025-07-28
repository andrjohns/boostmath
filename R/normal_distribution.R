#' @title Normal Distribution Functions
#' @name normal_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Normal distribution.
#' @param x quantile
#' @param mean mean parameter (default is 0)
#' @param sd standard deviation parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/normal_dist.html) for more details on the mathematical background.
#' @examples
#' # Normal distribution with mean = 0, sd = 1
#' normal_pdf(0)
#' normal_lpdf(0)
#' normal_cdf(0)
#' normal_lcdf(0)
#' normal_quantile(0.5)
NULL

#' @rdname normal_distribution
#' @export
normal_pdf <- function(x, mean = 0, sd = 1) {
  .Call(`normal_pdf_`, x, mean, sd)
}

#' @rdname normal_distribution
#' @export
normal_lpdf <- function(x, mean = 0, sd = 1) {
  .Call(`normal_logpdf_`, x, mean, sd)
}

#' @rdname normal_distribution
#' @export
normal_cdf <- function(x, mean = 0, sd = 1) {
  .Call(`normal_cdf_`, x, mean, sd)
}

#' @rdname normal_distribution
#' @export
normal_lcdf <- function(x, mean = 0, sd = 1) {
  .Call(`normal_logcdf_`, x, mean, sd)
}

#' @rdname normal_distribution
#' @export
normal_quantile <- function(p, mean = 0, sd = 1) {
  .Call(`normal_quantile_`, p, mean, sd)
}
