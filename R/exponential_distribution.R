#' @title Exponential Distribution Functions
#' @name exponential_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Exponential distribution.
#' @param x quantile
#' @param lambda rate parameter (lambda > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/exp_dist.html) for more details on the mathematical background.
#' @examples
#' # Exponential distribution with rate parameter lambda = 2
#' exponential_pdf(1, 2)
#' exponential_lpdf(1, 2)
#' exponential_cdf(1, 2)
#' exponential_lcdf(1, 2)
#' exponential_quantile(0.5, 2)
NULL

#' @export
exponential_distribution <- function(lambda = 1) {
  structure(
    list(
      extptr = .Call(`exponential_init_`, lambda),
      rate = lambda
    ),
    class = c("exponential_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf exponential_distribution
cdf.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf exponential_distribution
logcdf.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf exponential_distribution
pdf.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf exponential_distribution
logpdf.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard exponential_distribution
hazard.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf exponential_distribution
chf.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean exponential_distribution
mean.exponential_distribution <- function(x, ...) {
  .Call(`exponential_mean_ptr_`, x$extptr)
}

#' @exportS3Method median exponential_distribution
median.exponential_distribution <- function(x, ...) {
  .Call(`exponential_median_ptr_`, x$extptr)
}

#' @exportS3Method mode exponential_distribution
mode.exponential_distribution <- function(x, ...) {
  .Call(`exponential_mode_ptr_`, x$extptr)
}

#' @exportS3Method range exponential_distribution
range.exponential_distribution <- function(x, ...) {
  .Call(`exponential_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile exponential_distribution
quantile.exponential_distribution <- function(x, y, ...) {
  .Call(`exponential_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation exponential_distribution
standard_deviation.exponential_distribution <- function(x, ...) {
  .Call(`exponential_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support exponential_distribution
support.exponential_distribution <- function(x, ...) {
  .Call(`exponential_support_ptr_`, x$extptr)
}

#' @exportS3Method variance exponential_distribution
variance.exponential_distribution <- function(x, ...) {
  .Call(`exponential_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness exponential_distribution
skewness.exponential_distribution <- function(x, ...) {
  .Call(`exponential_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis exponential_distribution
kurtosis.exponential_distribution <- function(x, ...) {
  .Call(`exponential_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess exponential_distribution
kurtosis_excess.exponential_distribution <- function(x, ...) {
  .Call(`exponential_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname exponential_distribution
#' @export
exponential_pdf <- function(x, lambda = 1) {
  pdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_lpdf <- function(x, lambda = 1) {
  logpdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_cdf <- function(x, lambda = 1) {
  cdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_lcdf <- function(x, lambda = 1) {
  logcdf(exponential_distribution(lambda), x)
}

#' @rdname exponential_distribution
#' @export
exponential_quantile <- function(p, lambda = 1) {
  quantile(exponential_distribution(lambda), p)
}
