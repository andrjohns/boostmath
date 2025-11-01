#' @title Cauchy Distribution Functions
#' @name cauchy_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Cauchy distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/cauchy_dist.html) for more details on the mathematical background.
#' @examples
#' # Cauchy distribution with location = 0, scale = 1
#' cauchy_pdf(0)
#' cauchy_lpdf(0)
#' cauchy_cdf(0)
#' cauchy_lcdf(0)
#' cauchy_quantile(0.5)
NULL

#' @export
cauchy_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`cauchy_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("cauchy_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf cauchy_distribution
cdf.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf cauchy_distribution
logcdf.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf cauchy_distribution
pdf.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf cauchy_distribution
logpdf.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard cauchy_distribution
hazard.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf cauchy_distribution
chf.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean cauchy_distribution
mean.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_mean_ptr_`, x$extptr)
}

#' @exportS3Method median cauchy_distribution
median.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_median_ptr_`, x$extptr)
}

#' @exportS3Method mode cauchy_distribution
mode.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_mode_ptr_`, x$extptr)
}

#' @exportS3Method range cauchy_distribution
range.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile cauchy_distribution
quantile.cauchy_distribution <- function(x, y, ...) {
  .Call(`cauchy_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation cauchy_distribution
standard_deviation.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support cauchy_distribution
support.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_support_ptr_`, x$extptr)
}

#' @exportS3Method variance cauchy_distribution
variance.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness cauchy_distribution
skewness.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis cauchy_distribution
kurtosis.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess cauchy_distribution
kurtosis_excess.cauchy_distribution <- function(x, ...) {
  .Call(`cauchy_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname cauchy_distribution
#' @export
cauchy_pdf <- function(x, location = 0, scale = 1) {
  pdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_cdf <- function(x, location = 0, scale = 1) {
  cdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_quantile <- function(p, location = 0, scale = 1) {
  quantile(cauchy_distribution(location, scale), p)
}
