#' @title Hypergeometric Distribution Functions
#' @name hypergeometric_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Hypergeometric distribution.
#' @param x quantile (non-negative integer)
#' @param r number of successes in the population (r >= 0)
#' @param n number of draws (n >= 0)
#' @param N population size (N >= r)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/hypergeometric_dist.html) for more details on the mathematical background.
#' @examples
#' # Hypergeometric distribution with r = 5, n = 10, N = 20
#' hypergeometric_pdf(3, 5, 10, 20)
#' hypergeometric_lpdf(3, 5, 10, 20)
#' hypergeometric_cdf(3, 5, 10, 20)
#' hypergeometric_lcdf(3, 5, 10, 20)
#' hypergeometric_quantile(0.5, 5, 10, 20)
NULL

#' @rdname hypergeometric_distribution
#' @export
hypergeometric_pdf <- function(x, r, n, N) {
  .Call(`hypergeometric_pdf_`, x, r, n, N)
}

#' @rdname hypergeometric_distribution
#' @export
hypergeometric_lpdf <- function(x, r, n, N) {
  .Call(`hypergeometric_logpdf_`, x, r, n, N)
}

#' @rdname hypergeometric_distribution
#' @export
hypergeometric_cdf <- function(x, r, n, N) {
  .Call(`hypergeometric_cdf_`, x, r, n, N)
}

#' @rdname hypergeometric_distribution
#' @export
hypergeometric_lcdf <- function(x, r, n, N) {
  .Call(`hypergeometric_logcdf_`, x, r, n, N)
}

#' @rdname hypergeometric_distribution
#' @export
hypergeometric_quantile <- function(p, r, n, N) {
  .Call(`hypergeometric_quantile_`, p, r, n, N)
}
