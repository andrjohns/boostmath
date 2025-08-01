% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chi_squared_distribution.R
\name{chi_squared_distribution}
\alias{chi_squared_distribution}
\alias{chi_squared_pdf}
\alias{chi_squared_lpdf}
\alias{chi_squared_cdf}
\alias{chi_squared_lcdf}
\alias{chi_squared_quantile}
\title{Chi-Squared Distribution Functions}
\usage{
chi_squared_pdf(x, df)

chi_squared_lpdf(x, df)

chi_squared_cdf(x, df)

chi_squared_lcdf(x, df)

chi_squared_quantile(p, df)
}
\arguments{
\item{x}{quantile}

\item{df}{degrees of freedom (df > 0)}

\item{p}{probability (0 <= p <= 1)}
}
\value{
A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
}
\description{
Functions to compute the probability density function, cumulative distribution function, and quantile function for the Chi-Squared distribution.
}
\examples{
# Chi-Squared distribution with 3 degrees of freedom
chi_squared_pdf(2, 3)
chi_squared_lpdf(2, 3)
chi_squared_cdf(2, 3)
chi_squared_lcdf(2, 3)
chi_squared_quantile(0.5, 3)
}
\seealso{
\href{https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/chi_squared_dist.html}{Boost Documentation} for more details on the mathematical background.
}
