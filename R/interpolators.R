#' @title Cardinal Cubic B-Spline Interpolator
#' @description
#' The cardinal cubic B-spline interpolator allows for fast and accurate interpolation of a function
#' which is known at equally spaced points.
#'
#' **Mathematical Properties:**
#'
#' It uses compactly supported basis functions constructed via iterative convolution, ensuring numerical stability.
#' The interpolant is O(h^4) accurate for values and O(h^3) accurate for derivatives,
#' where h is the step size.
#'
#' **Conditions:**
#'
#' Ideally, the function being interpolated should be four-times continuously differentiable.
#' If the derivatives at the endpoints are not provided, they are estimated using one-sided
#' finite-difference formulas.
#'
#' @param y Numeric vector of data points to interpolate.
#' @param t0 Numeric scalar representing the starting point of the data.
#' @param h Numeric scalar representing the spacing between data points.
#' @param left_endpoint_derivative Optional numeric scalar for the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric scalar for the derivative at the right endpoint.
#'
#' @return An object of class `cardinal_cubic_b_spline` with methods:
#'   - `interpolate(x)`: Evaluate the spline at point `x`.
#'   - `prime(x)`: Evaluate the first derivative of the spline at point `x`.
#'   - `double_prime(x)`: Evaluate the second derivative of the spline at point `x`.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_cubic_b.html)
#' @examples
#' y <- c(1, 2, 0, 2, 1)
#' t0 <- 0
#' h <- 1
#' spline_obj <- cardinal_cubic_b_spline(y, t0, h)
#' x <- 0.5
#' spline_obj$interpolate(x)
#' spline_obj$prime(x)
#' spline_obj$double_prime(x)
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
      interpolate = function(x) .Call(`cardinal_cubic_b_spline_eval_`, ptr, x),
      prime = function(x) .Call(`cardinal_cubic_b_spline_prime_`, ptr, x),
      double_prime = function(x) .Call(`cardinal_cubic_b_spline_double_prime_`, ptr, x)
    ),
    class = "cardinal_cubic_b_spline"
  )
}

#' @title Barycentric Rational Interpolation
#' @description
#' Barycentric rational interpolation is a high-accuracy interpolation method for non-uniformly spaced samples.
#'
#' **Performance and Accuracy:**
#'
#' It requires O(N) time for construction and O(N) time for each evaluation.
#' If the approximation order is d, the error is O(h^(d+1)).
#'
#' **Caveats:**
#'
#' This method is robust but can behave unexpectedly if the sample spacing at the endpoints is
#' much larger than in the center.
#'
#' @param x Numeric vector of data points (abscissas).
#' @param y Numeric vector of data values (ordinates).
#' @param order Integer representing the approximation order of the interpolator, defaults to 3.
#'
#' @return An object of class `barycentric_rational_interpolator` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/barycentric.html)
#' @examples
#' x <- c(0, 1, 2, 3)
#' y <- c(1, 2, 0, 2)
#' order <- 3
#' interpolator <- barycentric_rational(x, y, order)
#' xi <- 1.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' @export
barycentric_rational <- function(x, y, order = 3) {
  stopifnot(length(x) == length(y))
  ptr <- .Call(`barycentric_rational_init_`, x, y, order)
  structure(
    list(
      interpolate = function(xi) .Call(`barycentric_rational_eval_`, ptr, xi),
      prime = function(xi) .Call(`barycentric_rational_prime_`, ptr, xi)
    ),
    class = "barycentric_rational"
  )
}
#' @title Bezier Polynomial Interpolator
#' @description
#' Bézier polynomials are smooth curves which approximate a set of control points.
#' They are commonly used in computer-aided geometric design.
#'
#' **Properties:**
#'
#' The curve is approximating, meaning it does not necessarily pass through the control points.
#' Passing n control points creates a polynomial of degree n-1.
#' Evaluation is O(N^2) via de Casteljau's algorithm.
#'
#' @param control_points List of control points, where each element is a numeric vector of length 3.
#'
#' @return An object of class `bezier_polynomial` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `edit_control_point(new_control_point, index)`: Insert a new control point at the specified index.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bezier_polynomial.html)
#' @examples
#' control_points <- list(c(0, 0, 0), c(1, 2, 0), c(2, 0, 0), c(3, 3, 0))
#' interpolator <- bezier_polynomial(control_points)
#' xi <- 1.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' new_control_point <- c(1.5, 1, 0)
#' interpolator$edit_control_point(new_control_point, 2)
#'
#' @export
bezier_polynomial <- function(control_points) {
  stopifnot(is.list(control_points), all(sapply(control_points, is.numeric)), all(sapply(control_points, length) == 3))
  ptr <- .Call(`bezier_polynomial_init_`, control_points)
  structure(
    list(
      interpolate = function(xi) .Call(`bezier_polynomial_eval_`, ptr, xi),
      prime = function(xi) .Call(`bezier_polynomial_prime_`, ptr, xi),
      edit_control_point = function(new_control_point, index) {
        stopifnot(is.numeric(new_control_point), length(new_control_point) == 3)
        invisible(.Call(`bezier_polynomial_edit_control_point_`, ptr, new_control_point, index))
      }
    ),
    class = "bezier_polynomial"
  )
}

