#include <boost/math/special_functions/bessel.hpp>
#include <boost/math/special_functions/bessel_prime.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION(cyl_bessel_j, double, double);
BINARY_BOOST_FUNCTION(cyl_neumann, double, double);
BINARY_BOOST_FUNCTION(cyl_bessel_j_zero, double, int);
BINARY_BOOST_FUNCTION(cyl_neumann_zero, double, int);
BINARY_BOOST_FUNCTION(cyl_bessel_i, double, double);
BINARY_BOOST_FUNCTION(cyl_bessel_k, double, double);
BINARY_BOOST_FUNCTION(sph_bessel, uint64_t, double);
BINARY_BOOST_FUNCTION(sph_neumann, uint64_t, double);
BINARY_BOOST_FUNCTION(cyl_bessel_j_prime, double, double);
BINARY_BOOST_FUNCTION(cyl_neumann_prime, double, double);
BINARY_BOOST_FUNCTION(cyl_bessel_i_prime, double, double);
BINARY_BOOST_FUNCTION(cyl_bessel_k_prime, double, double);
BINARY_BOOST_FUNCTION(sph_bessel_prime, uint64_t, double);
BINARY_BOOST_FUNCTION(sph_neumann_prime, uint64_t, double);
TERNARY_BOOST_FUNCTION_VECTOR_SUFFIX(cyl_bessel_j_zero, multiple_, double, uint64_t, uint64_t);
TERNARY_BOOST_FUNCTION_VECTOR_SUFFIX(cyl_neumann_zero, multiple_, double, uint64_t, uint64_t);
