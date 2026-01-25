#' @title Jacobi Theta Functions
#' @name jacobi_theta_functions
#' @description
#' Functions to compute the four Jacobi theta functions θ₁, θ₂, θ₃, θ₄, which are
#' inter-related periodic functions parameterized by either q (nome) or τ.
#'
#' Jacobi theta functions are fundamental in the theory of elliptic functions, modular
#' forms, and appear in number theory, string theory, and solutions to the heat equation
#' on a circle.
#'
#' **The Four Theta Functions:**
#'
#' * **θ₁(x, q)** - First Jacobi theta function
#' * **θ₂(x, q)** - Second Jacobi theta function
#' * **θ₃(x, q)** - Third Jacobi theta function
#' * **θ₄(x, q)** - Fourth Jacobi theta function
#'
#' These are periodic functions of x expressed in terms of the nome parameter q.
#'
#' **Parametrizations:**
#'
#' * **q-parameterization:**
#'   Functions with q parameter where 0 < q < 1. These are equivalent to Mathematica's
#'   EllipticTheta function (whose first argument is the function number).
#'   - `jacobi_theta1(x, q)`, `jacobi_theta2(x, q)`, `jacobi_theta3(x, q)`, `jacobi_theta4(x, q)`
#'
#' * **τ-parameterization:**
#'   Alternative form where q is expressed through τ. The mathematical τ is assumed to be
#'   purely imaginary, but the Boost argument is real-valued and implicitly multiplied by i.
#'   - `jacobi_theta1tau(x, tau)`, `jacobi_theta2tau(x, tau)`, etc.
#'
#' **Special "Minus 1" Variants:**
#'
#' Similar to expm1(), these functions return one less than the evaluated function,
#' yielding increased accuracy when q is small:
#' * `jacobi_theta3m1(x, q)` = θ₃(x, q) - 1
#' * `jacobi_theta4m1(x, q)` = θ₄(x, q) - 1
#' * Also available in τ-parameterization: `jacobi_theta3m1tau`, `jacobi_theta4m1tau`
#'
#' **Relationships:**
#'
#' The four theta functions are closely related through addition formulas and
#' transformations. They satisfy various identities and can be expressed in terms
#' of infinite series or products.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi_theta.html) for more details on the mathematical background.
#' @param x Input value (argument of the theta function)
#' @param q The nome parameter of the Jacobi theta function (0 < q < 1)
#' @param tau The nome parameter in τ-form (real-valued, implicitly multiplied by i)
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
