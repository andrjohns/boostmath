#include <boost/math/tools/norms.hpp>
#include "boostmath/macros.hpp"

UNARY_BOOST_FUNCTION_NAMESPACE(tools, l0_pseudo_norm, std::vector<double>)
BINARY_BOOST_FUNCTION_NAMESPACE(tools, hamming_distance, std::vector<double>, std::vector<double>)
UNARY_BOOST_FUNCTION_NAMESPACE(tools, l1_norm, std::vector<double>)
BINARY_BOOST_FUNCTION_NAMESPACE(tools, l1_distance, std::vector<double>, std::vector<double>)
UNARY_BOOST_FUNCTION_NAMESPACE(tools, l2_norm, std::vector<double>)
BINARY_BOOST_FUNCTION_NAMESPACE(tools, l2_distance, std::vector<double>, std::vector<double>)
UNARY_BOOST_FUNCTION_NAMESPACE(tools, sup_norm, std::vector<double>)
BINARY_BOOST_FUNCTION_NAMESPACE(tools, sup_distance, std::vector<double>, std::vector<double>)
BINARY_BOOST_FUNCTION_NAMESPACE(tools, lp_norm, std::vector<double>, uint64_t)
TERNARY_BOOST_FUNCTION_NAMESPACE(tools, lp_distance, std::vector<double>, std::vector<double>, uint64_t)
UNARY_BOOST_FUNCTION_NAMESPACE(tools, total_variation, std::vector<double>)
