#' @title Fisher F Distribution Functions
#' @name fisher_f_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Fisher F distribution.
#' @param x quantile
#' @param df1 degrees of freedom for the numerator (df1 > 0)
#' @param df2 degrees of freedom for the denominator (df2 > 0)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/f_dist.html) for more details on the mathematical background.
#' @examples
#' # Fisher F distribution with df1 = 5, df2 = 2
#' fisher_f_pdf(1, 5, 2)
#' fisher_f_lpdf(1, 5, 2)
#' fisher_f_cdf(1, 5, 2)
#' fisher_f_lcdf(1, 5, 2)
#' fisher_f_quantile(0.5, 5, 2)
NULL

#' @export
fisher_f_distribution <- function(df1, df2) {
  structure(
    list(
      extptr = .Call(`fisher_f_init_`, df1, df2),
      degrees_of_freedom1 = df1,
      degrees_of_freedom2 = df2
    ),
    class = c("fisher_f_distribution", "boost_distribution")
  )
}

#' @rdname fisher_f_distribution
#' @export
fisher_f_pdf <- function(x, df1, df2) {
  pdf(fisher_f_distribution(df1, df2), x)
}

#' @rdname fisher_f_distribution
#' @export
fisher_f_lpdf <- function(x, df1, df2) {
  logpdf(fisher_f_distribution(df1, df2), x)
}

#' @rdname fisher_f_distribution
#' @export
fisher_f_cdf <- function(x, df1, df2) {
  cdf(fisher_f_distribution(df1, df2), x)
}

#' @rdname fisher_f_distribution
#' @export
fisher_f_lcdf <- function(x, df1, df2) {
  logcdf(fisher_f_distribution(df1, df2), x)
}

#' @rdname fisher_f_distribution
#' @export
fisher_f_quantile <- function(p, df1, df2) {
  quantile(fisher_f_distribution(df1, df2), p)
}
