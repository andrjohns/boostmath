#' @title Bernoulli Distribution Functions
#' @name bernoulli_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Bernoulli distribution.
#' @param x quantile (0 or 1)
#' @param p_success probability of success (0 <= p_success <= 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/bernoulli_dist.html) for more details on the mathematical background.
#' @examples
#' bernoulli_pdf(1, 0.5)
#' bernoulli_lpdf(1, 0.5)
#' bernoulli_cdf(1, 0.5)
#' bernoulli_lcdf(1, 0.5)
#' bernoulli_quantile(0.5, 0.5)
NULL

#' @export
bernoulli_distribution <- function(p_success) {
  structure(
    list(
      extptr = .Call(`binomial_init_`, 1, p_success),
      success_fraction = p_success
    ),
    class = c("bernoulli_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf bernoulli_distribution
cdf.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf bernoulli_distribution
logcdf.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf bernoulli_distribution
pdf.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf bernoulli_distribution
logpdf.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard bernoulli_distribution
hazard.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf bernoulli_distribution
chf.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean bernoulli_distribution
mean.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_mean_ptr_`, x$extptr)
}

#' @exportS3Method median bernoulli_distribution
median.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_median_ptr_`, x$extptr)
}

#' @exportS3Method mode bernoulli_distribution
mode.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_mode_ptr_`, x$extptr)
}

#' @exportS3Method range bernoulli_distribution
range.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile bernoulli_distribution
quantile.bernoulli_distribution <- function(x, y, ...) {
  .Call(`binomial_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation bernoulli_distribution
standard_deviation.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support bernoulli_distribution
support.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_support_ptr_`, x$extptr)
}

#' @exportS3Method variance bernoulli_distribution
variance.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness bernoulli_distribution
skewness.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis bernoulli_distribution
kurtosis.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess bernoulli_distribution
kurtosis_excess.bernoulli_distribution <- function(x, ...) {
  .Call(`binomial_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_pdf <- function(x, p_success) {
  pdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_lpdf <- function(x, p_success) {
  logpdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_cdf <- function(x, p_success) {
  cdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_lcdf <- function(x, p_success) {
  logcdf(bernoulli_distribution(p_success), x)
}

#' @rdname bernoulli_distribution
#' @export
bernoulli_quantile <- function(p, p_success) {
  quantile(bernoulli_distribution(p_success), p)
}
