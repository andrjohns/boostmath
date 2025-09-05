#' @title Noncentral Chi-Squared Distribution Functions
#' @name non_central_chi_squared_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Noncentral Chi-Squared distribution.
#' @param x quantile
#' @param df degrees of freedom (df > 0)
#' @param lambda noncentrality parameter (lambda >= 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_chi_squared_dist.html) for more details on the mathematical background.
#' @examples
#' \dontrun{
#' # Noncentral Chi-Squared distribution with 3 degrees of freedom and noncentrality
#' # parameter 1
#' non_central_chi_squared_pdf(2, 3, 1)
#' non_central_chi_squared_lpdf(2, 3, 1)
#' non_central_chi_squared_cdf(2, 3, 1)
#' non_central_chi_squared_lcdf(2, 3, 1)
#' non_central_chi_squared_quantile(0.5, 3, 1)
#' }
NULL

#' @rdname non_central_chi_squared_distribution
#' @export
non_central_chi_squared_pdf <- function(x, df, lambda) {
  .Call(`non_central_chi_squared_pdf_`, x, df, lambda)
}

#' @rdname non_central_chi_squared_distribution
#' @export
non_central_chi_squared_lpdf <- function(x, df, lambda) {
  .Call(`non_central_chi_squared_logpdf_`, x, df, lambda)
}

#' @rdname non_central_chi_squared_distribution
#' @export
non_central_chi_squared_cdf <- function(x, df, lambda) {
  .Call(`non_central_chi_squared_cdf_`, x, df, lambda)
}

#' @rdname non_central_chi_squared_distribution
#' @export
non_central_chi_squared_lcdf <- function(x, df, lambda) {
  .Call(`non_central_chi_squared_logcdf_`, x, df, lambda)
}

#' @rdname non_central_chi_squared_distribution
#' @export
non_central_chi_squared_quantile <- function(p, df, lambda) {
  .Call(`non_central_chi_squared_quantile_`, p, df, lambda)
}
