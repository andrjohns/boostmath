#' @title Student's T Distribution Functions
#' @name students_t_distribution
#' @description Functions to compute the probability density function, cumulative distribution function, and quantile function for the Student's t distribution.
#' @param x quantile
#' @param df degrees of freedom (default is 1)
#' @param p probability (0 <= p <= 1)
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/students_t_dist.html) for more details on the mathematical background.
#' @examples
#' # Student's t distribution with 3 degrees of freedom
#' students_t_pdf(0, 3)
#' students_t_lpdf(0, 3)
#' students_t_cdf(0, 3)
#' students_t_lcdf(0, 3)
#' students_t_quantile(0.5, 3)
NULL

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
