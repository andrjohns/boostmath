#' @title Triangular Distribution Functions
#' @name triangular_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Triangular distribution.
#' @param x quantile
#' @param lower lower limit of the distribution (default is -1)
#' @param mode mode of the distribution (default is 0)
#' @param upper upper limit of the distribution (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/triangular_dist.html) for more details on the mathematical background.
#' @examples
#' # Triangular distribution with lower = -1, mode = 0, upper = 1
#' dist <- triangular_distribution(-1, 0, 1)
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
#' skewness(dist)
#' kurtosis(dist)
#' kurtosis_excess(dist)
#'
#' # Convenience functions
#' triangular_pdf(1)
#' triangular_lpdf(1)
#' triangular_cdf(1)
#' triangular_lcdf(1)
#' triangular_quantile(0.5)
NULL

#' @rdname triangular_distribution
#' @export
triangular_distribution <- function(lower = -1, mode = 0, upper = 1) {
  structure(
    list(
      extptr = .Call(`triangular_init_`, lower, mode, upper),
      lower = lower,
      mode = mode,
      upper = upper
    ),
    class = c("triangular_distribution", "boost_distribution")
  )
}

#' @rdname triangular_distribution
#' @export
triangular_pdf <- function(x, lower = -1, mode = 0, upper = 1) {
  pdf(triangular_distribution(lower, mode, upper), x)
}

#' @rdname triangular_distribution
#' @export
triangular_lpdf <- function(x, lower = -1, mode = 0, upper = 1) {
  logpdf(triangular_distribution(lower, mode, upper), x)
}

#' @rdname triangular_distribution
#' @export
triangular_cdf <- function(x, lower = -1, mode = 0, upper = 1) {
  cdf(triangular_distribution(lower, mode, upper), x)
}

#' @rdname triangular_distribution
#' @export
triangular_lcdf <- function(x, lower = -1, mode = 0, upper = 1) {
  logcdf(triangular_distribution(lower, mode, upper), x)
}

#' @rdname triangular_distribution
#' @export
triangular_quantile <- function(p, lower = -1, mode = 0, upper = 1) {
  quantile(triangular_distribution(lower, mode, upper), p)
}
