#' @title Basic Mathematical Functions
#' @name basic_functions
#' @description
#' High-precision implementations of basic mathematical functions with enhanced
#' numerical stability for special cases.
#'
#' These functions provide numerically stable alternatives to standard operations,
#' particularly useful when working with values near zero or when high precision is required.
#'
#' **Trigonometric Functions with π:**
#'
#' * `sin_pi(x)`: Computes sin(π·x) with exact results for integer and half-integer values
#' * `cos_pi(x)`: Computes cos(π·x) with exact results for integer and half-integer values
#' * Avoid loss of precision from representing π in floating-point
#'
#' **Logarithmic and Exponential Functions:**
#'
#' * `log1p_boost(x)`: Computes log(1 + x) accurately for small |x|
#'   - Avoids catastrophic cancellation when x ≈ 0
#'   - More accurate than log(1 + x) for |x| < 0.5
#'
#' * `expm1_boost(x)`: Computes exp(x) - 1 accurately for small |x|
#'   - Avoids precision loss when exp(x) ≈ 1
#'   - Essential for accurate computation near x = 0
#'
#' **Root Functions:**
#'
#' * `cbrt(x)`: Computes the cube root of x (\deqn{x^{1/3}})
#'   - Handles negative values correctly (preserves sign)
#'
#' * `sqrt1pm1(x)`: Computes sqrt(1 + x) - 1 accurately for small |x|
#'   - Avoids precision loss for x near 0
#'   - More accurate than sqrt(1 + x) - 1 for small |x|
#'
#' * `rsqrt(x)`: Computes the reciprocal square root 1/sqrt(x)
#'   - May use hardware-optimized implementations
#'
#' **Power Functions:**
#'
#' * `powm1(x, y)`: Computes x^y - 1 accurately
#'   - Avoids precision loss when x^y ≈ 1
#'   - Useful for computing relative changes
#'
#' **Geometric Functions:**
#'
#' * `hypot(x, y)`: Computes sqrt(x² + y²) without overflow/underflow
#'   - Avoids intermediate overflow when x or y are large
#'   - Avoids underflow when x and y are both small
#'   - Essential for computing Euclidean distance accurately
#'
#' @param x Input numeric value
#' @param y Second input numeric value (for power and hypotenuse functions)
#' @return A single numeric value with the computed result of the function.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/powers.html) for more details on the mathematical background.
#' @examples
#' # sin(π/2) = 1 (exact)
#' sin_pi(0.5)
#' # cos(π/2) = 0 (exact)
#' cos_pi(0.5)
#' # log(1 + x) for small x
#' log1p_boost(0.001)
#' # exp(x) - 1 for small x
#' expm1_boost(0.001)
#' # Cube root
#' cbrt(8)  # Returns 2
#' # sqrt(1 + x) - 1 for small x
#' sqrt1pm1(0.001)
#' # x^y - 1 accurately
#' powm1(2, 3)  # Returns 7 (2^3 - 1)
#' # Euclidean distance
#' hypot(3, 4)  # Returns 5
#' # Reciprocal square root
#' rsqrt(4)  # Returns 0.5
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
