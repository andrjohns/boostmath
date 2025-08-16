#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/bivariate_statistics.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, covariance, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, means_and_covariance, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, correlation_coefficient, std::vector<double>, std::vector<double>);
