#' @title Noncentral T Distribution Functions
#' @name non_central_t_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Noncentral T distribution.
#' @param x quantile
#' @param df degrees of freedom (df > 0)
#' @param delta noncentrality parameter (delta >= 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_t_dist.html) for more details on the mathematical background.
#' @examples
#' # Noncentral T distribution with 3 degrees of freedom and noncentrality parameter 1
#' non_central_t_pdf(0, 3, 1)
#' non_central_t_lpdf(0, 3, 1)
#' non_central_t_cdf(0, 3, 1)
#' non_central_t_lcdf(0, 3, 1)
#' non_central_t_quantile(0.5, 3, 1)
NULL

#' @rdname non_central_t_distribution
#' @export
non_central_t_pdf <- function(x, df, delta) {
  .Call(`non_central_t_pdf_`, x, df, delta)
}

#' @rdname non_central_t_distribution
#' @export
non_central_t_lpdf <- function(x, df, delta) {
  .Call(`non_central_t_logpdf_`, x, df, delta)
}

#' @rdname non_central_t_distribution
#' @export
non_central_t_cdf <- function(x, df, delta) {
  .Call(`non_central_t_cdf_`, x, df, delta)
}

#' @rdname non_central_t_distribution
#' @export
non_central_t_lcdf <- function(x, df, delta) {
  .Call(`non_central_t_logcdf_`, x, df, delta)
}

#' @rdname non_central_t_distribution
#' @export
non_central_t_quantile <- function(p, df, delta) {
  .Call(`non_central_t_quantile_`, p, df, delta)
}