#' @title Bilinear Uniform Interpolator
#' @description
#' The bilinear uniform interpolator takes a grid of data points specified by a linear index
#' and interpolates between each segment using a bilinear function.
#'
#' **Details:**
#'
#' "Bilinear" means it is the product of two linear functions.
#' The interpolant is continuous and its evaluation is constant time.
#' The interpolator is point-centered.
#'
#' @param x Numeric vector of all grid elements
#' @param rows Integer representing the number of rows in the grid
#' @param cols Integer representing the number of columns in the grid
#' @param dx Numeric value representing the spacing between grid points in the x-direction, defaults to 1
#' @param dy Numeric value representing the spacing between grid points in the y-direction, defaults to 1
#' @param x0 Numeric value representing the x-coordinate of the origin, defaults to 0
#' @param y0 Numeric value representing the y-coordinate of the origin, defaults to 0
#'
#' @return An object of class `bilinear_uniform` with methods:
#'   - `interpolate(xi, yi)`: Evaluate the interpolator at point `(xi, yi)`.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bilinear_uniform.html)
#' @examples
#' x <- seq(0, 1, length.out = 10)
#' interpolator <- bilinear_uniform(x, rows = 2, cols = 5)
#' xi <- 0.5
#' yi <- 0.5
#' interpolator$interpolate(xi, yi)
#' @export
bilinear_uniform <- function(x, rows, cols, dx = 1, dy = 1, x0 = 0, y0 = 0) {
  ptr <- .Call(`bilinear_uniform_init_`, x, rows, cols, dx, dy, x0, y0)
  structure(
    list(
      interpolate = function(xi, yi) .Call(`bilinear_uniform_eval_`, ptr, xi, yi)
    ),
    class = "bilinear_uniform"
  )
}

#' @title Cardinal Quadratic B-Spline Interpolator
#' @description
#' The cardinal quadratic B-spline interpolator is very nearly the same as the cubic B-spline interpolator,
#' but uses quadratic basis functions.
#'
#' **Use Cases:**
#'
#' Basis functions are constructed by convolving a box function with itself twice.
#' Since the basis functions are less smooth than the cubic B-spline, this is primarily useful for
#' approximating functions of reduced smoothness.
#' It is appropriate for functions which are two or three times continuously differentiable.
#'
#' @param y Numeric vector of data points to interpolate.
#' @param t0 Numeric scalar representing the starting point of the data.
#' @param h Numeric scalar representing the spacing between data points.
#' @param left_endpoint_derivative Optional numeric scalar for the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric scalar for the derivative at the right endpoint.
#'
#' @return An object of class `cardinal_quadratic_b_spline` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_quadratic_b.html)
#' @examples
#' y <- c(0, 1, 0, 1)
#' t0 <- 0
#' h <- 1
#' interpolator <- cardinal_quadratic_b_spline(y, t0, h)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
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
      interpolate = function(xi) .Call(`cardinal_quadratic_b_spline_eval_`, ptr, xi),
      prime = function(xi) .Call(`cardinal_quadratic_b_spline_prime_`, ptr, xi)
    ),
    class = "cardinal_quadratic_b_spline"
  )
}

