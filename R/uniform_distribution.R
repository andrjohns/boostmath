#' @title Uniform Distribution Functions
#' @name uniform_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Uniform distribution.
#' @param x quantile
#' @param lower lower bound of the distribution (default is 0)
#' @param upper upper bound of the distribution (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/uniform_dist.html) for more details on the mathematical background.
#' @examples
#' # Uniform distribution with lower = 0, upper = 1
#' uniform_pdf(0.5)
#' uniform_lpdf(0.5)
#' uniform_cdf(0.5)
#' uniform_lcdf(0.5)
#' uniform_quantile(0.5)
NULL

#' @rdname uniform_distribution
#' @export
uniform_pdf <- function(x, lower = 0, upper = 1) {
  .Call(`uniform_pdf_`, x, lower, upper)
}

#' @rdname uniform_distribution
#' @export
uniform_lpdf <- function(x, lower = 0, upper = 1) {
  .Call(`uniform_logpdf_`, x, lower, upper)
}

#' @rdname uniform_distribution
#' @export
uniform_cdf <- function(x, lower = 0, upper = 1) {
  .Call(`uniform_cdf_`, x, lower, upper)
}

#' @rdname uniform_distribution
#' @export
uniform_lcdf <- function(x, lower = 0, upper = 1) {
  .Call(`uniform_logcdf_`, x, lower, upper)
}

#' @rdname uniform_distribution
#' @export
uniform_quantile <- function(p, lower = 0, upper = 1) {
  .Call(`uniform_quantile_`, p, lower, upper)
}
