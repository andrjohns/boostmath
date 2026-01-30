#' @title Chatterjee Correlation
#' @name chatterjee_correlation
#' @description
#' Computes the Chatterjee correlation coefficient, a robust measure of dependence.
#' Unlike classical correlation coefficients (Pearson, Spearman), Chatterjee's coefficient
#' measures the degree to which `y` is a function of `x` (functional dependence),
#' capturing non-linear relationships.
#'
#' **Characteristics:**
#' *   **Functional Dependence:** Value is 1 if and only if `y` is a measurable function of `x`.
#' *   **Independence:** Value is 0 if `x` and `y` are independent.
#' *   **Range:** The coefficient is theoretically in \eqn{[0, 1]}.
#' *   **Asymmetry:** The measure is asymmetric; \eqn{C(X, Y) \neq C(Y, X)}. It specifically tests if $Y = f(X)$.
#'
#' @details
#' The coefficient is calculated using the ranks of `y` when sorted by `x`.
#' This implementation computes the sample version of the coefficient as described by Chatterjee (2021).
#'
#' **Formula:**
#' Given pairs \eqn{(X_i, Y_i)}, sort them such that \eqn{X_{(1)} \le \dots \le X_{(n)}}.
#' Let \eqn{r_i} be the rank of \eqn{Y_{(i)}}. The coefficient is:
#' \deqn{ \xi_n(X, Y) = 1 - \frac{3 \sum_{i=1}^{n-1} |r_{i+1} - r_i|}{n^2 - 1} }
#'
#' @param x A numeric vector (the predictor/independent variable).
#' @param y A numeric vector (the response/dependent variable).
#'
#' @return A numeric value representing the Chatterjee correlation coefficient.
#'
#' @return A numeric vector containing:
#' 1.  **Correlation Coefficient:** The Chatterjee correlation estimate.
#'
#' @references
#' Chatterjee, S. (2021). A new coefficient of correlation. Journal of the American Statistical Association, 116(536), 2009-2022.
#'
#' @seealso
#' [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/chatterjee_correlation.html)
#'
#' @examples
#' # Functional dependence (Y = X^2)
#' x <- runif(50, -1, 1)
#' y <- x^2
#' chatterjee_correlation(x, y) # Should be high (near 1)
#'
#' # Independence
#' x <- runif(50)
#' y <- runif(50)
#' chatterjee_correlation(x, y) # Should be low (near 0)
#'
#' # Asymmetry check
#' chatterjee_correlation(x, y)
#' chatterjee_correlation(y, x)
#' @export
chatterjee_correlation <- function(x, y) {
  .Call(`chatterjee_correlation_`, x, y)
}
