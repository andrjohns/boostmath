#' @title Sinus Cardinal and Hyperbolic Functions
#' @name sinus_cardinal_hyperbolic_functions
#' @description Functions to compute the sinus cardinal function and hyperbolic sinus cardinal function.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sinc.html) for more details on the mathematical background.
#' @param x Input value
#' @return A single numeric value with the computed sinus cardinal or hyperbolic sinus cardinal function.
#' @examples
#' # Sinus cardinal function
#' sinc_pi(0.5)
#' # Hyperbolic sinus cardinal function
#' sinhc_pi(0.5)
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
