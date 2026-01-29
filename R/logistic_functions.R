#' @title Logistic Functions
#' @name logistic_functions
#' @description
#' Functions to compute the logistic sigmoid function and its inverse, the logit function.
#'
#' These functions are fundamental in statistics, machine learning, and probability theory,
#' particularly in logistic regression and neural networks.
#'
#' **Logistic Sigmoid Function:**
#'
#' The logistic sigmoid (also called the logistic function or expit) is defined as:
#' \deqn{\sigma(x) = \frac{1}{1 + e^{-x}} = \frac{e^x}{1 + e^x}}
#'
#' * `logistic_sigmoid(x)`: Computes σ(x)
#' * Domain: (-∞, ∞)
#' * Range: (0, 1)
#' * S-shaped (sigmoid) curve
#' * Symmetric around x = 0: σ(-x) = 1 - σ(x)
#' * Special values:
#'   - σ(0) = 0.5
#'   - σ(∞) = 1
#'   - σ(-∞) = 0
#' * Derivative: σ'(x) = σ(x)(1 - σ(x))
#'
#' **Applications:**
#' * Activation function in neural networks
#' * Models probability in logistic regression
#' * Converts log-odds to probabilities
#' * Smooth approximation to step functions
#'
#' **Logit Function:**
#'
#' The logit function (log-odds or inverse sigmoid) is defined as:
#' \deqn{logit(p) = \log\left(\frac{p}{1 - p}\right)}
#'
#' * `logit(x)`: Computes logit(x) = log(x/(1-x))
#' * Domain: (0, 1)
#' * Range: (-∞, ∞)
#' * Inverse of the logistic sigmoid: logit(σ(x)) = x
#' * Odd function around p = 0.5: logit(1 - p) = -logit(p)
#' * Special values:
#'   - logit(0.5) = 0
#'   - logit(0) = -∞
#'   - logit(1) = ∞
#' * Derivative: d/dp logit(p) = 1/(p(1-p))
#'
#' **Applications:**
#' * Converts probabilities to log-odds scale
#' * Link function in logistic regression
#' * Transforms bounded quantities to unbounded scale
#' * Used in odds ratio calculations
#'
#' **Numerical Stability:**
#'
#' Both functions use numerically stable implementations that avoid overflow/underflow
#' for extreme values of their arguments.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/logistic.html)
#' for more details on the mathematical background.
#' @param x Numeric value for which to compute the functions
#' @return A single numeric value with the computed logit or logistic sigmoid function.
#' @examples
#' # Logistic Sigmoid Function
#' logistic_sigmoid(0)     # Returns 0.5
#' logistic_sigmoid(2)     # Returns ~0.881
#' logistic_sigmoid(-2)    # Returns ~0.119
#'
#' # Logit Function (inverse of sigmoid)
#' logit(0.5)              # Returns 0
#' logit(0.7)              # Returns ~0.847
#' logit(0.881)            # Returns ~2 (inverse of sigmoid(2))
NULL

#' @rdname logistic_functions
#' @export
logistic_sigmoid <- function(x) {
  .Call(`logistic_sigmoid_`, x)
}

#' @rdname logistic_functions
#' @export
logit <- function(x) {
  .Call(`logit_`, x)
}
