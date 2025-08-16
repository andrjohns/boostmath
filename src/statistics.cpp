// Disable usage of C++17 execution policies
// As can require linking TBB on some platforms
#ifndef BOOST_MATH_NO_CXX17_HDR_EXECUTION
#define BOOST_MATH_NO_CXX17_HDR_EXECUTION
#endif
#include "statistics/univariate_statistics.cpp"
#include "statistics/bivariate_statistics.cpp"
#include "statistics/signal_statistics.cpp"
#include "statistics/anderson_darling_test.cpp"
#include "statistics/t_tests.cpp"
#include "statistics/z_tests.cpp"
#include "statistics/runs_tests.cpp"
#include "statistics/ljung_box_test.cpp"
#include "statistics/linear_regression.cpp"
#include "statistics/chatterjee_correlation.cpp"
