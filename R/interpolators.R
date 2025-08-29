#' Cardinal Cubic B-Spline Interpolator
#'
#' Constructs a cardinal cubic B-spline interpolator given data points.
#'
#' @param y Numeric vector of data points to interpolate.
#' @param t0 Numeric scalar representing the starting point of the data.
#' @param h Numeric scalar representing the spacing between data points.
#' @param left_endpoint_derivative Optional numeric scalar for the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric scalar for the derivative at the right endpoint.
#'
#' @return An object of class `cardinal_cubic_b_spline` with methods:
#'   - `spline(x)`: Evaluate the spline at point `x`.
#'   - `prime(x)`: Evaluate the first derivative of the spline at point `x`.
#'   - `double_prime(x)`: Evaluate the second derivative of the spline at point `x`.
#' @examples
#' y <- c(1, 2, 0, 2, 1)
#' t0 <- 0
#' h <- 1
#' spline_obj <- cardinal_cubic_b_spline(y, t0, h)
#' x <- 0.5
#' spline_value <- spline_obj$spline(x)
#' prime_value <- spline_obj$prime(x)
#' double_prime_value <- spline_obj$double_prime(x)
#' @export
cardinal_cubic_b_spline <- function(y, t0, h, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL) {
  if (is.null(left_endpoint_derivative)) {
    left_endpoint_derivative <- NaN
  }
  if (is.null(right_endpoint_derivative)) {
    right_endpoint_derivative <- NaN
  }
  ptr <- .Call(`cardinal_cubic_b_spline_init_`, y, t0, h, left_endpoint_derivative, right_endpoint_derivative)
  structure(
    list(
      spline = function(x) .Call(`cardinal_cubic_b_spline_eval_`, ptr, x),
      prime = function(x) .Call(`cardinal_cubic_b_spline_prime_`, ptr, x),
      double_prime = function(x) .Call(`cardinal_cubic_b_spline_double_prime_`, ptr, x)
    ),
    class = "cardinal_cubic_b_spline"
  )
}
