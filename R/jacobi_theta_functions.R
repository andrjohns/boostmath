#' @title Jacobi Theta Functions
#' @name jacobi_theta_functions
#' @description
#' Functions to compute the four Jacobi theta functions theta_1, theta_2, theta_3, theta_4, which are
#' inter-related periodic functions parameterised by either q (nome) or tau.
#'
#' **Jacobi Theta Function \eqn{\theta_1}**
#'
#' * `jacobi_theta1(x, q)`: First Jacobi theta function, nome parameterisation:
#'
#' \deqn{\theta_1(x, q) = 2\sum_{n=0}^\infty(-1)^n q^{(n + \frac{1}{2})^2}\text{sin}((2n+1)x)}
#'
#' * `jacobi_theta1tau(x, tau)`: First Jacobi theta function, tau parameterisation:
#'
#' \deqn{\theta_1(x | \tau) = 2\sum_{n=0}^\infty(-1)^n \exp(i\pi\tau(n+0.5)^2) \text{sin}((2n+1)x)}
#'
#' **Jacobi Theta Function \eqn{\theta_2}**
#'
#' * `jacobi_theta2(x, q)`: Second Jacobi theta function, nome parameterisation:
#'
#' \deqn{\theta_2(x, q) = 2\sum_{n=0}^\infty q^{(n + \frac{1}{2})^2} \text{cos}((2n+1)x)}
#'
#' * `jacobi_theta2tau(x, tau)`: Second Jacobi theta function, tau parameterisation:
#'
#' \deqn{\theta_2(x | \tau) = 2\sum_{n=0}^\infty \exp(i\pi\tau(n+0.5)^2) \text{cos}((2n+1)x)}
#'
#' **Jacobi Theta Function \eqn{\theta_3}**
#'
#' * `jacobi_theta3(x, q)`: Third Jacobi theta function, nome parameterisation:
#'
#' \deqn{\theta_3(x, q) = 1 + 2\sum_{n=0}^\infty q^{n^2} \text{cos}((2nx)}
#'
#' * `jacobi_theta3tau(x, tau)`: Third Jacobi theta function, tau parameterisation:
#'
#' \deqn{\theta_3(x | \tau) = 1 + 2\sum_{n=0}^\infty \exp(i\pi\tau n^2) \text{cos}(2nx)}
#'
#' **Jacobi Theta Function \eqn{\theta_4}**
#'
#' * `jacobi_theta4(x, q)`: Fourth Jacobi theta function, nome parameterisation:
#'
#' \deqn{\theta_4(x, q) = 1 + 2\sum_{n=0}^\infty (-1)^n q^{n^2} \text{cos}((2nx)}
#'
#' * `jacobi_theta4tau(x, tau)`: Fourth Jacobi theta function, tau parameterisation:
#'
#' \deqn{\theta_4(x | \tau) = 1 + 2\sum_{n=0}^\infty (-1)^n \exp(i\pi\tau n^2) \text{cos}(2nx)}
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi_theta.html) for more details on the mathematical background.
#' @param x Input value (argument of the theta function)
#' @param q The nome parameter of the Jacobi theta function (0 < q < 1)
#' @param tau The nome parameter in tau-form (real-valued, implicitly multiplied by i)
#' @return A single numeric value with the computed Jacobi theta function.
#' @examples
#' # Jacobi Theta Functions with q parametrization
#' x <- 0.5
#' q <- 0.3  # Note: q should be in (0, 1)
#' tau <- 1.5
#' jacobi_theta1(x, q)
#' jacobi_theta1tau(x, tau)
#' jacobi_theta2(x, q)
#' jacobi_theta2tau(x, tau)
#' jacobi_theta3(x, q)
#' jacobi_theta3tau(x, tau)
#' # Special "minus 1" variants for improved accuracy when q is small
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
