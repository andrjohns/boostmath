#' @title Jacobi Theta Functions
#' @name jacobi_theta_functions
#' @description Functions to compute the Jacobi theta functions \eqn{(\theta_1, \theta_2, \theta_3, \theta_4)} parameterised by either \eqn{(q)} or \eqn{(\tau)}.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi_theta.html) for more details on the mathematical background.
#' @param x Input value
#' @param q The nome parameter of the Jacobi theta function (0 < q < 1)
#' @param tau The nome parameter of the Jacobi theta function (tau = u + iv, where u and v are real numbers)
#' @return A single numeric value with the computed Jacobi theta function.
#' @examples
#' # Jacobi Theta Functions
#' x <- 0.5
#' q <- 0.9
#' tau <- 1.5
#' jacobi_theta1(x, q)
#' jacobi_theta1tau(x, tau)
#' jacobi_theta2(x, q)
#' jacobi_theta2tau(x, tau)
#' jacobi_theta3(x, q)
#' jacobi_theta3tau(x, tau)
#' jacobi_theta3m1(x, q)
#' jacobi_theta3m1tau(x, tau)
#' jacobi_theta4(x, q)
#' jacobi_theta4tau(x, tau)
#' jacobi_theta4m1(x, q)
#' jacobi_theta4m1tau(x, tau)
NULL

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta1 <- function(x, q) {
  .Call(`jacobi_theta1_`, x, q)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta1tau <- function(x, tau) {
  .Call(`jacobi_theta1tau_`, x, tau)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta2 <- function(x, q) {
  .Call(`jacobi_theta2_`, x, q)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta2tau <- function(x, tau) {
  .Call(`jacobi_theta2tau_`, x, tau)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta3 <- function(x, q) {
  .Call(`jacobi_theta3_`, x, q)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta3tau <- function(x, tau) {
  .Call(`jacobi_theta3tau_`, x, tau)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta3m1 <- function(x, q) {
  .Call(`jacobi_theta3m1_`, x, q)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta3m1tau <- function(x, tau) {
  .Call(`jacobi_theta3m1tau_`, x, tau)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta4 <- function(x, q) {
  .Call(`jacobi_theta4_`, x, q)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta4tau <- function(x, tau) {
  .Call(`jacobi_theta4tau_`, x, tau)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta4m1 <- function(x, q) {
  .Call(`jacobi_theta4m1_`, x, q)
}

#' @rdname jacobi_theta_functions
#' @export
jacobi_theta4m1tau <- function(x, tau) {
  .Call(`jacobi_theta4m1tau_`, x, tau)
}
