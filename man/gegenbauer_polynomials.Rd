% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/polynomials.R
\name{gegenbauer_polynomials}
\alias{gegenbauer_polynomials}
\alias{gegenbauer}
\alias{gegenbauer_prime}
\alias{gegenbauer_derivative}
\title{Gegenbauer Polynomials and Related Functions}
\usage{
gegenbauer(n, lambda, x)

gegenbauer_prime(n, lambda, x)

gegenbauer_derivative(n, lambda, x, k)
}
\arguments{
\item{n}{Degree of the polynomial}

\item{lambda}{Parameter of the polynomial}

\item{x}{Argument of the polynomial}

\item{k}{Order of the derivative}
}
\value{
A single numeric value with the computed Gegenbauer polynomial, its derivative, or k-th derivative.
}
\description{
Functions to compute Gegenbauer polynomials, their derivatives, and related functions.
}
\examples{
# Gegenbauer polynomial C_2^(1)(0.5)
gegenbauer(2, 1, 0.5)
# Derivative of the Gegenbauer polynomial C_2^(1)'(0.5)
gegenbauer_prime(2, 1, 0.5)
# k-th derivative of the Gegenbauer polynomial C_2^(1)''(0.5)
gegenbauer_derivative(2, 1, 0.5, 2)
}
\seealso{
\href{https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/gegenbauer.html}{Boost Documentation} for more details on the mathematical background.
}
