#' @title Geometric Distribution Functions
#' @name geometric_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Geometric distribution.
#' @param x quantile (non-negative integer)
#' @param prob probability of success (0 < prob < 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/geometric_dist.html) for more details on the mathematical background.
#' @examples
#' # Geometric distribution with probability of success prob = 0.5
#' geometric_pdf(3, 0.5)
#' geometric_lpdf(3, 0.5)
#' geometric_cdf(3, 0.5)
#' geometric_lcdf(3, 0.5)
#' geometric_quantile(0.5, 0.5)
NULL

#' @rdname geometric_distribution
#' @export
geometric_pdf <- function(x, prob) {
  .Call(`geometric_pdf_`, x, prob)
}

#' @rdname geometric_distribution
#' @export
geometric_lpdf <- function(x, prob) {
  .Call(`geometric_logpdf_`, x, prob)
}

#' @rdname geometric_distribution
#' @export
geometric_cdf <- function(x, prob) {
  .Call(`geometric_cdf_`, x, prob)
}

#' @rdname geometric_distribution
#' @export
geometric_lcdf <- function(x, prob) {
  .Call(`geometric_logcdf_`, x, prob)
}

#' @rdname geometric_distribution
#' @export
geometric_quantile <- function(p, prob) {
  .Call(`geometric_quantile_`, p, prob)
}
