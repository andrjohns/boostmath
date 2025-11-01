#' @title Beta Distribution Functions
#' @name beta_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Beta distribution.
#' @param x quantile (0 <= x <= 1)
#' @param alpha shape parameter (alpha > 0)
#' @param beta shape parameter (beta > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/beta_dist.html) for more details on the mathematical background.
#' @examples
#' # Beta distribution with shape parameters alpha = 2, beta = 5
#' beta_pdf(0.5, 2, 5)
#' beta_lpdf(0.5, 2, 5)
#' beta_cdf(0.5, 2, 5)
#' beta_lcdf(0.5, 2, 5)
#' beta_quantile(0.5, 2, 5)
NULL

#' @export
beta_distribution <- function(alpha, beta) {
  structure(
    list(
      extptr = .Call(`beta_init_`, alpha, beta),
      alpha = alpha,
      beta = beta
    ),
    class = c("beta_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf beta_distribution
cdf.beta_distribution <- function(x, y, ...) {
  .Call(`beta_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf beta_distribution
logcdf.beta_distribution <- function(x, y, ...) {
  .Call(`beta_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf beta_distribution
pdf.beta_distribution <- function(x, y, ...) {
  .Call(`beta_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf beta_distribution
logpdf.beta_distribution <- function(x, y, ...) {
  .Call(`beta_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard beta_distribution
hazard.beta_distribution <- function(x, y, ...) {
  .Call(`beta_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf beta_distribution
chf.beta_distribution <- function(x, y, ...) {
  .Call(`beta_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean beta_distribution
mean.beta_distribution <- function(x, ...) {
  .Call(`beta_mean_ptr_`, x$extptr)
}

#' @exportS3Method median beta_distribution
median.beta_distribution <- function(x, ...) {
  .Call(`beta_median_ptr_`, x$extptr)
}

#' @exportS3Method mode beta_distribution
mode.beta_distribution <- function(x, ...) {
  .Call(`beta_mode_ptr_`, x$extptr)
}

#' @exportS3Method range beta_distribution
range.beta_distribution <- function(x, ...) {
  .Call(`beta_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile beta_distribution
quantile.beta_distribution <- function(x, y, ...) {
  .Call(`beta_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation beta_distribution
standard_deviation.beta_distribution <- function(x, ...) {
  .Call(`beta_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support beta_distribution
support.beta_distribution <- function(x, ...) {
  .Call(`beta_support_ptr_`, x$extptr)
}

#' @exportS3Method variance beta_distribution
variance.beta_distribution <- function(x, ...) {
  .Call(`beta_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness beta_distribution
skewness.beta_distribution <- function(x, ...) {
  .Call(`beta_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis beta_distribution
kurtosis.beta_distribution <- function(x, ...) {
  .Call(`beta_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess beta_distribution
kurtosis_excess.beta_distribution <- function(x, ...) {
  .Call(`beta_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname beta_distribution
#' @export
beta_pdf <- function(x, alpha, beta) {
  pdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_lpdf <- function(x, alpha, beta) {
  logpdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_cdf <- function(x, alpha, beta) {
  cdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_lcdf <- function(x, alpha, beta) {
  logcdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_quantile <- function(p, alpha, beta) {
  quantile(beta_distribution(alpha, beta), p)
}
