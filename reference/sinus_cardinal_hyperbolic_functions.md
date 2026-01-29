# Sinus Cardinal and Hyperbolic Sinus Cardinal Functions

Functions to compute the sinus cardinal (sinc) and hyperbolic sinus
cardinal (sinhc) functions.

These functions appear in signal processing, Fourier analysis, and
various mathematical applications. The implementations avoid numerical
instability near x = 0.

**Sinus Cardinal Function:**

The sinc function is defined as: \$\$sinc(\pi x) = \frac{\sin(\pi
x)}{\pi x}\$\$

- `sinc_pi(x)`: Computes sinc(pix) = sin(pix)/(pix)

- Special value: sinc_pi(0) = 1 (by L'Hopital's rule or Taylor series)

- The function oscillates with decreasing amplitude as \|x\| increases

- Used extensively in signal processing (ideal low-pass filter impulse
  response)

- Appears in the Whittaker-Shannon interpolation formula

**Hyperbolic Sinus Cardinal Function:**

The hyperbolic sinc function is defined as: \$\$sinhc(\pi x) =
\frac{\sinh(\pi x)}{\pi x}\$\$

- `sinhc_pi(x)`: Computes sinhc(pix) = sinh(pix)/(pix)

- Special value: sinhc_pi(0) = 1 (by L'Hopital's rule or Taylor series)

- The function grows exponentially for large \|x\|

- Analogous to sinc but using hyperbolic sine instead of circular sine

**Numerical Stability:**

Both functions use Taylor series expansions near x = 0 to avoid division
by zero and loss of precision. For x away from 0, direct evaluation is
used.

## Usage

``` r
sinc_pi(x)

sinhc_pi(x)
```

## Arguments

- x:

  Input value

## Value

A single numeric value with the computed sinus cardinal or hyperbolic
sinus cardinal function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sinc.html)
for more details on the mathematical background.

## Examples

``` r
# Sinus cardinal function at x = 0.5: sinc(pi/2)
sinc_pi(0.5)
#> [1] 0.9588511
# Sinus cardinal at zero (returns exactly 1)
sinc_pi(0)
#> [1] 1
# Hyperbolic sinus cardinal function
sinhc_pi(0.5)
#> [1] 1.042191
# Hyperbolic sinus cardinal at zero (returns exactly 1)
sinhc_pi(0)
#> [1] 1
```
