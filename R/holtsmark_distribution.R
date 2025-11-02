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
#' # Holtsmark distribution with location 0 and scale 1
#' dist <- holtsmark_distribution(0, 1)
#' # Apply generic functions
#' cdf(dist, 0.5)
#' logcdf(dist, 0.5)
#' pdf(dist, 0.5)
#' logpdf(dist, 0.5)
#' hazard(dist, 0.5)
#' chf(dist, 0.5)
#' mean(dist)
#' median(dist)
#' mode(dist)
#' range(dist)
#' quantile(dist, 0.2)
#' standard_deviation(dist)
#' support(dist)
#' variance(dist)
#'
#' # Convenience functions
#' holtsmark_pdf(3)
#' holtsmark_lpdf(3)
#' holtsmark_cdf(3)
#' holtsmark_lcdf(3)
#' holtsmark_quantile(0.5)
NULL

#' @rdname holtsmark_distribution
#' @export
holtsmark_distribution <- function(location = 0, scale = 1) {
  structure(
    list(
      extptr = .Call(`holtsmark_init_`, location, scale),
      location = location,
      scale = scale
    ),
    class = c("holtsmark_distribution", "boost_distribution")
  )
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_pdf <- function(x, location = 0, scale = 1) {
  pdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_lpdf <- function(x, location = 0, scale = 1) {
  logpdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_cdf <- function(x, location = 0, scale = 1) {
  cdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_lcdf <- function(x, location = 0, scale = 1) {
  logcdf(holtsmark_distribution(location, scale), x)
}

#' @rdname holtsmark_distribution
#' @export
holtsmark_quantile <- function(p, location = 0, scale = 1) {
  quantile(holtsmark_distribution(location, scale), p)
}
