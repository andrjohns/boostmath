#include <boost/math/interpolators/bezier_polynomial.hpp>
#include "boostmath/macros.hpp"

POLYNOMIAL_UNARY_INIT_BOOST(bezier_polynomial, std::vector<std::array<double COMMA 3>>, std::vector<std::array<double COMMA 3>>)
POLYNOMIAL_UNARY_EVAL_BOOST(bezier_polynomial, std::vector<std::array<double COMMA 3>>, double)
POLYNOMIAL_UNARY_CALL_BOOST(bezier_polynomial, prime, std::vector<std::array<double COMMA 3>>, double)
POLYNOMIAL_BINARY_CALL_VOID_BOOST(bezier_polynomial, edit_control_point, std::vector<std::array<double COMMA 3>>, std::array<double COMMA 3>, std::size_t)
