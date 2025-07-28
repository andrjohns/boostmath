#' @title Noncentral Beta Distribution Functions
#' @name non_central_beta_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Noncentral Beta distribution.
#' @param x quantile (0 <= x <= 1)
#' @param alpha first shape parameter (alpha > 0)
#' @param beta second shape parameter (beta > 0)
#' @param lambda noncentrality parameter (lambda >= 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_beta_dist.html) for more details on the mathematical background.
#' @examples
#' # Noncentral Beta distribution with shape parameters alpha = 2, beta = 3
#' # and noncentrality parameter lambda = 1
#' non_central_beta_pdf(0.5, 2, 3, 1)
#' non_central_beta_lpdf(0.5, 2, 3, 1)
#' non_central_beta_cdf(0.5, 2, 3, 1)
#' non_central_beta_lcdf(0.5, 2, 3, 1)
#' non_central_beta_quantile(0.5, 2, 3, 1)
NULL

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_pdf <- function(x, alpha, beta, lambda) {
  .Call(`non_central_beta_pdf_`, x, alpha, beta, lambda)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_lpdf <- function(x, alpha, beta, lambda) {
  .Call(`non_central_beta_logpdf_`, x, alpha, beta, lambda)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_cdf <- function(x, alpha, beta, lambda) {
  .Call(`non_central_beta_cdf_`, x, alpha, beta, lambda)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_lcdf <- function(x, alpha, beta, lambda) {
  .Call(`non_central_beta_logcdf_`, x, alpha, beta, lambda)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_quantile <- function(p, alpha, beta, lambda) {
  .Call(`non_central_beta_quantile_`, p, alpha, beta, lambda)
}
