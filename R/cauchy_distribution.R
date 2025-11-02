#' @title Cauchy Distribution Functions
#' @name cauchy_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Cauchy distribution.
#' @param x quantile
#' @param location location parameter (default is 0)
#' @param scale scale parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/cauchy_dist.html) for more details on the mathematical background.
#' @examples
#' # Cauchy distribution with location = 0, scale = 1
#' dist <- cauchy_distribution(0, 1)
#' # Apply generic functions
#' cdf(dist, 0.5)
#' logcdf(dist, 0.5)
#' pdf(dist, 0.5)
#' logpdf(dist, 0.5)
#' hazard(dist, 0.5)
#' chf(dist, 0.5)
#' median(dist)
#' mode(dist)
#' range(dist)
#' quantile(dist, 0.2)
#' support(dist)
#'
#' # Convenience functions
#' cauchy_pdf(0)
#' cauchy_lpdf(0)
#' cauchy_cdf(0)
#' cauchy_lcdf(0)
#' cauchy_quantile(0.5)
NULL

#' @rdname cauchy_distribution
#' @export
cauchy_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`cauchy_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("cauchy_distribution", "boost_distribution")
  )
}

#' @rdname cauchy_distribution
#' @export
cauchy_pdf <- function(x, location = 0, scale = 1) {
  pdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_cdf <- function(x, location = 0, scale = 1) {
  cdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(cauchy_distribution(location, scale), x)
}

#' @rdname cauchy_distribution
#' @export
cauchy_quantile <- function(p, location = 0, scale = 1) {
  quantile(cauchy_distribution(location, scale), p)
}
