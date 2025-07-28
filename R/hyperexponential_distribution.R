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
#' hyperexponential_pdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_lpdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_cdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_lcdf(2, c(0.5, 0.5), c(1, 2))
#' hyperexponential_quantile(0.5, c(0.5, 0.5), c(1, 2))
NULL

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_pdf <- function(x, probabilities, rates) {
  .Call(`hyperexponential_pdf_`, x, probabilities, rates)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_lpdf <- function(x, probabilities, rates) {
  .Call(`hyperexponential_logpdf_`, x, probabilities, rates)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_cdf <- function(x, probabilities, rates) {
  .Call(`hyperexponential_cdf_`, x, probabilities, rates)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_lcdf <- function(x, probabilities, rates) {
  .Call(`hyperexponential_logcdf_`, x, probabilities, rates)
}

#' @rdname hyperexponential_distribution
#' @export
hyperexponential_quantile <- function(p, probabilities, rates) {
  .Call(`hyperexponential_quantile_`, p, probabilities, rates)
}
