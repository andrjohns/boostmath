#' @title Landau Distribution Functions
#' @name landau_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Landau distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/landau_dist.html) for more details on the mathematical background.
#' @examples
#' # Distribution only available with Boost version 1.87.0 or later.
#' \dontrun{
#' # Landau distribution with location 0 and scale 1
#'   landau_pdf(3)
#'   landau_lpdf(3)
#'   landau_cdf(3)
#'   landau_lcdf(3)
#'   landau_quantile(0.5)
#' }
NULL

#' @rdname landau_distribution
#' @export
landau_pdf <- function(x, location = 0, scale = 1) {
  .Call(`landau_pdf_`, x, location, scale)
}

#' @rdname landau_distribution
#' @export
landau_lpdf <- function(x, location = 0, scale = 1) {
  .Call(`landau_logpdf_`, x, location, scale)
}

#' @rdname landau_distribution
#' @export
landau_cdf <- function(x, location = 0, scale = 1) {
  .Call(`landau_cdf_`, x, location, scale)
}

#' @rdname landau_distribution
#' @export
landau_lcdf <- function(x, location = 0, scale = 1) {
  .Call(`landau_logcdf_`, x, location, scale)
}

#' @rdname landau_distribution
#' @export
landau_quantile <- function(p, location = 0, scale = 1) {
  .Call(`landau_quantile_`, p, location, scale)
}
