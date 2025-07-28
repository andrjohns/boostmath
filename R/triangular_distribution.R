#' @title Triangular Distribution Functions
#' @name triangular_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Triangular distribution.
#' @param x quantile
#' @param lower lower limit of the distribution (default is 0)
#' @param mode mode of the distribution (default is 1)
#' @param upper upper limit of the distribution (default is 2)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/triangular_dist.html) for more details on the mathematical background.
#' @examples
#' # Triangular distribution with lower = 0, mode = 1, upper = 2
#' triangular_pdf(1)
#' triangular_lpdf(1)
#' triangular_cdf(1)
#' triangular_lcdf(1)
#' triangular_quantile(0.5)
NULL

#' @rdname triangular_distribution
#' @export
triangular_pdf <- function(x, lower = 0, mode = 1, upper = 2) {
  .Call(`triangular_pdf_`, x, lower, mode, upper)
}

#' @rdname triangular_distribution
#' @export
triangular_lpdf <- function(x, lower = 0, mode = 1, upper = 2) {
  .Call(`triangular_logpdf_`, x, lower, mode, upper)
}

#' @rdname triangular_distribution
#' @export
triangular_cdf <- function(x, lower = 0, mode = 1, upper = 2) {
  .Call(`triangular_cdf_`, x, lower, mode, upper)
}

#' @rdname triangular_distribution
#' @export
triangular_lcdf <- function(x, lower = 0, mode = 1, upper = 2) {
  .Call(`triangular_logcdf_`, x, lower, mode, upper)
}

#' @rdname triangular_distribution
#' @export
triangular_quantile <- function(p, lower = 0, mode = 1, upper = 2) {
  .Call(`triangular_quantile_`, p, lower, mode, upper)
}
