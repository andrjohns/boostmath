#' @title Logistic Distribution Functions
#' @name logistic_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Logistic distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/logistic_dist.html) for more details on the mathematical background.
#' @examples
#' # Logistic distribution with location = 0, scale = 1
#' logistic_pdf(0)
#' logistic_lpdf(0)
#' logistic_cdf(0)
#' logistic_lcdf(0)
#' logistic_quantile(0.5)
NULL

#' @rdname logistic_distribution
#' @export
logistic_pdf <- function(x, location = 0, scale = 1) {
  .Call(`logistic_pdf_`, x, location, scale)
}

#' @rdname logistic_distribution
#' @export
logistic_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`logistic_logpdf_`, x, location, scale)
}

#' @rdname logistic_distribution
#' @export
logistic_cdf <- function(x, location = 0, scale = 1) {
  .Call(`logistic_cdf_`, x, location, scale)
}

#' @rdname logistic_distribution
#' @export
logistic_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`logistic_logcdf_`, x, location, scale)
}

#' @rdname logistic_distribution
#' @export
logistic_quantile <- function(p, location = 0, scale = 1) {
  .Call(`logistic_quantile_`, p, location, scale)
}
