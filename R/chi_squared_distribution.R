#' @title Chi-Squared Distribution Functions
#' @name chi_squared_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Chi-Squared distribution.
#' @param x quantile
#' @param df degrees of freedom (df > 0)
#' @param p probability (0 <= p <= 1)
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
