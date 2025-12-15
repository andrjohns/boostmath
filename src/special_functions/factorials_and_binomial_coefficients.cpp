#include <boost/math/special_functions/factorials.hpp>
#include <boost/math/special_functions/binomial.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION(factorial, uint64_t);
UNARY_BOOST_FUNCTION(unchecked_factorial, uint64_t);
UNARY_BOOST_FUNCTION(double_factorial, uint64_t);
BINARY_BOOST_FUNCTION(rising_factorial, double, uint64_t);
BINARY_BOOST_FUNCTION(falling_factorial, double, uint64_t);
NOARG_BOOST_MEMBER_VALUE(max_factorial);
BINARY_BOOST_FUNCTION_TYPE(binomial_coefficient, double, uint64_t, uint64_t);
