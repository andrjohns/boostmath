#' @title Floating Point Utilities
#' @name fp_utilities
#' @description Utilities for floating point number manipulation and analysis.
#' @param x A numeric value.
#' @param y A numeric value.
#' @param distance Integer number of ULPS to advance by.
#' @return A numeric value after performing the specified floating point operation.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/utils.html) for more details on the mathematical background.
#' @examples
#' print(float_next(1.0), digits = 20)
#' print(float_distance(1.0, 2.0), digits = 20)
#' print(float_prior(1.0), digits = 20)
#' print(float_advance(1.0, 10), digits = 20)
#' print(ulp(1.0), digits = 20)
#' print(relative_difference(1.1, 1.1000009), digits = 20)
#' print(epsilon_difference(1.1, 1.1000009), digits = 20)
NULL

#' @rdname fp_utilities
#' @export
float_next <- function(x) {
  .Call(`float_next_`, x)
}

#' @rdname fp_utilities
#' @export
float_prior <- function(x) {
  .Call(`float_prior_`, x)
}

#' @rdname fp_utilities
#' @export
float_distance <- function(x, y) {
  .Call(`float_distance_`, x, y)
}

#' @rdname fp_utilities
#' @export
float_advance <- function(x, distance) {
  .Call(`float_advance_`, x, distance)
}

#' @rdname fp_utilities
#' @export
ulp <- function(x) {
  .Call(`ulp_`, x)
}

#' @rdname fp_utilities
#' @export
relative_difference <- function(x, y) {
  .Call(`relative_difference_`, x, y)
}

#' @rdname fp_utilities
#' @export
epsilon_difference <- function(x, y) {
  .Call(`epsilon_difference_`, x, y)
}

#' @title Condition Numbers
#' @description Functions to compute condition numbers for summation operations.
#' @name condition_numbers
#' @param f A function for which to compute the condition number.
#' @param x A numeric value.
#' @param kahan A logical value indicating whether to use Kahan summation.
#' @return For `summation_condition_number`, an object with methods to compute the condition number, sum, L1 norm, and to add or subtract values. For `evaluation_condition_number`, a numeric value representing the condition number of the function evaluation at `x`.
#' @examples
#' # Create a summation condition number object
#' scn <- summation_condition_number(kahan = TRUE)
#' # Add some values
#' scn$add(1.0)
#' scn$add(2.0)
#' scn$add(3.0)
#' # Compute sum, condition number, and L1 norm
#' print(scn$sum())
#' print(scn$condition_number())
#' print(scn$l1_norm())
#' # Compute evaluation condition number for a function
#' f <- function(x) { x^2 + 3*x + 2 }
#' print(evaluation_condition_number(f, 1.0))
NULL

#' @rdname condition_numbers
#' @export
summation_condition_number <- function(x = 0, kahan = TRUE) {
  extptr <- .Call(`summation_condition_number_`, kahan, x)
  structure(
    list(
      condition_number = function() { .Call(`summation_condition_number_op_`, extptr, kahan, "condition_number", NA_real_) },
      sum = function() { .Call(`summation_condition_number_op_`, extptr, kahan, "sum", NA_real_) },
      l1_norm = function() { .Call(`summation_condition_number_op_`, extptr, kahan, "l1_norm", NA_real_) },
      add = function(y) { invisible(.Call(`summation_condition_number_op_`, extptr, kahan, "add", y)) },
      subtract = function(y) { invisible(.Call(`summation_condition_number_op_`, extptr, kahan, "subtract", y)) }
    ),
    class = "summation_condition_number"
  )
}

#' @rdname condition_numbers
#' @export
evaluation_condition_number <- function(f, x) {
  .Call(`evaluation_condition_number_`, f, x)
}