#' @title Cardinal Quintic B-Spline Interpolator
#' @description
#' The cardinal quintic B-spline interpolator is similar to the cubic B-spline but uses
#' basis functions constructed by convolving a box function with itself five times.
#'
#' **Properties:**
#'
#' The basis functions are more smooth (C4) than the cubic B-spline (C2), making this useful
#' for computing second derivatives. The second derivative of the quintic B-spline is a cubic spline.
#'
#' @param y Numeric vector of data points to interpolate.
#' @param t0 Numeric scalar representing the starting point of the data.
#' @param h Numeric scalar representing the spacing between data points.
#' @param left_endpoint_derivatives Optional two-element numeric vector for the derivative at the left endpoint.
#' @param right_endpoint_derivatives Optional two-element numeric vector for the derivative at the right endpoint.
#'
#' @return An object of class `cardinal_quintic_b_spline` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `double_prime(xi)`: Evaluate the second derivative of the interpolator at point `xi`.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_quintic_b.html)
#' @examples
#' y <- seq(0, 1, length.out = 20)
#' t0 <- 0
#' h <- 1
#' interpolator <- cardinal_quintic_b_spline(y, t0, h)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$double_prime(xi)
#' @export
cardinal_quintic_b_spline <- function(y, t0, h, left_endpoint_derivatives = NULL, right_endpoint_derivatives = NULL) {
  if (is.null(left_endpoint_derivatives)) {
    left_endpoint_derivatives <- c(NaN, NaN)
  }
  if (is.null(right_endpoint_derivatives)) {
    right_endpoint_derivatives <- c(NaN, NaN)
  }
  ptr <- .Call(`cardinal_quintic_b_spline_init_`, y, t0, h, left_endpoint_derivatives, right_endpoint_derivatives)
  structure(
    list(
      interpolate = function(xi) .Call(`cardinal_quintic_b_spline_eval_`, ptr, xi),
      prime = function(xi) .Call(`cardinal_quintic_b_spline_prime_`, ptr, xi),
      double_prime = function(xi) .Call(`cardinal_quintic_b_spline_double_prime_`, ptr, xi)
    ),
    class = "cardinal_quintic_b_spline"
  )
}

#' @title Catmull-Rom Interpolation
#' @description
#' Catmull-Rom splines are a family of interpolating curves which are commonly used in computer graphics and animation.
#'
#' **Properties:**
#'
#' They enjoy affine invariance, local support, C2-smoothness, and interpolation of control points.
#' The curve is internally closed, however the user specifies if it should be treated as open or closed via the parameters.
#' Evaluation is O(log N).
#'
#' @param control_points List of control points, where each element is a numeric vector of length 3.
#' @param closed Logical indicating whether the spline is closed (i.e., the first and last control points are connected), defaults to false
#' @param alpha Numeric scalar for the tension parameter, defaults to 0.5
#'
#' @return An object of class `catmull_rom` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `max_parameter()`: Get the maximum parameter value of the spline.
#'   - `parameter_at_point(i)`: Get the parameter value at index `i`.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/catmull_rom.html)
#' @examples
#' control_points <- list(c(0, 0, 0), c(1, 1, 0), c(2, 0, 0), c(3, 1, 0))
#' interpolator <- catmull_rom(control_points)
#' xi <- 1.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$max_parameter()
#' interpolator$parameter_at_point(2)
#' @export
catmull_rom <- function(control_points, closed = FALSE, alpha = 0.5) {
  ptr <- .Call(`catmull_rom_init_`, control_points, closed, alpha)
  structure(
    list(
      interpolate = function(xi) .Call(`catmull_rom_eval_`, ptr, xi),
      prime = function(xi) .Call(`catmull_rom_prime_`, ptr, xi),
      max_parameter = function() .Call(`catmull_rom_max_parameter_`, ptr),
      parameter_at_point = function(i) .Call(`catmull_rom_parameter_at_point_`, ptr, i)
    ),
    class = "catmull_rom"
  )
}

