#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/univariate_statistics.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION_NAMESPACE(statistics, mean, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, variance, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, sample_variance, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, mean_and_sample_variance, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, skewness, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, kurtosis, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, excess_kurtosis, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, first_four_moments, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, median, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, median_absolute_deviation, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, interquartile_range, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, gini_coefficient, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, sample_gini_coefficient, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, mode, std::vector<double>);
