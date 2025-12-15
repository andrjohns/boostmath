# Changelog

## boostmath 1.4.0

- Added `logit` and `logistic_sigmoid` functions
- Added `log_pi` constant
- Ooura fourier integrals now supported on platforms without long double
  support

## boostmath 1.3.0

CRAN release: 2025-11-03

- Added support for all Boost distribution functions (e.g., `pdf`,
  `kurtosis`, `variance`, etc.)
- Exposed additional distribution utility functions (e.g.,
  `binomial_find_lower_bound_on_p`,
  `chi_squared_find_degrees_of_freedom`)

## boostmath 1.2.0

CRAN release: 2025-09-15

- Added `filters`
- Interpolators now use `$interpolate()` instead of `$spline()`

## boostmath 1.1.0

CRAN release: 2025-09-04

- Added `statistics`, `interpolators`, and `constants`

## boostmath 1.0.2

CRAN release: 2025-07-31

- Remove `UseLTO` from `DESCRIPTION` to avoid R CMD check warning
- Use non-versioned Boost URL in `DESCRIPTION` (with thanks to Dirk
  Eddelbuettel)

## boostmath 1.0.1

- Fix ODR violation warning

## boostmath 1.0.0

CRAN release: 2025-07-25

- Initial release
