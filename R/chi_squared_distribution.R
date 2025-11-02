#' @title Chi-Squared Distribution Functions
#' @name chi_squared_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Chi-Squared distribution.
#' @param x quantile
#' @param df degrees of freedom (df > 0)
#' @param p probability (0 <= p <= 1)
#' @param difference_from_variance The difference from the assumed nominal variance that is to be detected: Note that the sign of this value is critical (see the documentation for more details).
#' @param alpha The acceptable probability of a Type I error (false positive).
#' @param beta The acceptable probability of a Type II error (false negative).
#' @param variance The assumed nominal variance.
#' @param hint An initial guess for the degrees of freedom to start the search from (current sample size is a good start).
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/chi_squared_dist.html) for more details on the mathematical background.
#' @examples
#' # Chi-Squared distribution with 3 degrees of freedom
#' dist <- chi_squared_distribution(3)
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
#' chi_squared_pdf(2, 3)
#' chi_squared_lpdf(2, 3)
#' chi_squared_cdf(2, 3)
#' chi_squared_lcdf(2, 3)
#' chi_squared_quantile(0.5, 3)
#'
#' # Find degrees of freedom needed to detect a difference from variance of 2.0
#' # with alpha = 0.05 and beta = 0.2 when the nominal variance is 5.0
#' chi_squared_find_degrees_of_freedom(2.0, 0.05, 0.2, 5.0)
NULL

#' @rdname chi_squared_distribution
#' @export
chi_squared_distribution <- function(df) {
  structure(
    list(
      extptr = .Call(`chi_squared_init_`, df),
      degrees_of_freedom = df
    ),
    class = c("chi_squared_distribution", "boost_distribution")
  )
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_pdf <- function(x, df) {
  pdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_lpdf <- function(x, df) {
  logpdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_cdf <- function(x, df) {
  cdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_lcdf <- function(x, df) {
  logcdf(chi_squared_distribution(df), x)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_quantile <- function(p, df) {
  quantile(chi_squared_distribution(df), p)
}

#' @rdname chi_squared_distribution
#' @export
chi_squared_find_degrees_of_freedom <- function(difference_from_variance, alpha, beta, variance, hint = 100) {
  .Call(`chi_squared_find_degrees_of_freedom_`, difference_from_variance, alpha, beta, variance, hint)
}
