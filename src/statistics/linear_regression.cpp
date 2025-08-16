#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/linear_regression.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, simple_ordinary_least_squares, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, simple_ordinary_least_squares_with_R_squared, std::vector<double>, std::vector<double>);
