#' @title Pareto Distribution Functions
#' @name pareto_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Pareto distribution.
#' @param x quantile
#' @param scale scale parameter (default is 1)
#' @param shape shape parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/pareto.html) for more details on the mathematical background.
#' @examples
#' # Pareto distribution with scale = 10, shape = 5
#' dist <- pareto_distribution(10, 5)
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
#' pareto_pdf(1)
#' pareto_lpdf(1)
#' pareto_cdf(1)
#' pareto_lcdf(1)
#' pareto_quantile(0.5)
NULL

#' @rdname pareto_distribution
#' @export
pareto_distribution <- function(scale = 1, shape = 1) {
  structure(
    list(
      extptr = .Call(`pareto_init_`, scale, shape),
      scale = scale,
      shape = shape
    ),
    class = c("pareto_distribution", "boost_distribution")
  )
}

#' @rdname pareto_distribution
#' @export
pareto_pdf <- function(x, scale = 1, shape = 1) {
  pdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_lpdf <- function(x, scale = 1, shape = 1) {
  logpdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_cdf <- function(x, scale = 1, shape = 1) {
  cdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_lcdf <- function(x, scale = 1, shape = 1) {
  logcdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_quantile <- function(p, scale = 1, shape = 1) {
  quantile(pareto_distribution(scale, shape), p)
}
