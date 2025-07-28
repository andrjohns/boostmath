#' @title Inverse Chi-Squared Distribution Functions
#' @name inverse_chi_squared_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Inverse Chi-Squared distribution.
#' @param x quantile
#' @param df degrees of freedom (df > 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_chi_squared_dist.html) for more details on the mathematical background.
#' @examples
#' # Inverse Chi-Squared distribution with 3 degrees of freedom, scale = 1
#' inverse_chi_squared_pdf(2, 3, 1)
#' inverse_chi_squared_lpdf(2, 3, 1)
#' inverse_chi_squared_cdf(2, 3, 1)
#' inverse_chi_squared_lcdf(2, 3, 1)
#' inverse_chi_squared_quantile(0.5, 3, 1)
NULL

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_pdf <- function(x, df, scale = 1) {
  .Call(`inverse_chi_squared_pdf_`, x, df, scale)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_lpdf <- function(x, df, scale = 1) {
  .Call(`inverse_chi_squared_logpdf_`, x, df, scale)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_cdf <- function(x, df, scale = 1) {
  .Call(`inverse_chi_squared_cdf_`, x, df, scale)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_lcdf <- function(x, df, scale = 1) {
  .Call(`inverse_chi_squared_logcdf_`, x, df, scale)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_quantile <- function(p, df, scale = 1) {
  .Call(`inverse_chi_squared_quantile_`, p, df, scale)
}
