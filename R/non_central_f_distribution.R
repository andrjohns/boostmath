#' @title Noncentral F Distribution Functions
#' @name non_central_f_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Fisher F distribution.
#' @param x quantile
#' @param df1 degrees of freedom for the numerator (df1 > 0)
#' @param df2 degrees of freedom for the denominator (df2 > 0)
#' @param lambda noncentrality parameter (lambda >= 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/f_dist.html) for more details on the mathematical background.
#' @examples
#' # Noncentral F distribution with df1 = 5, df2 = 2 and noncentrality
#' # parameter 1
#' non_central_f_pdf(1, 5, 2, 1)
#' non_central_f_lpdf(1, 5, 2, 1)
#' non_central_f_cdf(1, 5, 2, 1)
#' non_central_f_lcdf(1, 5, 2, 1)
#' non_central_f_quantile(0.5, 5, 2, 1)
NULL

#' @rdname non_central_f_distribution
#' @export
non_central_f_pdf <- function(x, df1, df2, lambda) {
  .Call(`non_central_f_pdf_`, x, df1, df2, lambda)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_lpdf <- function(x, df1, df2, lambda) {
  .Call(`non_central_f_logpdf_`, x, df1, df2, lambda)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_cdf <- function(x, df1, df2, lambda) {
  .Call(`non_central_f_cdf_`, x, df1, df2, lambda)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_lcdf <- function(x, df1, df2, lambda) {
  .Call(`non_central_f_logcdf_`, x, df1, df2, lambda)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_quantile <- function(p, df1, df2, lambda) {
  .Call(`non_central_f_quantile_`, p, df1, df2, lambda)
}
