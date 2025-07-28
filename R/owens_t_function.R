#' Owens T Function
#'
#' Computes the Owens T function of h and a, giving the probability of
#' the event (X > h and 0 < Y < a * X) where X and Y are independent
#' standard normal random variables.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/owens_t.html) for more details on the mathematical background.
#'
#' @param h The first argument of the Owens T function
#' @param a The second argument of the Owens T function
#' @return The value of the Owens T function at (h, a).
#' @export
#' @examples
#' # Owens T Function
#' owens_t(1, 0.5)
owens_t <- function(h, a) {
  .Call(`owens_t_`, h, a)
}
