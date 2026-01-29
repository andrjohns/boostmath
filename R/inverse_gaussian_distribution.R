#' @title Inverse Gaussian Distribution Functions
#' @name inverse_gaussian_distribution
#' @description
#' Functions to compute the probability density function, cumulative distribution
#' function, and quantile function for the Inverse Gaussian (Inverse Normal) distribution.
#'
#' With mean \deqn{\mu} and scale \deqn{\lambda}, the PDF is
#'
#' \deqn{f(x;\mu,\lambda) = \sqrt{\frac{\lambda}{2\pi x^3}}\exp\left(-\frac{\lambda(x-\mu)^2}{2\mu^2 x}\right)}
#'
#' and the CDF is
#'
#' \deqn{F(x) = \Phi\left(\sqrt{\frac{\lambda}{x}}\left(\frac{x}{\mu}-1\right)\right) +
#' \exp\left(\frac{2\lambda}{\mu}\right)\Phi\left(-\sqrt{\frac{\lambda}{x}}\left(\frac{x}{\mu}+1\right)\right)}
#'
#' where \deqn{\Phi} is the standard normal CDF.
#'
#' **Accuracy and Implementation Notes:**
#' Implemented using the standard normal distribution and the exponential function.
#' `logpdf` is specialized for numerical accuracy. Quantiles have no closed form and
#' are computed via Newton–Raphson refinement.
#'
#' @param x Quantile value (x ≥ 0).
#' @param mu Mean parameter (mu > 0; default is 1).
#' @param lambda Scale parameter (lambda > 0; default is 1).
#' @param p Probability (0 ≤ p ≤ 1).
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gaussian_dist.html) for more details on the mathematical background.
#' @examples
#' # Inverse Gaussian distribution with mu = 3, lambda = 4
#' dist <- inverse_gaussian_distribution(3, 4)
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
#' inverse_gaussian_pdf(2, 3, 4)
#' inverse_gaussian_lpdf(2, 3, 4)
#' inverse_gaussian_cdf(2, 3, 4)
#' inverse_gaussian_lcdf(2, 3, 4)
#' inverse_gaussian_quantile(0.5, 3, 4)
NULL

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_distribution <- function(mu = 1, lambda = 1) {
  structure(
    list(
      extptr = .Call(`inverse_gaussian_init_`, mu, lambda),
      mean = mu,
      scale = lambda,
      shape = lambda / mu
    ),
    class = c("inverse_gaussian_distribution", "boost_distribution")
  )
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_pdf <- function(x, mu = 1, lambda = 1) {
  pdf(inverse_gaussian_distribution(mu, lambda), x)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_lpdf <- function(x, mu = 1, lambda = 1) {
  logpdf(inverse_gaussian_distribution(mu, lambda), x)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_cdf <- function(x, mu = 1, lambda = 1) {
  cdf(inverse_gaussian_distribution(mu, lambda), x)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_lcdf <- function(x, mu = 1, lambda = 1) {
  logcdf(inverse_gaussian_distribution(mu, lambda), x)
}

#' @rdname inverse_gaussian_distribution
#' @export
inverse_gaussian_quantile <- function(p, mu = 1, lambda = 1) {
  quantile(inverse_gaussian_distribution(mu, lambda), p)
}
