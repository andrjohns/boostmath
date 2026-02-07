#' Owens T Function
#'
#' @description
#' Computes Owen's T function T(h, a), which gives the probability of the event
#' (X > h and 0 < Y < a*X) where X and Y are independent standard normal random variables.
#'
#' \deqn{T(h,a)=\frac{1}{2\pi}\int_{0}^{a}\frac{\exp\!\left\{-\tfrac{1}{2}h^{2}(1+x^{2})\right\}}{1+x^{2}}\,dx,\quad (-\infty<h,a<+\infty)}
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/owens_t.html) for more details on the mathematical background.
#'
#' @param h The first argument of the Owens T function (boundary parameter)
#' @param a The second argument of the Owens T function (slope parameter)
#' @return The value of the Owens T function at (h, a).
#' @export
#' @examples
#' # Owens T Function
#' owens_t(1, 0.5)
owens_t <- function(h, a) {
  .Call(`owens_t_`, h, a)
}
