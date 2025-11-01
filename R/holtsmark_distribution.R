#' @title Holtsmark Distribution Functions
#' @name holtsmark_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Holtsmark distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/holtsmark_dist.html) for more details on the mathematical background.
#' @examples
#' # Holtsmark distribution with location 0 and scale 1
#' holtsmark_pdf(3)
#' holtsmark_lpdf(3)
#' holtsmark_cdf(3)
#' holtsmark_lcdf(3)
#' holtsmark_quantile(0.5)
NULL

#' @export
holtsmark_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`holtsmark_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("holtsmark_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf holtsmark_distribution
cdf.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf holtsmark_distribution
logcdf.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf holtsmark_distribution
pdf.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf holtsmark_distribution
logpdf.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard holtsmark_distribution
hazard.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf holtsmark_distribution
chf.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean holtsmark_distribution
mean.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_mean_ptr_`, x$extptr)
}

#' @exportS3Method median holtsmark_distribution
median.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_median_ptr_`, x$extptr)
}

#' @exportS3Method mode holtsmark_distribution
mode.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_mode_ptr_`, x$extptr)
}

#' @exportS3Method range holtsmark_distribution
range.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile holtsmark_distribution
quantile.holtsmark_distribution <- function(x, y, ...) {
  .Call(`holtsmark_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation holtsmark_distribution
standard_deviation.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support holtsmark_distribution
support.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_support_ptr_`, x$extptr)
}

#' @exportS3Method variance holtsmark_distribution
variance.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness holtsmark_distribution
skewness.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis holtsmark_distribution
kurtosis.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess holtsmark_distribution
kurtosis_excess.holtsmark_distribution <- function(x, ...) {
  .Call(`holtsmark_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_pdf <- function(x, location = 0, scale = 1) {
  pdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_cdf <- function(x, location = 0, scale = 1) {
  cdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_quantile <- function(p, location = 0, scale = 1) {
  quantile(holtsmark_distribution(location, scale), p)
}
