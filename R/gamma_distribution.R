#' @title Gamma Distribution Functions
#' @name gamma_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Gamma distribution.
#' @param x quantile
#' @param shape shape parameter (shape > 0)
#' @param scale scale parameter (scale > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/gamma_dist.html) for more details on the mathematical background.
#' @examples
#' # Gamma distribution with shape = 3, scale = 4
#' gamma_pdf(2, 3, 4)
#' gamma_lpdf(2, 3, 4)
#' gamma_cdf(2, 3, 4)
#' gamma_lcdf(2, 3, 4)
#' gamma_quantile(0.5, 3, 4)
NULL

#' @export
gamma_distribution <- function(shape, scale = 1) {
  structure(
    list(
      extptr = .Call(`gamma_init_`, shape, scale),
      shape = shape,
      scale = scale
    ),
    class = c("gamma_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf gamma_distribution
cdf.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf gamma_distribution
logcdf.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf gamma_distribution
pdf.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf gamma_distribution
logpdf.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard gamma_distribution
hazard.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf gamma_distribution
chf.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean gamma_distribution
mean.gamma_distribution <- function(x, ...) {
  .Call(`gamma_mean_ptr_`, x$extptr)
}

#' @exportS3Method median gamma_distribution
median.gamma_distribution <- function(x, ...) {
  .Call(`gamma_median_ptr_`, x$extptr)
}

#' @exportS3Method mode gamma_distribution
mode.gamma_distribution <- function(x, ...) {
  .Call(`gamma_mode_ptr_`, x$extptr)
}

#' @exportS3Method range gamma_distribution
range.gamma_distribution <- function(x, ...) {
  .Call(`gamma_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile gamma_distribution
quantile.gamma_distribution <- function(x, y, ...) {
  .Call(`gamma_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation gamma_distribution
standard_deviation.gamma_distribution <- function(x, ...) {
  .Call(`gamma_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support gamma_distribution
support.gamma_distribution <- function(x, ...) {
  .Call(`gamma_support_ptr_`, x$extptr)
}

#' @exportS3Method variance gamma_distribution
variance.gamma_distribution <- function(x, ...) {
  .Call(`gamma_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness gamma_distribution
skewness.gamma_distribution <- function(x, ...) {
  .Call(`gamma_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis gamma_distribution
kurtosis.gamma_distribution <- function(x, ...) {
  .Call(`gamma_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess gamma_distribution
kurtosis_excess.gamma_distribution <- function(x, ...) {
  .Call(`gamma_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname gamma_distribution
#' @export
gamma_pdf <- function(x, shape, scale = 1) {
  pdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_lpdf <- function(x, shape, scale = 1) {
  logpdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_cdf <- function(x, shape, scale = 1) {
  cdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_lcdf <- function(x, shape, scale = 1) {
  logcdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_quantile <- function(p, shape, scale = 1) {
  quantile(gamma_distribution(shape, scale), p)
}
