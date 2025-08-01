% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inverse_chi_squared_distribution.R
\name{inverse_chi_squared_distribution}
\alias{inverse_chi_squared_distribution}
\alias{inverse_chi_squared_pdf}
\alias{inverse_chi_squared_lpdf}
\alias{inverse_chi_squared_cdf}
\alias{inverse_chi_squared_lcdf}
\alias{inverse_chi_squared_quantile}
\title{Inverse Chi-Squared Distribution Functions}
\usage{
inverse_chi_squared_pdf(x, df, scale = 1)

inverse_chi_squared_lpdf(x, df, scale = 1)

inverse_chi_squared_cdf(x, df, scale = 1)

inverse_chi_squared_lcdf(x, df, scale = 1)

inverse_chi_squared_quantile(p, df, scale = 1)
}
\arguments{
\item{x}{quantile}

\item{df}{degrees of freedom (df > 0)}

\item{scale}{scale parameter (default is 1)}

\item{p}{probability (0 <= p <= 1)}
}
\value{
A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
}
\description{
Functions to compute the probability density function, cumulative distribution function, and quantile function for the Inverse Chi-Squared distribution.
}
\examples{
# Inverse Chi-Squared distribution with 3 degrees of freedom, scale = 1
inverse_chi_squared_pdf(2, 3, 1)
inverse_chi_squared_lpdf(2, 3, 1)
inverse_chi_squared_cdf(2, 3, 1)
inverse_chi_squared_lcdf(2, 3, 1)
inverse_chi_squared_quantile(0.5, 3, 1)
}
\seealso{
\href{https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_chi_squared_dist.html}{Boost Documentation} for more details on the mathematical background.
}
