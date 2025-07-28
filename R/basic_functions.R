#' @title Basic Mathematical Functions
#' @name basic_functions
#' @description Functions to compute sine, cosine, logarithm, exponential, cube root, square root, power, hypotenuse, and inverse square root.
#' @param x Input numeric value
#' @param y Second input numeric value (for power and hypotenuse functions)
#' @return A single numeric value with the computed result of the function.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/powers.html)) for more details on the mathematical background.
#' @examples
#' # sin(pi * 0.5)
#' sin_pi(0.5)
#' # cos(pi * 0.5)
#' cos_pi(0.5)
#' # log(1 + 0.5)
#' log1p_boost(0.5)
#' # exp(0.5) - 1
#' expm1_boost(0.5)
#' cbrt(8)
#' # sqrt(1 + 0.5) - 1
#' sqrt1pm1(0.5)
#' # 2^3 - 1
#' powm1(2, 3)
#' hypot(3, 4)
#' rsqrt(4)
NULL

#' @rdname basic_functions
#' @export
sin_pi <- function(x) {
  .Call(`sin_pi_`, x)
}

#' @rdname basic_functions
#' @export
cos_pi <- function(x) {
  .Call(`cos_pi_`, x)
}

#' @rdname basic_functions
#' @export
log1p_boost <- function(x) {
  .Call(`log1p_`, x)
}

#' @rdname basic_functions
#' @export
expm1_boost <- function(x) {
  .Call(`expm1_`, x)
}

#' @rdname basic_functions
#' @export
cbrt <- function(x) {
  .Call(`cbrt_`, x)
}

#' @rdname basic_functions
#' @export
sqrt1pm1 <- function(x) {
  .Call(`sqrt1pm1_`, x)
}

#' @rdname basic_functions
#' @export
powm1 <- function(x, y) {
  .Call(`powm1_`, x, y)
}

#' @rdname basic_functions
#' @export
hypot <- function(x, y) {
  .Call(`hypot_`, x, y)
}

#' @rdname basic_functions
#' @export
rsqrt <- function(x) {
  .Call(`rsqrt_`, x)
}
