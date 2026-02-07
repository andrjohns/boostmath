#' @title Normal Distribution Functions
#' @name normal_distribution
#' @description
#' Functions to compute the probability density function, cumulative distribution function, and quantile function for the Normal distribution.
#'
#' The normal distribution is probably the most well known statistical distribution: it is also known as the Gaussian Distribution.
#' A normal distribution with mean zero and standard deviation one is known as the Standard Normal Distribution.
#'
#' Given mean \eqn{\mu} and standard deviation \eqn{\sigma}, it has the PDF:
#' \deqn{f(x;\mu,\sigma) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}}
#'
#' The cumulative distribution function is given by:
#' \deqn{F(x;\mu,\sigma) = \int_{-\infty}^{x} f(t;\mu,\sigma) dt = \frac{1}{2} \text{erfc}\left(\frac{-(x-\mu)}{\sigma\sqrt{2}}\right)}
#'
#' @param x quantile
#' @param mean mean parameter (default is 0)
#' @param sd standard deviation parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/normal_dist.html) for more details on the mathematical background.
#' @examples
#' # Normal distribution with mean = 0, sd = 1
#' dist <- normal_distribution(0, 1)
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
#' normal_pdf(0)
#' normal_lpdf(0)
#' normal_cdf(0)
#' normal_lcdf(0)
#' normal_quantile(0.5)
NULL

#' @rdname normal_distribution
#' @export
normal_distribution <- function(mean = 0, sd = 1) {
  structure(
    list(
      extptr = .Call(`normal_init_`, mean, sd),
      mean = mean,
      standard_deviation = sd
    ),
    class = c("normal_distribution", "boost_distribution")
  )
}

#' @rdname normal_distribution
#' @export
normal_pdf <- function(x, mean = 0, sd = 1) {
  pdf(normal_distribution(mean, sd), x)
}

#' @rdname normal_distribution
#' @export
normal_lpdf <- function(x, mean = 0, sd = 1) {
  logpdf(normal_distribution(mean, sd), x)
}

#' @rdname normal_distribution
#' @export
normal_cdf <- function(x, mean = 0, sd = 1) {
  cdf(normal_distribution(mean, sd), x)
}

#' @rdname normal_distribution
#' @export
normal_lcdf <- function(x, mean = 0, sd = 1) {
  logcdf(normal_distribution(mean, sd), x)
}

#' @rdname normal_distribution
#' @export
normal_quantile <- function(p, mean = 0, sd = 1) {
  quantile(normal_distribution(mean, sd), p)
}
