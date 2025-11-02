#' @title Student's T Distribution Functions
#' @name students_t_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Student's t distribution.
#' @param x quantile
#' @param df degrees of freedom (default is 1)
#' @param p probability (0 <= p <= 1)
#' @param difference_from_mean The difference from the assumed nominal mean that is to be detected.
#' @param alpha The acceptable probability of a Type I error (false positive).
#' @param beta The acceptable probability of a Type II error (false negative).
#' @param sd The assumed standard deviation.
#' @param hint An initial guess for the degrees of freedom to start the search from (current sample size is a good start).
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/students_t_dist.html) for more details on the mathematical background.
#' @examples
#' # Student's t distribution with 5 degrees of freedom
#' dist <- students_t_distribution(5)
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
#' students_t_pdf(0, 5)
#' students_t_lpdf(0, 5)
#' students_t_cdf(0, 5)
#' students_t_lcdf(0, 5)
#' students_t_quantile(0.5, 5)
#'
#' # Find degrees of freedom needed to detect a difference from mean of 2.0
#' # with alpha = 0.05 and beta = 0.2 when the standard deviation is 3.0
#' students_t_find_degrees_of_freedom(2.0, 0.05, 0.2, 3.0)
NULL

#' @rdname students_t_distribution
#' @export
students_t_distribution <- function(df = 1) {
  structure(
    list(
      extptr = .Call(`students_t_init_`, df),
      degrees_of_freedom = df
    ),
    class = c("students_t_distribution", "boost_distribution")
  )
}

#' @rdname students_t_distribution
#' @export
students_t_pdf <- function(x, df = 1) {
  pdf(students_t_distribution(df), x)
}

#' @rdname students_t_distribution
#' @export
students_t_lpdf <- function(x, df = 1) {
  logpdf(students_t_distribution(df), x)
}

#' @rdname students_t_distribution
#' @export
students_t_cdf <- function(x, df = 1) {
  cdf(students_t_distribution(df), x)
}

#' @rdname students_t_distribution
#' @export
students_t_lcdf <- function(x, df = 1) {
  logcdf(students_t_distribution(df), x)
}

#' @rdname students_t_distribution
#' @export
students_t_quantile <- function(p, df = 1) {
  quantile(students_t_distribution(df), p)
}

#' @rdname students_t_distribution
#' @export
students_t_find_degrees_of_freedom <- function(difference_from_mean, alpha, beta, sd, hint = 100) {
  .Call(`students_t_find_degrees_of_freedom_`, difference_from_mean, alpha, beta, sd, hint)
}