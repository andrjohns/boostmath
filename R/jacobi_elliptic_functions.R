#' @title Jacobi Elliptic Functions
#' @name jacobi_elliptic_functions
#' @description
#' Functions to compute the Jacobi elliptic functions, which are doubly periodic
#' generalizations of trigonometric and hyperbolic functions.
#'
#' Jacobi elliptic functions are fundamental in the theory of elliptic functions and appear
#' in solutions to nonlinear differential equations, including the pendulum equation,
#' and in the theory of elliptic curves.
#'
#' **Three Principal Functions:**
#'
#' The three copolar Jacobi elliptic functions are:
#' * **sn(u, k)** - Sine amplitude
#' * **cn(u, k)** - Cosine amplitude
#' * **dn(u, k)** - Delta amplitude
#'
#' These satisfy the fundamental identity: sn^2 + cn^2 = 1 and dn^2 + k^2sn^2 = 1
#'
#' **Parameter Notation:**
#'
#' * k = elliptic modulus (used in this implementation)
#' * Alternative notations: m = k^2 (parameter), alpha = modular angle where k = sin(alpha)
#'
#' **Special Cases:**
#'
#' * sn(0, k) = 0; cn(0, k) = dn(0, k) = 1
#' * When k = 0: sn(u, 0) = sin(u); cn(u, 0) = cos(u); dn(u, 0) = 1
#' * When k = 1: sn(u, 1) = tanh(u); cn(u, 1) = dn(u, 1) = sech(u)
#'
#' **Derived Functions:**
#'
#' Twelve Jacobi elliptic functions exist, derived from ratios of sn, cn, dn:
#' * cd = cn/dn, cs = cn/sn, dc = dn/cn, ds = dn/sn
#' * nc = 1/cn, nd = 1/dn, ns = 1/sn
#' * sc = sn/cn, sd = sn/dn
#'
#' All functions satisfy double periodicity and various addition formulas analogous
#' to trigonometric identities.
#'
#' **Implementation:**
#'
#' Values are calculated using the arithmetic-geometric mean (AGM) method.
#' For k > 1, transformation relations apply the complementary modulus.
#' The function `jacobi_elliptic(k, u)` returns all three principal functions
#' simultaneously for efficiency.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi.html) for more details on the mathematical background.
#' @param k Elliptic modulus (typically 0 <= k <= 1, but k > 1 uses complementary relations)
#' @param u Argument of the elliptic functions
#' @return For `jacobi_elliptic`, a list containing the values of the Jacobi elliptic functions: `sn`, `cn`, `dn`. For individual functions, a single numeric value is returned.
#' @examples
#' # All three principal Jacobi Elliptic Functions at once
#' k <- 0.5
#' u <- 2
#' jacobi_elliptic(k, u)
#' # Individual Jacobi Elliptic Functions
#' jacobi_cd(k, u)
#' jacobi_cn(k, u)
#' jacobi_cs(k, u)
#' jacobi_dc(k, u)
#' jacobi_dn(k, u)
#' jacobi_ds(k, u)
#' jacobi_nc(k, u)
#' jacobi_nd(k, u)
#' jacobi_ns(k, u)
#' jacobi_sc(k, u)
#' jacobi_sd(k, u)
#' jacobi_sn(k, u)
NULL

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_elliptic <- function(k, u) {
  .Call(`jacobi_elliptic_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_cd <- function(k, u) {
  .Call(`jacobi_cd_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_cn <- function(k, u) {
  .Call(`jacobi_cn_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_cs <- function(k, u) {
  .Call(`jacobi_cs_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_dc <- function(k, u) {
  .Call(`jacobi_dc_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_dn <- function(k, u) {
  .Call(`jacobi_dn_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_ds <- function(k, u) {
  .Call(`jacobi_ds_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_nc <- function(k, u) {
  .Call(`jacobi_nc_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_nd <- function(k, u) {
  .Call(`jacobi_nd_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_ns <- function(k, u) {
  .Call(`jacobi_ns_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_sc <- function(k, u) {
  .Call(`jacobi_sc_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_sd <- function(k, u) {
  .Call(`jacobi_sd_`, k, u)
}

#' @rdname jacobi_elliptic_functions
#' @export
jacobi_sn <- function(k, u) {
  .Call(`jacobi_sn_`, k, u)
}
