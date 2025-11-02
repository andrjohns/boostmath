#' @title Beta Distribution Functions
#' @name beta_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Beta distribution.
#' @param x quantile (0 <= x <= 1)
#' @param alpha shape parameter (alpha > 0)
#' @param beta shape parameter (beta > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/beta_dist.html) for more details on the mathematical background.
#' @examples
#' # Beta distribution with shape parameters alpha = 2, beta = 5
#' beta_pdf(0.5, 2, 5)
#' beta_lpdf(0.5, 2, 5)
#' beta_cdf(0.5, 2, 5)
#' beta_lcdf(0.5, 2, 5)
#' beta_quantile(0.5, 2, 5)
NULL

#' @export
beta_distribution <- function(alpha, beta) {
  structure(
    list(
      extptr = .Call(`beta_init_`, alpha, beta),
      alpha = alpha,
      beta = beta
    ),
    class = c("beta_distribution", "boost_distribution")
  )
}

#' @rdname beta_distribution
#' @export
beta_pdf <- function(x, alpha, beta) {
  pdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_lpdf <- function(x, alpha, beta) {
  logpdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_cdf <- function(x, alpha, beta) {
  cdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_lcdf <- function(x, alpha, beta) {
  logcdf(beta_distribution(alpha, beta), x)
}

#' @rdname beta_distribution
#' @export
beta_quantile <- function(p, alpha, beta) {
  quantile(beta_distribution(alpha, beta), p)
}
