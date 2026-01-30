#' @title Filters
#' @name filters
#' @description
#' Functions to compute Daubechies scaling and wavelet filter coefficients.
#'
#' The returned coefficients correspond to the compactly supported Daubechies
#' wavelets indexed by the number of vanishing moments $p$, returning $2p$ taps.
#'
#' **Conventions:**
#' Boost indexes filters by vanishing moments (as in PyWavelets and Mathematica),
#' normalizes coefficients to unit \eqn{\ell_2} norm, and uses the convolutional ordering
#' shown in Daubechies (1988). Other libraries may index by number of taps, use a
#' \eqn{\sqrt{2}} scaling, or reverse coefficient order.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/daubechies_filters.html)
#' for more details on the mathematical background.
#' @param order An integer specifying the number of vanishing moments (1 to 19).
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
