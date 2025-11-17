#' Empirical Cumulative Distribution Function (ECDF)
#'
#' Create an empirical cumulative distribution function (ECDF) from a given vector.
#'
#' @param data A numeric vector of data points.
#' @param sorted A logical indicating whether the data is already sorted. Default is FALSE.
#'
#' @return An object representing the ECDF, with member function `$ecdf(x)` to evaluate the ECDF at point(s) `x`.
#' @examples
#' data <- c(1.2, 2.3, 3.1, 4.5, 5.0)
#' ecdf_obj <- empirical_cumulative_distribution_function(data)
#' ecdf_obj$ecdf(3.0)  # Evaluate ECDF at x = 3.0
#' @export
empirical_cumulative_distribution_function <- function(data, sorted = FALSE) {
  ecdf_ptr <- .Call(`ecdf_create_`, data, sorted)
  structure(
    list(
      ecdf = function(x) { .Call(`ecdf_val_`, ecdf_ptr, x) }
    ),
    class = "empirical_cumulative_distribution_function"
  )
}
