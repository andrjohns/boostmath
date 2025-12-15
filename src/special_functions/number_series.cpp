#include <boost/math/special_functions/bernoulli.hpp>
#include <boost/math/special_functions/prime.hpp>
#include <boost/math/special_functions/fibonacci.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION(bernoulli_b2n, double);
UNARY_BOOST_FUNCTION(unchecked_bernoulli_b2n, int);
UNARY_BOOST_FUNCTION(tangent_t2n, double);
UNARY_BOOST_FUNCTION(fibonacci, int);
UNARY_BOOST_FUNCTION(unchecked_fibonacci, int);
BINARY_BOOST_FUNCTION_VECTOR_SUFFIX(bernoulli_b2n, range_, uint64_t, uint64_t);
BINARY_BOOST_FUNCTION_VECTOR_SUFFIX(tangent_t2n, range_, uint64_t, uint64_t);
NOARG_BOOST_MEMBER_VALUE(max_bernoulli_b2n);
UNARY_BOOST_FUNCTION_NOTYPE(prime, int);
NOARG_BOOST_MEMBER(max_prime)