#' @title Cubic Hermite Interpolator
#' @description
#' The cubic Hermite interpolant takes non-equispaced data and interpolates between them via
#' cubic Hermite polynomials whose slopes must be provided.
#'
#' **Applications:**
#'
#' The interpolant is C1 and evaluation has O(log N) complexity.
#' This interpolator is useful for solution skeletons of ODE steppers.
#'
#' @param x Numeric vector of abscissas (x-coordinates).
#' @param y Numeric vector of ordinates (y-coordinates).
#' @param dydx Numeric vector of derivatives (slopes) at each point.
#'
#' @return An object of class `cubic_hermite` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `push_back(x, y, dydx)`: Add a new control point to the interpolator.
#'   - `domain()`: Get the domain of the interpolator.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cubic_hermite.html)
#' @examples
#' x <- c(0, 1, 2)
#' y <- c(0, 1, 0)
#' dydx <- c(1, 0, -1)
#' interpolator <- cubic_hermite(x, y, dydx)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$push_back(3, 0, 1)
#' interpolator$domain()
#' @export
cubic_hermite <- function(x, y, dydx) {
  ptr <- .Call(`cubic_hermite_init_`, x, y, dydx)
  structure(
    list(
      interpolate = function(xi) .Call(`cubic_hermite_eval_`, ptr, xi),
      prime = function(xi) .Call(`cubic_hermite_prime_`, ptr, xi),
      push_back = function(x, y, dydx) invisible(.Call(`cubic_hermite_push_back_`, ptr, x, y, dydx)),
      domain = function() .Call(`cubic_hermite_domain_`, ptr)
    ),
    class = "cubic_hermite"
  )
}

