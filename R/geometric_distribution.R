#' @title Geometric Distribution Functions
#' @name geometric_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Geometric distribution.
#' @param x quantile (non-negative integer)
#' @param prob probability of success (0 < prob < 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/geometric_dist.html) for more details on the mathematical background.
#' @examples
#' # Geometric distribution with probability of success prob = 0.5
#' geometric_pdf(3, 0.5)
#' geometric_lpdf(3, 0.5)
#' geometric_cdf(3, 0.5)
#' geometric_lcdf(3, 0.5)
#' geometric_quantile(0.5, 0.5)
NULL

#' @export
geometric_distribution <- function(prob) {
  structure(
    list(
      extptr = .Call(`geometric_init_`, prob),
      prob = prob
    ),
    class = c("geometric_distribution", "boost_distribution")
  )
}

#' @exportS3Method cdf geometric_distribution
cdf.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_cdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logcdf geometric_distribution
logcdf.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_logcdf_ptr_`, x$extptr, y)
}

#' @exportS3Method pdf geometric_distribution
pdf.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_pdf_ptr_`, x$extptr, y)
}

#' @exportS3Method logpdf geometric_distribution
logpdf.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_logpdf_ptr_`, x$extptr, y)
}

#' @exportS3Method hazard geometric_distribution
hazard.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_hazard_ptr_`, x$extptr, y)
}

#' @exportS3Method chf geometric_distribution
chf.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_chf_ptr_`, x$extptr, y)
}

#' @exportS3Method mean geometric_distribution
mean.geometric_distribution <- function(x, ...) {
  .Call(`geometric_mean_ptr_`, x$extptr)
}

#' @exportS3Method median geometric_distribution
median.geometric_distribution <- function(x, ...) {
  .Call(`geometric_median_ptr_`, x$extptr)
}

#' @exportS3Method mode geometric_distribution
mode.geometric_distribution <- function(x, ...) {
  .Call(`geometric_mode_ptr_`, x$extptr)
}

#' @exportS3Method range geometric_distribution
range.geometric_distribution <- function(x, ...) {
  .Call(`geometric_range_ptr_`, x$extptr)
}

#' @exportS3Method quantile geometric_distribution
quantile.geometric_distribution <- function(x, y, ...) {
  .Call(`geometric_quantile_ptr_`, x$extptr, y)
}

#' @exportS3Method standard_deviation geometric_distribution
standard_deviation.geometric_distribution <- function(x, ...) {
  .Call(`geometric_standard_deviation_ptr_`, x$extptr)
}

#' @exportS3Method support geometric_distribution
support.geometric_distribution <- function(x, ...) {
  .Call(`geometric_support_ptr_`, x$extptr)
}

#' @exportS3Method variance geometric_distribution
variance.geometric_distribution <- function(x, ...) {
  .Call(`geometric_variance_ptr_`, x$extptr)
}

#' @exportS3Method skewness geometric_distribution
skewness.geometric_distribution <- function(x, ...) {
  .Call(`geometric_skewness_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis geometric_distribution
kurtosis.geometric_distribution <- function(x, ...) {
  .Call(`geometric_kurtosis_ptr_`, x$extptr)
}

#' @exportS3Method kurtosis_excess geometric_distribution
kurtosis_excess.geometric_distribution <- function(x, ...) {
  .Call(`geometric_kurtosis_excess_ptr_`, x$extptr)
}


#' @rdname geometric_distribution
#' @export
geometric_pdf <- function(x, prob) {
  pdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_lpdf <- function(x, prob) {
  logpdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_cdf <- function(x, prob) {
  cdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_lcdf <- function(x, prob) {
  logcdf(geometric_distribution(prob), x)
}

#' @rdname geometric_distribution
#' @export
geometric_quantile <- function(p, prob) {
  quantile(geometric_distribution(prob), p)
}
