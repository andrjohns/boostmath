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
#' # Distribution only available with Boost version 1.87.0 or later.
#' \dontrun{
#' # Holtsmark distribution with location 0 and scale 1
#'   holtsmark_pdf(3)
#'   holtsmark_lpdf(3)
#'   holtsmark_cdf(3)
#'   holtsmark_lcdf(3)
#'   holtsmark_quantile(0.5)
#' }
NULL

#' @rdname holtsmark_distribution
#' @export
holtsmark_pdf <- function(x, location = 0, scale = 1) {
  .Call(`holtsmark_pdf_`, x, location, scale)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`holtsmark_logpdf_`, x, location, scale)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_cdf <- function(x, location = 0, scale = 1) {
  .Call(`holtsmark_cdf_`, x, location, scale)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`holtsmark_logcdf_`, x, location, scale)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_quantile <- function(p, location = 0, scale = 1) {
  .Call(`holtsmark_quantile_`, p, location, scale)
}
