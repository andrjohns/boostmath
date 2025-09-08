#' @title Filters
#' @name filters
#' @description Functions to compute Daubechies wavelet and scaling filters.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/daubechies_filters.html) for more details on the mathematical background.
#' @param order An integer specifying the order of the Daubechies filter (must be between 1 and 19).
#' @return A numeric vector of size 2*order containing the filter coefficients.
#' @examples
#' # Daubechies Scaling Filter of order 4
#' daubechies_scaling_filter(4)
#' # Daubechies Wavelet Filter of order 4
#' daubechies_wavelet_filter(4)
NULL

#' @rdname filters
#' @export
daubechies_scaling_filter <- function(order) {
  if (!is.numeric(order) || length(order) != 1 || order < 1 || order > 19) {
    stop("Order must be a single integer between 1 and 19.")
  }
  .Call(`daubechies_scaling_filter_`, as.integer(order))
}

#' @rdname filters
#' @export
daubechies_wavelet_filter <- function(order) {
  if (!is.numeric(order) || length(order) != 1 || order < 1 || order > 19) {
    stop("Order must be a single integer between 1 and 19.")
  }
  .Call(`daubechies_wavelet_filter_`, as.integer(order))
}
