#' @title Pareto Distribution Functions
#' @name pareto_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Pareto distribution.
#' @param x quantile
#' @param scale scale parameter (default is 1)
#' @param shape shape parameter (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/pareto.html) for more details on the mathematical background.
#' @examples
#' # Pareto distribution with shape = 1, scale = 1
#' pareto_pdf(1)
#' pareto_lpdf(1)
#' pareto_cdf(1)
#' pareto_lcdf(1)
#' pareto_quantile(0.5)
NULL

#' @export
pareto_distribution <- function(scale = 1, shape = 1) {
  structure(
    list(
      extptr = .Call(`pareto_init_`, scale, shape),
      scale = scale,
      shape = shape
    ),
    class = c("pareto_distribution", "boost_distribution")
  )
}

#' @rdname pareto_distribution
#' @export
pareto_pdf <- function(x, scale = 1, shape = 1) {
  pdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_lpdf <- function(x, scale = 1, shape = 1) {
  logpdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_cdf <- function(x, scale = 1, shape = 1) {
  cdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_lcdf <- function(x, scale = 1, shape = 1) {
  logcdf(pareto_distribution(scale, shape), x)
}

#' @rdname pareto_distribution
#' @export
pareto_quantile <- function(p, scale = 1, shape = 1) {
  quantile(pareto_distribution(scale, shape), p)
}
