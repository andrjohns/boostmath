#' @title Rayleigh Distribution Functions
#' @name rayleigh_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Rayleigh distribution.
#' @param x quantile
#' @param sigma scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/rayleigh.html) for more details on the mathematical background.
#' @examples
#' # Rayleigh distribution with sigma = 1
#' rayleigh_pdf(1)
#' rayleigh_lpdf(1)
#' rayleigh_cdf(1)
#' rayleigh_lcdf(1)
#' rayleigh_quantile(0.5)
NULL

#' @export
rayleigh_distribution <- function(sigma = 1) {
  structure(
    list(
      extptr = .Call(`rayleigh_init_`, sigma),
      sigma = sigma
    ),
    class = c("rayleigh_distribution", "boost_distribution")
  )
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_pdf <- function(x, sigma = 1) {
  pdf(rayleigh_distribution(sigma), x)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_lpdf <- function(x, sigma = 1) {
  logpdf(rayleigh_distribution(sigma), x)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_cdf <- function(x, sigma = 1) {
  cdf(rayleigh_distribution(sigma), x)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_lcdf <- function(x, sigma = 1) {
  logcdf(rayleigh_distribution(sigma), x)
}

#' @rdname rayleigh_distribution
#' @export
rayleigh_quantile <- function(p, sigma = 1) {
  quantile(rayleigh_distribution(sigma), p)
}