#' @title Cardinal Cubic Hermite Interpolator
#' @description
#' The cardinal cubic Hermite interpolator is similar to the cubic Hermite interpolator but optimized for equispaced data.
#'
#' **Performance:**
#'
#' This allows for constant-time evaluation.
#'
#' @param y Numeric vector of ordinates (y-coordinates).
#' @param dydx Numeric vector of derivatives (slopes) at each point.
#' @param x0 Numeric value of the first abscissa (x-coordinate).
#' @param dx Numeric value of the spacing between abscissas.
#'
#' @return An object of class `cardinal_cubic_hermite` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `domain()`: Get the domain of the interpolator.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cubic_hermite.html)
#' @examples
#' y <- c(0, 1, 0)
#' dydx <- c(1, 0, -1)
#' interpolator <- cardinal_cubic_hermite(y, dydx, 0, 1)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$domain()
#' @export
cardinal_cubic_hermite <- function(y, dydx, x0, dx) {
  ptr <- .Call(`cardinal_cubic_hermite_init_`, y, dydx, x0, dx)
  structure(
    list(
      interpolate = function(xi) .Call(`cardinal_cubic_hermite_eval_`, ptr, xi),
      prime = function(xi) .Call(`cardinal_cubic_hermite_prime_`, ptr, xi),
      domain = function() .Call(`cardinal_cubic_hermite_domain_`, ptr)
    ),
    class = "cardinal_cubic_hermite"
  )
}
#' @title Modified Akima Interpolator
#' @description
#' The modified Akima interpolant takes non-equispaced data and interpolates between them via
#' cubic Hermite polynomials whose slopes are chosen significantly.
#'
#' **Properties:**
#'
#' The slopes are chosen by a modification of a geometric construction proposed by Akima.
#' The interpolant is C1 and evaluation has O(log N) complexity.
#' It oscillates less than the cubic spline but has less smoothness.
#' The modification is given by Cosmin Ionita and agrees with Matlab's version.
#'
#' @param x Numeric vector of abscissas (x-coordinates).
#' @param y Numeric vector of ordinates (y-coordinates).
#' @param left_endpoint_derivative Optional numeric value of the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric value of the derivative at the right endpoint.
#'
#' @return An object of class `makima` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `push_back(x, y)`: Add a new control point
#' @examples
#' x <- c(0, 1, 2, 3)
#' y <- c(0, 1, 0, 1)
#' interpolator <- makima(x, y)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$push_back(4, 1)
#' @export
makima <- function(x, y, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL) {
  if (is.null(left_endpoint_derivative)) {
    left_endpoint_derivative <- NaN
  }
  if (is.null(right_endpoint_derivative)) {
    right_endpoint_derivative <- NaN
  }
  ptr <- .Call(`makima_init_`, x, y, left_endpoint_derivative, right_endpoint_derivative)
  structure(
    list(
      interpolate = function(xi) .Call(`makima_eval_`, ptr, xi),
      prime = function(xi) .Call(`makima_prime_`, ptr, xi),
      push_back = function(x, y) invisible(.Call(`makima_push_back_`, ptr, x, y))
    ),
    class = "makima"
  )
}

#' @title PCHIP Interpolator
#' @description
#' The PCHIP (Piecewise Cubic Hermite Interpolating Polynomial) interpolant takes non-equispaced data
#' and interpolates between them via cubic Hermite polynomials whose slopes are chosen to preserve monotonicity.
#'
#' **Details:**
#'
#' The interpolant is C1 and evaluation has O(log N) complexity.
#' See Fritsch and Carlson for details.
#'
#' @param x Numeric vector of abscissas (x-coordinates).
#' @param y Numeric vector of ordinates (y-coordinates).
#' @param left_endpoint_derivative Optional numeric value of the derivative at the left endpoint.
#' @param right_endpoint_derivative Optional numeric value of the derivative at the right endpoint.
#'
#' @return An object of class `pchip` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `push_back(x, y)`: Add a new control point
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/pchip.html)
#' @examples
#' x <- c(0, 1, 2, 3)
#' y <- c(0, 1, 0, 1)
#' interpolator <- pchip(x, y)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$push_back(4, 1)
#' @export
pchip <- function(x, y, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL) {
  if (is.null(left_endpoint_derivative)) {
    left_endpoint_derivative <- NaN
  }
  if (is.null(right_endpoint_derivative)) {
    right_endpoint_derivative <- NaN
  }
  ptr <- .Call(`pchip_init_`, x, y, left_endpoint_derivative, right_endpoint_derivative)
  structure(
    list(
      interpolate = function(xi) .Call(`pchip_eval_`, ptr, xi),
      prime = function(xi) .Call(`pchip_prime_`, ptr, xi),
      push_back = function(x, y) invisible(.Call(`pchip_push_back_`, ptr, x, y))
    ),
    class = "pchip"
  )
}

