#' @title Sinus Cardinal and Hyperbolic Sinus Cardinal Functions
#' @name sinus_cardinal_hyperbolic_functions
#' @description
#' Functions to compute the sinus cardinal (sinc) and hyperbolic sinus cardinal (sinhc) functions.
#'
#' These functions appear in signal processing, Fourier analysis, and various mathematical
#' applications. The implementations avoid numerical instability near x = 0.
#'
#' **Sinus Cardinal Function:**
#'
#' The sinc function is defined as:
#' \deqn{sinc(\pi x) = \frac{\sin(\pi x)}{\pi x}}
#'
#' * `sinc_pi(x)`: Computes sinc(πx) = sin(πx)/(πx)
#' * Special value: sinc_pi(0) = 1 (by L'Hôpital's rule or Taylor series)
#' * The function oscillates with decreasing amplitude as |x| increases
#' * Used extensively in signal processing (ideal low-pass filter impulse response)
#' * Appears in the Whittaker-Shannon interpolation formula
#'
#' **Hyperbolic Sinus Cardinal Function:**
#'
#' The hyperbolic sinc function is defined as:
#' \deqn{sinhc(\pi x) = \frac{\sinh(\pi x)}{\pi x}}
#'
#' * `sinhc_pi(x)`: Computes sinhc(πx) = sinh(πx)/(πx)
#' * Special value: sinhc_pi(0) = 1 (by L'Hôpital's rule or Taylor series)
#' * The function grows exponentially for large |x|
#' * Analogous to sinc but using hyperbolic sine instead of circular sine
#'
#' **Numerical Stability:**
#'
#' Both functions use Taylor series expansions near x = 0 to avoid division by zero
#' and loss of precision. For x away from 0, direct evaluation is used.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sinc.html) for more details on the mathematical background.
#' @param x Input value
#' @return A single numeric value with the computed sinus cardinal or hyperbolic sinus cardinal function.
#' @examples
#' # Sinus cardinal function at x = 0.5: sinc(π/2)
#' sinc_pi(0.5)
#' # Sinus cardinal at zero (returns exactly 1)
#' sinc_pi(0)
#' # Hyperbolic sinus cardinal function
#' sinhc_pi(0.5)
#' # Hyperbolic sinus cardinal at zero (returns exactly 1)
#' sinhc_pi(0)
NULL

#' @rdname sinus_cardinal_hyperbolic_functions
#' @export
sinc_pi <- function(x) {
  .Call(`sinc_pi_`, x)
}

#' @rdname sinus_cardinal_hyperbolic_functions
#' @export
sinhc_pi <- function(x) {
  .Call(`sinhc_pi_`, x)
}
