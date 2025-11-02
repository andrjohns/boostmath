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
#' # Landau distribution with location 0 and scale 1
#' dist <- landau_distribution(0, 1)
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
#' landau_pdf(3)
#' landau_lpdf(3)
#' landau_cdf(3)
#' landau_lcdf(3)
#' landau_quantile(0.5)
NULL

#' @rdname landau_distribution
#' @export
landau_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`landau_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("landau_distribution", "boost_distribution")
  )
}

#' @rdname landau_distribution
#' @export
landau_pdf <- function(x, location = 0, scale = 1) {
  pdf(landau_distribution(location, scale), x)
}

#' @rdname landau_distribution
#' @export
landau_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(landau_distribution(location, scale), x)
}

#' @rdname landau_distribution
#' @export
landau_cdf <- function(x, location = 0, scale = 1) {
  cdf(landau_distribution(location, scale), x)
}

#' @rdname landau_distribution
#' @export
landau_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(landau_distribution(location, scale), x)
}

#' @rdname landau_distribution
#' @export
landau_quantile <- function(p, location = 0, scale = 1) {
  quantile(landau_distribution(location, scale), p)
}
