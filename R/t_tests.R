#' @title T-Tests
#' @name t_tests
#' @description Functions for T - Tests.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/t_test.html) for more details on the mathematical background.
#' @param sample_mean A single value.
#' @param sample_variance A single value.
#' @param num_samples A single value.
#' @param assumed_mean A single value.
#' @param u A numeric vector.
#' @param v A numeric vector.
#' @return A two-element numeric vector containing the t-statistic and the p-value.
#' @examples
#' # One Sample T-Test Parameters
#' one_sample_t_test_params(sample_mean = 2, sample_variance = 1, num_samples = 30, assumed_mean = 0)
#' # One Sample T-Test
#' one_sample_t_test(c(5, 6, 7), assumed_mean = 4)
#' # Two Sample T-Test
#' two_sample_t_test(c(5, 6, 7), c(4, 5, 6))
#' # Paired Samples T-Test
#' paired_samples_t_test(c(5, 6, 7), c(4, 5, 6))
NULL

#' @rdname t_tests
#' @export
one_sample_t_test_params <- function(sample_mean, sample_variance, num_samples, assumed_mean) {
  .Call(`one_sample_t_test_params_`, sample_mean, sample_variance, num_samples, assumed_mean)
}

#' @rdname t_tests
#' @export
one_sample_t_test <- function(u, assumed_mean) {
  .Call(`one_sample_t_test_`, u, assumed_mean)
}

#' @rdname t_tests
#' @export
two_sample_t_test <- function(u, v) {
  .Call(`two_sample_t_test_`, u, v)
}

#' @rdname t_tests
#' @export
paired_samples_t_test <- function(u, v) {
  .Call(`paired_samples_t_test_`, u, v)
}
