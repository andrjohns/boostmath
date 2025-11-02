#' @title Hyperexponential Distribution Functions
#' @name hyperexponential_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Hyperexponential distribution.
#' @param x quantile
#' @param probabilities vector of probabilities (sum must be 1)
#' @param rates vector of rates (all rates must be > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/hyperexponential_dist.html) for more details on the mathematical background.
#' @examples
#' # Hyperexponential distribution with probabilities = c(0.5, 0.5) and rates = c(1, 2)
#' dist <- hyperexponential_distribution(c(0.5, 0.5), c(1, 2))
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
#' hyperexponential_pdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_lpdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_cdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_lcdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_quantile(0.5, c(0.5, 0.5), c(1, 2))
NULL

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_distribution <- function(probabilities, rates) {
  structure(
    list(
      extptr = .Call(`hyperexponential_init_`, probabilities, rates),
      probabilities = probabilities,
      rates = rates
    ),
    class = c("hyperexponential_distribution", "boost_distribution")
  )
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_pdf <- function(x, probabilities, rates) {
  pdf(hyperexponential_distribution(probabilities, rates), x)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_lpdf <- function(x, probabilities, rates) {
  logpdf(hyperexponential_distribution(probabilities, rates), x)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_cdf <- function(x, probabilities, rates) {
  cdf(hyperexponential_distribution(probabilities, rates), x)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_lcdf <- function(x, probabilities, rates) {
  logcdf(hyperexponential_distribution(probabilities, rates), x)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_quantile <- function(p, probabilities, rates) {
  quantile(hyperexponential_distribution(probabilities, rates), p)
}
