#' @title S\eqn{\alpha}S Point5 Distribution Functions
#' @name saspoint5_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the S\eqn{\alpha}S Point5 distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/saspoint5_dist.html) for more details on the mathematical background.
#' @examples
#' # Distribution only available with Boost version 1.87.0 or later.
#' \dontrun{
#' # SaS Point5 distribution with location 0 and scale 1
#'   saspoint5_pdf(3)
#'   saspoint5_lpdf(3)
#'   saspoint5_cdf(3)
#'   saspoint5_lcdf(3)
#'   saspoint5_quantile(0.5)
#' }
NULL

#' @rdname saspoint5_distribution
#' @export
saspoint5_pdf <- function(x, location = 0, scale = 1) {
  .Call(`saspoint5_pdf_`, x, location, scale)
}

#' @rdname saspoint5_distribution
#' @export
saspoint5_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`saspoint5_logpdf_`, x, location, scale)
}

#' @rdname saspoint5_distribution
#' @export
saspoint5_cdf <- function(x, location = 0, scale = 1) {
  .Call(`saspoint5_cdf_`, x, location, scale)
}

#' @rdname saspoint5_distribution
#' @export
saspoint5_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`saspoint5_logcdf_`, x, location, scale)
}

#' @rdname saspoint5_distribution
#' @export
saspoint5_quantile <- function(p, location = 0, scale = 1) {
  .Call(`saspoint5_quantile_`, p, location, scale)
}
