#' @title Uniform Distribution Functions
#' @name uniform_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Uniform distribution.
#' @param x quantile
#' @param lower lower bound of the distribution (default is 0)
#' @param upper upper bound of the distribution (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/uniform_dist.html) for more details on the mathematical background.
#' @examples
#' # Uniform distribution with lower = 0, upper = 1
#' dist <- uniform_distribution(0, 1)
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
#' uniform_pdf(0.5)
#' uniform_lpdf(0.5)
#' uniform_cdf(0.5)
#' uniform_lcdf(0.5)
#' uniform_quantile(0.5)
NULL

#' @rdname uniform_distribution
#' @export
uniform_distribution <- function(lower = 0, upper = 1) {
  structure(
    list(
      extptr = .Call(`uniform_init_`, lower, upper),
      lower = lower,
      upper = upper
    ),
    class = c("uniform_distribution", "boost_distribution")
  )
}

#' @rdname uniform_distribution
#' @export
uniform_pdf <- function(x, lower = 0, upper = 1) {
  pdf(uniform_distribution(lower, upper), x)
}

#' @rdname uniform_distribution
#' @export
uniform_lpdf <- function(x, lower = 0, upper = 1) {
  logpdf(uniform_distribution(lower, upper), x)
}

#' @rdname uniform_distribution
#' @export
uniform_cdf <- function(x, lower = 0, upper = 1) {
  cdf(uniform_distribution(lower, upper), x)
}

#' @rdname uniform_distribution
#' @export
uniform_lcdf <- function(x, lower = 0, upper = 1) {
  logcdf(uniform_distribution(lower, upper), x)
}

#' @rdname uniform_distribution
#' @export
uniform_quantile <- function(p, lower = 0, upper = 1) {
  quantile(uniform_distribution(lower, upper), p)
}
