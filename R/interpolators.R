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

#' Barycentric Rational Interpolation
#'
#' Constructs a barycentric rational interpolator given data points.
#'
#' @param x Numeric vector of data points (abscissas).
#' @param y Numeric vector of data values (ordinates).
#' @param order Integer representing the approximation order of the interpolator, defaults to 3.
#'
#' @return An object of class `barycentric_rational_interpolator` with methods:
#'   - `spline(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#' @examples
#' x <- c(0, 1, 2, 3)
#' y <- c(1, 2, 0, 2)
#' order <- 3
#' interpolator <- barycentric_rational(x, y, order)
#' xi <- 1.5
#' interpolated_value <- interpolator$interpolate(xi)
#' derivative_value <- interpolator$derivative(xi)
#' @export
barycentric_rational <- function(x, y, order = 3) {
  stopifnot(length(x) == length(y))
  ptr <- .Call(`barycentric_rational_init_`, x, y, order)
  structure(
    list(
      interpolate = function(xi) .Call(`barycentric_rational_eval_`, ptr, xi),
      derivative = function(xi) .Call(`barycentric_rational_prime_`, ptr, xi)
    ),
    class = "barycentric_rational"
  )
}

#' Cardinal Quadratic B-Spline Interpolator
#'
#' Constructs a cardinal quadratic B-spline interpolator given control points.
#'
#' @param y Numeric vector of data points to interpolate.
#' @param t0 Numeric scalar representing the starting point of the data.
#' @param h Numeric scalar representing the spacing between data points.
#' @param left_endpoint_derivative Optional numeric scalar for the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric scalar for the derivative at the right endpoint.
#'
#' @return An object of class `cardinal_quadratic_b_spline` with methods:
#'   - `spline(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#' @examples
#' y <- c(0, 1, 0, 1)
#' t0 <- 0
#' h <- 1
#' interpolator <- cardinal_quadratic_b_spline(y, t0, h)
#' xi <- 0.5
#' interpolated_value <- interpolator$spline(xi)
#' derivative_value <- interpolator$prime(xi)
#' @export
cardinal_quadratic_b_spline <- function(y, t0, h, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL) {
  if (is.null(left_endpoint_derivative)) {
    left_endpoint_derivative <- NaN
  }
  if (is.null(right_endpoint_derivative)) {
    right_endpoint_derivative <- NaN
  }
  ptr <- .Call(`cardinal_quadratic_b_spline_init_`, y, t0, h, left_endpoint_derivative, right_endpoint_derivative)
  structure(
    list(
      spline = function(xi) .Call(`cardinal_quadratic_b_spline_eval_`, ptr, xi),
      prime = function(xi) .Call(`cardinal_quadratic_b_spline_prime_`, ptr, xi)
    ),
    class = "cardinal_quadratic_b_spline"
  )
}

#' Cardinal Quintic B-Spline Interpolator
#'
#' Constructs a cardinal quintic B-spline interpolator given control points.
#'
#' @param y Numeric vector of data points to interpolate.
#' @param t0 Numeric scalar representing the starting point of the data.
#' @param h Numeric scalar representing the spacing between data points.
#' @param left_endpoint_derivative Optional numeric scalar for the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric scalar for the derivative at the right endpoint.
#'
#' @return An object of class `cardinal_quintic_b_spline` with methods:
#'   - `spline(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `double_prime(xi)`: Evaluate the second derivative of the interpolator at point `xi`.
#' @examples
#' y <- seq(0, 1, length.out = 20)
#' t0 <- 0
#' h <- 1
#' interpolator <- cardinal_quintic_b_spline(y, t0, h)
#' xi <- 0.5
#' interpolated_value <- interpolator$spline(xi)
#' derivative_value <- interpolator$prime(xi)
#' second_derivative_value <- interpolator$double_prime(xi)
#' @export
cardinal_quintic_b_spline <- function(y, t0, h, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL) {
  if (is.null(left_endpoint_derivative)) {
    left_endpoint_derivative <- NaN
  }
  if (is.null(right_endpoint_derivative)) {
    right_endpoint_derivative <- NaN
  }
  ptr <- .Call(`cardinal_quintic_b_spline_init_`, y, t0, h, left_endpoint_derivative, right_endpoint_derivative)
  structure(
    list(
      spline = function(xi) .Call(`cardinal_quintic_b_spline_eval_`, ptr, xi),
      prime = function(xi) .Call(`cardinal_quintic_b_spline_prime_`, ptr, xi),
      double_prime = function(xi) .Call(`cardinal_quintic_b_spline_double_prime_`, ptr, xi)
    ),
    class = "cardinal_quintic_b_spline"
  )
}

#' Catmull-Rom Interpolation
#'
#' Constructs a Catmull-Rom spline interpolator given control points.
#'
#' @param control_points List of control points, where each element is a numeric vector of length 3.
#' @param closed Logical indicating whether the spline is closed (i.e., the first and last control points are connected), defaults to false
#' @param alpha Numeric scalar for the tension parameter, defaults to 0.5
#'
#' @return An object of class `catmull_rom` with methods:
#'   - `spline(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `max_parameter()`: Get the maximum parameter value of the spline.
#'   - `parameter_at_point(i)`: Get the parameter value at index `i`.
#' @examples
#' control_points <- list(c(0, 0, 0), c(1, 1, 0), c(2, 0, 0), c(3, 1, 0))
#' interpolator <- catmull_rom(control_points)
#' xi <- 1.5
#' interpolated_value <- interpolator$spline(xi)
#' derivative_value <- interpolator$prime(xi)
#' max_param <- interpolator$max_parameter()
#' param_at_point <- interpolator$parameter_at_point(2)
#' @export
catmull_rom <- function(control_points, closed = FALSE, alpha = 0.5) {
  ptr <- .Call(`catmull_rom_init_`, control_points, closed, alpha)
  structure(
    list(
      spline = function(xi) .Call(`catmull_rom_eval_`, ptr, xi),
      prime = function(xi) .Call(`catmull_rom_prime_`, ptr, xi),
      max_parameter = function() .Call(`catmull_rom_max_parameter_`, ptr),
      parameter_at_point = function(i) .Call(`catmull_rom_parameter_at_point_`, ptr, i)
    ),
    class = "catmull_rom"
  )
}
