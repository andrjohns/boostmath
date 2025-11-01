#' @title Arcsine Distribution Functions
#' @name arcsine_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the arcsine distribution.
#' @param x quantile
#' @param p probability
#' @param x_min minimum value of the distribution (default is 0)
#' @param x_max maximum value of the distribution (default is 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/arcine_dist.html) for more details on the mathematical background.
#' @examples
#' arcsine_pdf(0.5)
#' arcsine_lpdf(0.5)
#' arcsine_cdf(0.5)
#' arcsine_lcdf(0.5)
#' arcsine_quantile(0.5)
NULL

#' @export
arcsine_distribution <- function(x_min = 0, x_max = 1) {
  structure(
    list(
      extptr = .Call(`arcsine_init_`, x_min, x_max),
      x_min = x_min,
      x_max = x_max
    ),
    class = c("arcsine_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf arcsine_distribution
cdf.arcsine_distribution <- function(x, y, ...) {
  .Call(`arcsine_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf arcsine_distribution
logcdf.arcsine_distribution <- function(x, y, ...) {
  .Call(`arcsine_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf arcsine_distribution
pdf.arcsine_distribution <- function(x, y, ...) {
  .Call(`arcsine_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf arcsine_distribution
logpdf.arcsine_distribution <- function(x, y, ...) {
  .Call(`arcsine_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard arcsine_distribution
hazard.arcsine_distribution <- function(x, y, ...) {
  .Call(`arcsine_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf arcsine_distribution
chf.arcsine_distribution <- function(x, y, ...) {
  .Call(`arcsine_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean arcsine_distribution
mean.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_mean_ptr_`, x$extptr)
}

#' @exportS3Method median arcsine_distribution
median.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_median_ptr_`, x$extptr)
}

#' @exportS3Method mode arcsine_distribution
mode.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_mode_ptr_`, x$extptr)
}

#' @exportS3Method range arcsine_distribution
range.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile arcsine_distribution
quantile.arcsine_distribution <- function(x, p, ...) {
  .Call(`arcsine_quantile_ptr_`, x$extptr, p)
}

#' @exportS3Method standard_deviation arcsine_distribution
standard_deviation.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support arcsine_distribution
support.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_support_ptr_`, x$extptr)
}

#' @exportS3Method variance arcsine_distribution
variance.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness arcsine_distribution
skewness.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis arcsine_distribution
kurtosis.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess arcsine_distribution
kurtosis_excess.arcsine_distribution <- function(x, ...) {
  .Call(`arcsine_kurtosis_excess_ptr_`, x$extptr)
}


#' @rdname arcsine_distribution
#' @export
arcsine_pdf <- function(x, x_min = 0, x_max = 1) {
  pdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lpdf <- function(x, x_min = 0, x_max = 1) {
  logpdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_cdf <- function(x, x_min = 0, x_max = 1) {
  cdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lcdf <- function(x, x_min = 0, x_max = 1) {
  logcdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_quantile <- function(p, x_min = 0, x_max = 1) {
  quantile(arcsine_distribution(x_min, x_max), p)
}
