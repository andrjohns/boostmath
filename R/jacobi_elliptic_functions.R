#' @title Jacobi Elliptic Functions
#' @name jacobi_elliptic_functions
#' @description
#' Functions to compute the Jacobi elliptic functions, which are doubly periodic
#' generalizations of trigonometric and hyperbolic functions.
#'
#' **Jacobi Elliptic SN, CN and DN**
#' Given:
#'
#' \deqn{u = \int_0^\phi\frac{d\psi}{\sqrt{1-k^2\text{sin}^2\psi}}}
#'
#' * `jacobi_sn(k, u)`: \eqn{\text{sin}\psi}
#' * `jacobi_cn(k, u)`: \eqn{\text{cos}\psi}
#' * `jacobi_dn(k, u)`: \eqn{\sqrt{(1 - k^2\text{sin}^2\psi)}}
#' * `jacobi_cd(k, u)`: \eqn{\frac{cn(k, u)}{dn(k, u)}}
#' * `jacobi_cs(k, u)`: \eqn{\frac{cn(k, u)}{sn(k, u)}}
#' * `jacobi_dc(k, u)`: \eqn{\frac{dn(k, u)}{cn(k, u)}}
#' * `jacobi_ds(k, u)`: \eqn{\frac{dn(k, u)}{sn(k, u)}}
#' * `jacobi_nc(k, u)`: \eqn{\frac{1}{cn(k, u)}}
#' * `jacobi_nd(k, u)`: \eqn{\frac{1}{dn(k, u)}}
#' * `jacobi_ns(k, u)`: \eqn{\frac{1}{sn(k, u)}}
#' * `jacobi_sc(k, u)`: \eqn{\frac{sn(k, u)}{cn(k, u)}}
#' * `jacobi_sd(k, u)`: \eqn{\frac{sn(k, u)}{dn(k, u)}}
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
