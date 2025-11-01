#' @title Binomial Distribution Functions
#' @name binomial_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Binomial distribution.
#' @param k number of successes (0 <= k <= n)
#' @param n number of trials (n >= 0)
#' @param prob probability of success on each trial (0 <= prob <= 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/binomial_dist.html) for more details on the mathematical background.
#' @examples
#' # Binomial dist ribution with n = 10, prob = 0.5
#' binomial_pdf(3, 10, 0.5)
#' binomial_lpdf(3, 10, 0.5)
#' binomial_cdf(3, 10, 0.5)
#' binomial_lcdf(3, 10, 0.5)
#' binomial_quantile(0.5, 10, 0.5)
NULL

#' @export
binomial_distribution <- function(n, prob) {
  structure(
    list(
      extptr = .Call(`binomial_init_`, n, prob),
      n = n,
      prob = prob
    ),
    class = c("binomial_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf binomial_distribution
cdf.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf binomial_distribution
logcdf.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf binomial_distribution
pdf.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf binomial_distribution
logpdf.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard binomial_distribution
hazard.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf binomial_distribution
chf.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean binomial_distribution
mean.binomial_distribution <- function(x, ...) {
  .Call(`binomial_mean_ptr_`, x$extptr)
}

#' @exportS3Method median binomial_distribution
median.binomial_distribution <- function(x, ...) {
  .Call(`binomial_median_ptr_`, x$extptr)
}

#' @exportS3Method mode binomial_distribution
mode.binomial_distribution <- function(x, ...) {
  .Call(`binomial_mode_ptr_`, x$extptr)
}

#' @exportS3Method range binomial_distribution
range.binomial_distribution <- function(x, ...) {
  .Call(`binomial_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile binomial_distribution
quantile.binomial_distribution <- function(x, y, ...) {
  .Call(`binomial_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation binomial_distribution
standard_deviation.binomial_distribution <- function(x, ...) {
  .Call(`binomial_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support binomial_distribution
support.binomial_distribution <- function(x, ...) {
  .Call(`binomial_support_ptr_`, x$extptr)
}

#' @exportS3Method variance binomial_distribution
variance.binomial_distribution <- function(x, ...) {
  .Call(`binomial_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness binomial_distribution
skewness.binomial_distribution <- function(x, ...) {
  .Call(`binomial_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis binomial_distribution
kurtosis.binomial_distribution <- function(x, ...) {
  .Call(`binomial_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess binomial_distribution
kurtosis_excess.binomial_distribution <- function(x, ...) {
  .Call(`binomial_kurtosis_excess_ptr_`, x$extptr)
}

#' @rdname binomial_distribution
#' @export
binomial_pdf <- function(k, n, prob) {
  pdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_lpdf <- function(k, n, prob) {
  logpdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_cdf <- function(k, n, prob) {
  cdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_lcdf <- function(k, n, prob) {
  logcdf(binomial_distribution(n, prob), k)
}

#' @rdname binomial_distribution
#' @export
binomial_quantile <- function(p, n, prob) {
  quantile(binomial_distribution(n, prob), p)
}
