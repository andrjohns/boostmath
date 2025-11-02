#' @title Noncentral F Distribution Functions
#' @name non_central_f_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Fisher F distribution.
#' @param x quantile
#' @param df1 degrees of freedom for the numerator (df1 > 0)
#' @param df2 degrees of freedom for the denominator (df2 > 0)
#' @param lambda noncentrality parameter (lambda >= 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/f_dist.html) for more details on the mathematical background.
#' @examples
#' # Noncentral F distribution with df1 = 10, df2 = 10 and noncentrality
#' # parameter 1
#' dist <- non_central_f_distribution(10, 10, 1)
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
#' non_central_f_pdf(1, 5, 2, 1)
#' non_central_f_lpdf(1, 5, 2, 1)
#' non_central_f_cdf(1, 5, 2, 1)
#' non_central_f_lcdf(1, 5, 2, 1)
#' non_central_f_quantile(0.5, 5, 2, 1)
NULL

#' @rdname non_central_f_distribution
#' @export
non_central_f_distribution <- function(df1, df2, lambda) {
  structure(
    list(
      extptr = .Call(`non_central_f_init_`, df1, df2, lambda),
      degrees_of_freedom1 = df1,
      degrees_of_freedom2 = df2,
      non_centrality = lambda
    ),
    class = c("non_central_f_distribution", "boost_distribution")
  )
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_pdf <- function(x, df1, df2, lambda) {
  pdf(non_central_f_distribution(df1, df2, lambda), x)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_lpdf <- function(x, df1, df2, lambda) {
  logpdf(non_central_f_distribution(df1, df2, lambda), x)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_cdf <- function(x, df1, df2, lambda) {
  cdf(non_central_f_distribution(df1, df2, lambda), x)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_lcdf <- function(x, df1, df2, lambda) {
  logcdf(non_central_f_distribution(df1, df2, lambda), x)
}

#' @rdname non_central_f_distribution
#' @export
non_central_f_quantile <- function(p, df1, df2, lambda) {
  quantile(non_central_f_distribution(df1, df2, lambda), p)
}