#' @title Quintic Hermite Interpolator
#' @description
#' The quintic Hermite interpolator takes a list of possibly non-uniformly spaced abscissas, ordinates,
#' and their velocities and accelerations.
#'
#' **Applications:**
#'
#' It constructs a quintic interpolating polynomial between segments.
#' This is useful for taking solution skeletons from ODE steppers and turning them into a continuous function.
#' The interpolant is C2 and its evaluation has O(log N) complexity.
#'
#' @param x Numeric vector of abscissas (x-coordinates).
#' @param y Numeric vector of ordinates (y-coordinates).
#' @param dydx Numeric vector of first derivatives (slopes) at each point.
#' @param d2ydx2 Numeric vector of second derivatives at each point.
#'
#' @return An object of class `quintic_hermite` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `double_prime(xi)`: Evaluate the second derivative of the interpolator at point `xi`.
#'   - `push_back(x, y, dydx, d2ydx2)`: Add a new control point to the interpolator.
#'   - `domain()`: Get the domain of the interpolator.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/quintic_hermite.html)
#' @examples
#' x <- c(0, 1, 2)
#' y <- c(0, 1, 0)
#' dydx <- c(1, 0, -1)
#' d2ydx2 <- c(0, -1, 0)
#' interpolator <- quintic_hermite(x, y, dydx, d2ydx2)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$double_prime(xi)
#' interpolator$push_back(3, 0, 1, 0)
#' interpolator$domain()
#' @export
quintic_hermite <- function(x, y, dydx, d2ydx2) {
  ptr <- .Call(`quintic_hermite_init_`, x, y, dydx, d2ydx2)
  structure(
    list(
      interpolate = function(xi) .Call(`quintic_hermite_eval_`, ptr, xi),
      prime = function(xi) .Call(`quintic_hermite_prime_`, ptr, xi),
      double_prime = function(xi) .Call(`quintic_hermite_double_prime_`, ptr, xi),
      push_back = function(x, y, dydx, d2ydx2) .Call(`quintic_hermite_push_back_`, ptr, x, y, dydx, d2ydx2),
      domain = function() .Call(`quintic_hermite_domain_`, ptr)
    ),
    class = "quintic_hermite"
  )
}
#' @title Cardinal Quintic Hermite Interpolator
#' @description
#' The cardinal quintic Hermite interpolator is similar to the quintic Hermite interpolator but optimized for equispaced data.
#'
#' **Performance:**
#'
#' This allows for constant-time evaluation.
#'
#' @param y Numeric vector of ordinates (y-coordinates).
#' @param dydx Numeric vector of first derivatives (slopes) at each point.
#' @param d2ydx2 Numeric vector of second derivatives at each point.
#' @param x0 Numeric value of the first abscissa (x-coordinate).
#' @param dx Numeric value of the spacing between abscissas.
#'
#' @return An object of class `cardinal_quintic_hermite` with methods:
#'   - `interpolate(xi)`: Evaluate the interpolator at point `xi`.
#'   - `prime(xi)`: Evaluate the derivative of the interpolator at point `xi`.
#'   - `double_prime(xi)`: Evaluate the second derivative of the interpolator at point `xi`.
#'   - `domain()`: Get the domain of the interpolator.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/quintic_hermite.html)
#' @examples
#' y <- c(0, 1, 0)
#' dydx <- c(1, 0, -1)
#' d2ydx2 <- c(0, -1, 0)
#' x0 <- 0
#' dx <- 1
#' interpolator <- cardinal_quintic_hermite(y, dydx, d2ydx2, x0, dx)
#' xi <- 0.5
#' interpolator$interpolate(xi)
#' interpolator$prime(xi)
#' interpolator$double_prime(xi)
#' interpolator$domain()
#' @export
cardinal_quintic_hermite <- function(y, dydx, d2ydx2, x0, dx) {
  ptr <- .Call(`cardinal_quintic_hermite_init_`, y, dydx, d2ydx2, x0, dx)
  structure(
    list(
      interpolate = function(xi) .Call(`cardinal_quintic_hermite_eval_`, ptr, xi),
      prime = function(xi) .Call(`cardinal_quintic_hermite_prime_`, ptr, xi),
      double_prime = function(xi) .Call(`cardinal_quintic_hermite_double_prime_`, ptr, xi),
      domain = function() .Call(`cardinal_quintic_hermite_domain_`, ptr)
    ),
    class = "cardinal_quintic_hermite"
  )
}
