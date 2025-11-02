#' @title Kolmogorov-Smirnov Distribution Functions
#' @name kolmogorov_smirnov_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Kolmogorov-Smirnov distribution.
#' @param x quantile
#' @param n sample size (n > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/kolmogorov_smirnov_dist.html) for more details on the mathematical background.
#' @examples
#' # Kolmogorov-Smirnov distribution with sample size n = 10
#' dist <- kolmogorov_smirnov_distribution(10)
#' # Apply generic functions
#' cdf(dist, 2)
#' logcdf(dist, 2)
#' pdf(dist, 2)
#' logpdf(dist, 2)
#' hazard(dist, 2)
#' chf(dist, 2)
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
#' kolmogorov_smirnov_pdf(0.5, 10)
#' kolmogorov_smirnov_lpdf(0.5, 10)
#' kolmogorov_smirnov_cdf(0.5, 10)
#' kolmogorov_smirnov_lcdf(0.5, 10)
#' kolmogorov_smirnov_quantile(0.5, 10)
NULL

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_distribution <- function(n) {
  structure(
    list(
      extptr = .Call(`kolmogorov_smirnov_init_`, n),
      number_of_observations = n
    ),
    class = c("kolmogorov_smirnov_distribution", "boost_distribution")
  )
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_pdf <- function(x, n) {
  pdf(kolmogorov_smirnov_distribution(n), x)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_lpdf <- function(x, n) {
  logpdf(kolmogorov_smirnov_distribution(n), x)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_cdf <- function(x, n) {
  cdf(kolmogorov_smirnov_distribution(n), x)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_lcdf <- function(x, n) {
  logcdf(kolmogorov_smirnov_distribution(n), x)
}

#' @rdname kolmogorov_smirnov_distribution
#' @export
kolmogorov_smirnov_quantile <- function(p, n) {
  quantile(kolmogorov_smirnov_distribution(n), p)
}
