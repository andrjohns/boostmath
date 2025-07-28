#' @title Pareto Distribution Functions
#' @name pareto_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Pareto distribution.
#' @param x quantile
#' @param shape shape parameter (default is 1)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/pareto.html) for more details on the mathematical background.
#' @examples
#' # Pareto distribution with shape = 1, scale = 1
#' pareto_pdf(1)
#' pareto_lpdf(1)
#' pareto_cdf(1)
#' pareto_lcdf(1)
#' pareto_quantile(0.5)
NULL

#' @rdname pareto_distribution
#' @export
pareto_pdf <- function(x, shape = 1, scale = 1) {
  .Call(`pareto_pdf_`, x, shape, scale)
}

#' @rdname pareto_distribution
#' @export
pareto_lpdf <- function(x, shape = 1, scale = 1) {
  .Call(`pareto_logpdf_`, x, shape, scale)
}

#' @rdname pareto_distribution
#' @export
pareto_cdf <- function(x, shape = 1, scale = 1) {
  .Call(`pareto_cdf_`, x, shape, scale)
}

#' @rdname pareto_distribution
#' @export
pareto_lcdf <- function(x, shape = 1, scale = 1) {
  .Call(`pareto_logcdf_`, x, shape, scale)
}

#' @rdname pareto_distribution
#' @export
pareto_quantile <- function(p, shape = 1, scale = 1) {
  .Call(`pareto_quantile_`, p, shape, scale)
}
