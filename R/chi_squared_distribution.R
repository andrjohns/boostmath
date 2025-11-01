#' @title Chi-Squared Distribution Functions
#' @name chi_squared_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Chi-Squared distribution.
#' @param x quantile
#' @param df degrees of freedom (df > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/chi_squared_dist.html) for more details on the mathematical background.
#' @examples
#' # Chi-Squared distribution with 3 degrees of freedom
#' chi_squared_pdf(2, 3)
#' chi_squared_lpdf(2, 3)
#' chi_squared_cdf(2, 3)
#' chi_squared_lcdf(2, 3)
#' chi_squared_quantile(0.5, 3)
NULL

#' @export
chi_squared_distribution <- function(df) {
  structure(
    list(
      extptr = .Call(`chi_squared_init_`, df),
      degrees_of_freedom = df
    ),
    class = c("chi_squared_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf chi_squared_distribution
cdf.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf chi_squared_distribution
logcdf.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf chi_squared_distribution
pdf.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf chi_squared_distribution
logpdf.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard chi_squared_distribution
hazard.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf chi_squared_distribution
chf.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean chi_squared_distribution
mean.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_mean_ptr_`, x$extptr)
}

#' @exportS3Method median chi_squared_distribution
median.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_median_ptr_`, x$extptr)
}

#' @exportS3Method mode chi_squared_distribution
mode.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_mode_ptr_`, x$extptr)
}

#' @exportS3Method range chi_squared_distribution
range.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile chi_squared_distribution
quantile.chi_squared_distribution <- function(x, y, ...) {
  .Call(`chi_squared_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation chi_squared_distribution
standard_deviation.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support chi_squared_distribution
support.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_support_ptr_`, x$extptr)
}

#' @exportS3Method variance chi_squared_distribution
variance.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness chi_squared_distribution
skewness.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis chi_squared_distribution
kurtosis.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess chi_squared_distribution
kurtosis_excess.chi_squared_distribution <- function(x, ...) {
  .Call(`chi_squared_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_pdf <- function(x, df) {
  pdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_lpdf <- function(x, df) {
  logpdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_cdf <- function(x, df) {
  cdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_lcdf <- function(x, df) {
  logcdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_quantile <- function(p, df) {
  quantile(chi_squared_distribution(df), p)
}
