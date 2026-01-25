#' @title Arcsine Distribution Functions
#' @name arcsine_distribution
#' @description
#' Functions to compute the probability density function, cumulative distribution function,
#' and quantile function for the arcsine distribution on the interval \deqn{[x_{min}, x_{max}]}.
#'
#' The arcsine distribution is a U-shaped distribution with infinite density at the
#' endpoints. For \deqn{x_{min} < x < x_{max}}, the PDF is
#'
#' \deqn{f(x; x_{min}, x_{max}) = \frac{1}{\pi\sqrt{(x - x_{min})(x_{max} - x)}}}
#'
#' and the CDF is
#'
#' \deqn{F(x) = \frac{2}{\pi}\arcsin\left(\sqrt{\frac{x - x_{min}}{x_{max} - x_{min}}}\right)}.
#'
#' The quantile for $0 < p < 1$ is
#'
#' \deqn{Q(p) = x_{min} + (x_{max} - x_{min})\sin^2\left(\frac{\pi p}{2}\right)}.
#'
#' For the standard distribution on \eqn{[0, 1]}, these reduce to
#' #' \deqn{f(x) = 1/(\pi\sqrt{x(1-x)})$ and $F(x) = \frac{2}{\pi}\arcsin(\sqrt{x})}.
#'
#' **Accuracy and Implementation Notes:**
#' The implementation relies on square roots and inverse trigonometric functions that
#' are typically accurate to a few machine epsilons. However, for values of $x$ close to
#' \deqn{x_{max}}, direct evaluation can suffer loss of significance. For improved accuracy
#' in the upper tail, use the complementary CDF or complementary quantile when available
#' (see the Boost documentation on complements).
#'
#' @param x Quantile value in \eqn{[x_{min}, x_{max}]}.
#' @param p Probability in \eqn{[0, 1]}.
#' @param x_min Minimum value of the distribution (default is 0).
#' @param x_max Maximum value of the distribution (default is 1).
#' @return A single numeric value with the computed probability density, log-probability
#' density, cumulative distribution, log-cumulative distribution, or quantile depending
#' on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/arcine_dist.html)
#' for more details on the mathematical background.
#' @examples
#' # Arcsine distribution with default parameters
#' dist <- arcsine_distribution()
#' # Apply generic functions
#' cdf(dist, 0.5)
#' logcdf(dist, 0.5)
#' pdf(dist, 0.5)
#' logpdf(dist, 0.5)
#' hazard(dist, 0.5)
#' chf(dist, 0.5)
#' mean(dist)
#' median(dist)
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
#' arcsine_pdf(0.5)
#' arcsine_lpdf(0.5)
#' arcsine_cdf(0.5)
#' arcsine_lcdf(0.5)
#' arcsine_quantile(0.5)
NULL

#' @rdname arcsine_distribution
#' @export
arcsine_distribution <- function(x_min = 0, x_max = 1) {
  structure(
    list(
      extptr = .Call(`arcsine_init_`, x_min, x_max),
      x_min = x_min,
      x_max = x_max
    ),
    class = c("arcsine_distribution", "boost_distribution")
  )
}

#' @rdname arcsine_distribution
#' @export
arcsine_pdf <- function(x, x_min = 0, x_max = 1) {
  pdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lpdf <- function(x, x_min = 0, x_max = 1) {
  logpdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_cdf <- function(x, x_min = 0, x_max = 1) {
  cdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_lcdf <- function(x, x_min = 0, x_max = 1) {
  logcdf(arcsine_distribution(x_min, x_max), x)
}

#' @rdname arcsine_distribution
#' @export
arcsine_quantile <- function(p, x_min = 0, x_max = 1) {
  quantile(arcsine_distribution(x_min, x_max), p)
}
