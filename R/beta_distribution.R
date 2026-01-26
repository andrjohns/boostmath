#' @title Beta Distribution Functions
#' @name beta_distribution
#' @description
#' Functions to compute the probability density function, cumulative distribution function,
#' quantile function, and parameter estimators for the Beta distribution.
#'
#' The Beta distribution is defined on \eqn{x \in [0, 1]} with shape parameters
#' \eqn{\alpha > 0} and \eqn{\beta > 0}.
#'
#' The PDF is:
#'
#' \deqn{f(x;\alpha, \beta) = \frac{x^{\alpha - 1}(1-x)^{\beta - 1}}{B(\alpha, \beta)}}
#'
#' Where \eqn{B(\alpha, \beta)} is the beta function.
#'
#' The CDF is:
#'
#' \deqn{F(x; \alpha, \beta) = I_x(\alpha, \beta)}
#'
#' Where \eqn{I_x} is the regularized incomplete beta function.
#'
#' The quantile is:
#'
#' \deqn{F^{-1}(p; \alpha, \beta) = I_{p}^{-1}(\alpha, \beta)}
#'
#' Where \eqn{I_{p}^{-1}} is the inverse of the regularized incomplete beta function.
#'
#' @param x Quantile value (0 ≤ x ≤ 1).
#' @param alpha Shape parameter (alpha > 0).
#' @param beta Shape parameter (beta > 0).
#' @param p Probability (0 ≤ p ≤ 1).
#' @param mean Mean of the Beta distribution.
#' @param variance Variance of the Beta distribution.
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/beta_dist.html) for more details on the mathematical background.
#' @examples
#' # Beta distribution with shape parameters alpha = 2, beta = 5
#' dist <- beta_distribution(2, 5)
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
#' beta_pdf(0.5, 2, 5)
#' beta_lpdf(0.5, 2, 5)
#' beta_cdf(0.5, 2, 5)
#' beta_lcdf(0.5, 2, 5)
#' beta_quantile(0.5, 2, 5)
#'
#' \dontrun{
#' # Find alpha given mean and variance
#' beta_find_alpha(mean = 0.3, variance = 0.02)
#' # Find alpha given beta, x, and probability
#' beta_find_alpha(beta = 5, x = 0.4, p = 0.6)
#' # Find beta given mean and variance
#' beta_find_beta(mean = 0.3, variance = 0.02)
#' # Find beta given alpha, x, and probability
#' beta_find_beta(alpha = 2, x = 0.4, p = 0.6)
#' }
NULL

#' @rdname beta_distribution
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

#' @rdname beta_distribution
#' @export
beta_find_alpha <- function(mean = NULL, variance = NULL, beta = NULL, x = NULL, p = NULL) {
  if (!is.null(mean) && !is.null(variance)) {
    if (!is.null(beta) || !is.null(x) || !is.null(p)) {
      stop("Provide either mean and variance, or beta, x, and probability.")
    }
    return(.Call(`beta_find_alpha_meanvar_`, mean, variance))
  } else if (!is.null(beta) && !is.null(x) && !is.null(p)) {
    return(.Call(`beta_find_alpha_betax_`, beta, x, p))
  } else {
    stop("Invalid arguments. Provide either (mean, variance) or (beta, x, probability).")
  }
}

#' @rdname beta_distribution
#' @export
beta_find_beta <- function(mean = NULL, variance = NULL, alpha = NULL, x = NULL, p = NULL) {
  if (!is.null(mean) && !is.null(variance)) {
    if (!is.null(alpha) || !is.null(x) || !is.null(p)) {
      stop("Provide either mean and variance, or alpha, x, and probability.")
    }
    return(.Call(`beta_find_beta_meanvar_`, mean, variance))
  } else if (!is.null(alpha) && !is.null(x) && !is.null(p)) {
    return(.Call(`beta_find_beta_betax_`, alpha, x, p))
  } else {
    stop("Invalid arguments. Provide either (mean, variance) or (alpha, x, probability).")
  }
}
