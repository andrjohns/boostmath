#' Owens T Function
#'
#' @description
#' Computes Owen's T function T(h, a), which gives the probability of the event
#' (X > h and 0 < Y < a·X) where X and Y are independent standard normal random variables.
#'
#' **Geometric Interpretation:**
#'
#' For positive h and a, T(h, a) represents the volume of an uncorrelated bivariate
#' normal distribution with zero means and unit variances over the region bounded by
#' y = ax, y = 0, and x = h.
#'
#' **Special Cases:**
#'
#' * T(h, 0) = 0
#' * T(0, a) = (1/2π) arctan(a)
#' * T(h, 1) = (1/2) Φ(h) \[1 - Φ(h)\], where Φ is the standard normal CDF
#' * T(h, ∞) = Φ(|h|)
#'
#' **Applications:**
#'
#' Owen's T function is essential for computing the skew normal distribution and
#' probabilities for bivariate and multivariate normal distributions. It appears in
#' statistical inference, power calculations, and various probability computations
#' involving correlated normal variables.
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
