#' @title Noncentral Beta Distribution Functions
#' @name non_central_beta_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Noncentral Beta distribution.
#' @param x quantile (0 <= x <= 1)
#' @param alpha first shape parameter (alpha > 0)
#' @param beta second shape parameter (beta > 0)
#' @param lambda noncentrality parameter (lambda >= 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_beta_dist.html) for more details on the mathematical background.
#' @examples
#' # Noncentral Beta distribution with shape parameters alpha = 2, beta = 3
#' # and noncentrality parameter lambda = 1
#' dist <- non_central_beta_distribution(2, 3, 1)
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
#' non_central_beta_pdf(0.5, 2, 3, 1)
#' non_central_beta_lpdf(0.5, 2, 3, 1)
#' non_central_beta_cdf(0.5, 2, 3, 1)
#' non_central_beta_lcdf(0.5, 2, 3, 1)
#' non_central_beta_quantile(0.5, 2, 3, 1)
NULL

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_distribution <- function(alpha, beta, lambda) {
  structure(
    list(
      extptr = .Call(`non_central_beta_init_`, alpha, beta, lambda),
      alpha = alpha,
      beta = beta,
      non_centrality = lambda
    ),
    class = c("non_central_beta_distribution", "boost_distribution")
  )
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_pdf <- function(x, alpha, beta, lambda) {
  pdf(non_central_beta_distribution(alpha, beta, lambda), x)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_lpdf <- function(x, alpha, beta, lambda) {
  logpdf(non_central_beta_distribution(alpha, beta, lambda), x)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_cdf <- function(x, alpha, beta, lambda) {
  cdf(non_central_beta_distribution(alpha, beta, lambda), x)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_lcdf <- function(x, alpha, beta, lambda) {
  logcdf(non_central_beta_distribution(alpha, beta, lambda), x)
}

#' @rdname non_central_beta_distribution
#' @export
non_central_beta_quantile <- function(p, alpha, beta, lambda) {
  quantile(non_central_beta_distribution(alpha, beta, lambda), p)
}
