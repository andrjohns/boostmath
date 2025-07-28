#' @title Map-Airy Distribution Functions
#' @name mapairy_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Map-Airy distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/mapairy_dist.html) for more details on the mathematical background.
#' @examples
#' # Distribution only available with Boost version 1.87.0 or later.
#' \dontrun{
#' # Map-Airy distribution with location 0 and scale 1
#'   mapairy_pdf(3)
#'   mapairy_lpdf(3)
#'   mapairy_cdf(3)
#'   mapairy_lcdf(3)
#'   mapairy_quantile(0.5)
#' }
NULL

#' @rdname mapairy_distribution
#' @export
mapairy_pdf <- function(x, location = 0, scale = 1) {
  .Call(`mapairy_pdf_`, x, location, scale)
}

#' @rdname mapairy_distribution
#' @export
mapairy_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`mapairy_logpdf_`, x, location, scale)
}

#' @rdname mapairy_distribution
#' @export
mapairy_cdf <- function(x, location = 0, scale = 1) {
  .Call(`mapairy_cdf_`, x, location, scale)
}

#' @rdname mapairy_distribution
#' @export
mapairy_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`mapairy_logcdf_`, x, location, scale)
}

#' @rdname mapairy_distribution
#' @export
mapairy_quantile <- function(p, location = 0, scale = 1) {
  .Call(`mapairy_quantile_`, p, location, scale)
}
