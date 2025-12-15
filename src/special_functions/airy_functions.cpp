#include <boost/math/special_functions/airy.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION(airy_ai, double);
UNARY_BOOST_FUNCTION(airy_bi, double);
UNARY_BOOST_FUNCTION(airy_ai_prime, double);
UNARY_BOOST_FUNCTION(airy_bi_prime, double);
UNARY_BOOST_FUNCTION(airy_ai_zero, int);
UNARY_BOOST_FUNCTION(airy_bi_zero, int);
BINARY_BOOST_FUNCTION_VECTOR_SUFFIX(airy_ai_zero, multiple_, uint64_t, uint64_t);
BINARY_BOOST_FUNCTION_VECTOR_SUFFIX(airy_bi_zero, multiple_, uint64_t, uint64_t);
