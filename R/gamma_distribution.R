#' @title Gamma Distribution Functions
#' @name gamma_distribution
#' @description
#' Functions to compute the probability density function, cumulative distribution
#' function, and quantile function for the Gamma distribution.
#'
#' With shape $k>0$ and scale \deqn{\theta>0}, the PDF is
#'
#' \deqn{f(x) = \frac{1}{\Gamma(k)\,\theta^k} x^{k-1} e^{-x/\theta}, \quad x \ge 0}
#'
#' and the CDF is \deqn{P(k, x/\theta)}, the regularised incomplete gamma function. The
#' quantile is computed via inverse incomplete gamma functions. When $k$ is an integer,
#' this is the Erlang distribution; Boost uses the shape/scale parameterization.
#'
#' **Accuracy and Implementation Notes:**
#' Implemented in terms of incomplete gamma functions (`gamma_p`, `gamma_q`) and their
#' inverses. The PDF uses `gamma_p_derivative(k, x/\theta)/\theta`, and `logpdf` is
#' specialised for improved accuracy.
#'
#' @param x Quantile value (x >= 0).
#' @param shape Shape parameter (shape > 0).
#' @param scale Scale parameter (scale > 0).
#' @param p Probability (0 <= p <= 1).
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/gamma_dist.html) for more details on the mathematical background.
#' @examples
#' # Gamma distribution with shape = 3, scale = 4
#' dist <- gamma_distribution(3, 4)
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
#' gamma_pdf(2, 3, 4)
#' gamma_lpdf(2, 3, 4)
#' gamma_cdf(2, 3, 4)
#' gamma_lcdf(2, 3, 4)
#' gamma_quantile(0.5, 3, 4)
NULL

#' @rdname gamma_distribution
#' @export
gamma_distribution <- function(shape, scale = 1) {
  structure(
    list(
      extptr = .Call(`gamma_init_`, shape, scale),
      shape = shape,
      scale = scale
    ),
    class = c("gamma_distribution", "boost_distribution")
  )
}

#' @rdname gamma_distribution
#' @export
gamma_pdf <- function(x, shape, scale = 1) {
  pdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_lpdf <- function(x, shape, scale = 1) {
  logpdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_cdf <- function(x, shape, scale = 1) {
  cdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_lcdf <- function(x, shape, scale = 1) {
  logcdf(gamma_distribution(shape, scale), x)
}

#' @rdname gamma_distribution
#' @export
gamma_quantile <- function(p, shape, scale = 1) {
  quantile(gamma_distribution(shape, scale), p)
}
