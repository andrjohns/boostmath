#' @title Extreme Value Distribution Functions
#' @name extreme_value_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Extreme Value distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/extreme_dist.html) for more details on the mathematical background.
#' @examples
#' # Extreme Value distribution with location = 0, scale = 1
#' extreme_value_pdf(0)
#' extreme_value_lpdf(0)
#' extreme_value_cdf(0)
#' extreme_value_lcdf(0)
#' extreme_value_quantile(0.5)
NULL

#' @export
extreme_value_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`extreme_value_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("extreme_value_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf extreme_value_distribution
cdf.extreme_value_distribution <- function(x, y, ...) {
  .Call(`extreme_value_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf extreme_value_distribution
logcdf.extreme_value_distribution <- function(x, y, ...) {
  .Call(`extreme_value_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf extreme_value_distribution
pdf.extreme_value_distribution <- function(x, y, ...) {
  .Call(`extreme_value_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf extreme_value_distribution
logpdf.extreme_value_distribution <- function(x, y, ...) {
  .Call(`extreme_value_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard extreme_value_distribution
hazard.extreme_value_distribution <- function(x, y, ...) {
  .Call(`extreme_value_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf extreme_value_distribution
chf.extreme_value_distribution <- function(x, y, ...) {
  .Call(`extreme_value_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean extreme_value_distribution
mean.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_mean_ptr_`, x$extptr)
}

#' @exportS3Method median extreme_value_distribution
median.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_median_ptr_`, x$extptr)
}

#' @exportS3Method mode extreme_value_distribution
mode.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_mode_ptr_`, x$extptr)
}

#' @exportS3Method range extreme_value_distribution
range.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile extreme_value_distribution
quantile.extreme_value_distribution <- function(x, p, ...) {
  .Call(`extreme_value_quantile_ptr_`, x$extptr, p)
}

#' @exportS3Method standard_deviation extreme_value_distribution
standard_deviation.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support extreme_value_distribution
support.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_support_ptr_`, x$extptr)
}

#' @exportS3Method variance extreme_value_distribution
variance.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness extreme_value_distribution
skewness.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis extreme_value_distribution
kurtosis.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess extreme_value_distribution
kurtosis_excess.extreme_value_distribution <- function(x, ...) {
  .Call(`extreme_value_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_pdf <- function(x, location = 0, scale = 1) {
  pdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_cdf <- function(x, location = 0, scale = 1) {
  cdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(extreme_value_distribution(location, scale), x)
}

#' @rdname extreme_value_distribution
#' @export
extreme_value_quantile <- function(p, location = 0, scale = 1) {
  quantile(extreme_value_distribution(location, scale), p)
}
