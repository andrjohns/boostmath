// Disable usage of C++17 execution policies
// As can require linking TBB on some platforms
#ifndef BOOST_MATH_NO_CXX17_HDR_EXECUTION
#define BOOST_MATH_NO_CXX17_HDR_EXECUTION
#endif

#include <boost/math/statistics/anderson_darling.hpp>
#include <boost/math/statistics/bivariate_statistics.hpp>
#include <boost/math/statistics/chatterjee_correlation.hpp>
#include <boost/math/statistics/linear_regression.hpp>
#include <boost/math/statistics/ljung_box.hpp>
#include <boost/math/statistics/runs_test.hpp>
#include <boost/math/statistics/signal_statistics.hpp>
#include <boost/math/statistics/t_test.hpp>
#include <boost/math/statistics/univariate_statistics.hpp>
#include <boost/math/statistics/z_test.hpp>
#include "boostmath/macros.hpp"

TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, anderson_darling_normality_statistic, std::vector<double>, double, double);

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, covariance, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, means_and_covariance, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, correlation_coefficient, std::vector<double>, std::vector<double>);

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, chatterjee_correlation, std::vector<double>, std::vector<double>);

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, simple_ordinary_least_squares, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, simple_ordinary_least_squares_with_R_squared, std::vector<double>, std::vector<double>);

TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, ljung_box, std::vector<double>, int64_t, int64_t);

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, runs_above_and_below_threshold, std::vector<double>, double);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, runs_above_and_below_median, std::vector<double>);

UNARY_BOOST_FUNCTION_NAMESPACE(statistics, absolute_gini_coefficient, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, sample_absolute_gini_coefficient, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, hoyer_sparsity, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, oracle_snr, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, oracle_snr_db, std::vector<double>, std::vector<double>);
TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, m2m4_snr_estimator, std::vector<double>, double, double);
TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, m2m4_snr_estimator_db, std::vector<double>, double, double);

QUARTERNARY_BOOST_FUNCTION_NAMESPACE_SUFFIX(statistics, one_sample_t_test, params_, double, double, double, double);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, one_sample_t_test, std::vector<double>, double);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, two_sample_t_test, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, paired_samples_t_test, std::vector<double>, std::vector<double>);

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

QUARTERNARY_BOOST_FUNCTION_NAMESPACE_SUFFIX(statistics, one_sample_z_test, params_, double, double, double, double);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, one_sample_z_test, std::vector<double>, double);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, two_sample_z_test, std::vector<double>, std::vector<double>);
