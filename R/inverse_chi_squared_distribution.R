#' @title Inverse Chi-Squared Distribution Functions
#' @name inverse_chi_squared_distribution
#' @description
#' Functions to compute the probability density function, cumulative distribution
#' function, and quantile function for the Inverse Chi-Squared distribution.
#'
#' For degrees of freedom \deqn{\nu} and scale \deqn{\xi}, the PDF is
#'
#' \deqn{f(x;\nu,\xi) = \frac{(\nu\xi/2)^{\nu/2}}{\Gamma(\nu/2)} x^{-1-\nu/2} \exp\left(-\frac{\nu\xi}{2x}\right)}
#'
#' and the CDF is \deqn{F(x)=\Gamma(\nu/2,\nu\xi/2x)/\Gamma(\nu/2)}. The unscaled case
#' corresponds to \deqn{\xi = 1/\nu}.
#'
#' **Accuracy and Implementation Notes:**
#' Implemented via incomplete gamma functions (`gamma_p`, `gamma_q`) and their inverses.
#' Results are typically accurate to a few epsilons in double precision. Moments such as
#' mean/variance/skewness are only defined for sufficiently large \deqn{\nu}.
#'
#' @param x Quantile value (x ≥ 0).
#' @param df Degrees of freedom (df > 0; default is 1).
#' @param scale Scale parameter (default is 1/df).
#' @param p Probability (0 ≤ p ≤ 1).
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_chi_squared_dist.html) for more details on the mathematical background.
#' @examples
#' # Inverse Chi-Squared distribution with 10 degrees of freedom, scale = 1
#' dist <- inverse_chi_squared_distribution(10, 1)
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
#' inverse_chi_squared_pdf(2, 10, 1)
#' inverse_chi_squared_lpdf(2, 10, 1)
#' inverse_chi_squared_cdf(2, 10, 1)
#' inverse_chi_squared_lcdf(2, 10, 1)
#' inverse_chi_squared_quantile(0.5, 10, 1)
NULL

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_distribution <- function(df = 1, scale = 1 / df) {
  structure(
    list(
      extptr = .Call(`inverse_chi_squared_init_`, df, scale),
      degrees_of_freedom = df,
      scale = scale
    ),
    class = c("inverse_chi_squared_distribution", "boost_distribution")
  )
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_pdf <- function(x, df = 1, scale = 1 / df) {
  pdf(inverse_chi_squared_distribution(df, scale), x)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_lpdf <- function(x, df = 1, scale = 1 / df) {
  logpdf(inverse_chi_squared_distribution(df, scale), x)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_cdf <- function(x, df = 1, scale = 1 / df) {
  cdf(inverse_chi_squared_distribution(df, scale), x)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_lcdf <- function(x, df = 1, scale = 1 / df) {
  logcdf(inverse_chi_squared_distribution(df, scale), x)
}

#' @rdname inverse_chi_squared_distribution
#' @export
inverse_chi_squared_quantile <- function(p, df = 1, scale = 1 / df) {
  quantile(inverse_chi_squared_distribution(df, scale), p)
}
