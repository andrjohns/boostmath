#ifndef BOOSTMATH_MACROS_HPP
#define BOOSTMATH_MACROS_HPP

#include "sexp.hpp"

#define NOARG_BOOST_FUNCTION(name) \
  extern "C" SEXP name##_() { \
    BEGIN_CPP11 \
    const auto result = boost::math::name(); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION(name, arg_type) \
  extern "C" SEXP name##_(SEXP x_) { \
    BEGIN_CPP11 \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    const auto result = boost::math::name<double>(x); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg_type) \
  extern "C" SEXP name##_(SEXP x_) { \
    BEGIN_CPP11 \
    arg_type x = boostmath::as_cpp<arg_type>(x_); \
    const auto result = boost::math::namespace::name(x); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION_SUFFIX(name, suffix, arg_type) \
  extern "C" SEXP name##_##suffix(SEXP x_) { \
    BEGIN_CPP11 \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    const auto result = boost::math::name(x); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION(name, arg1_type, arg2_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const auto result = boost::math::name(x, y); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const auto result = boost::math::namespace::name(x, y); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION_VECTOR_SUFFIX(name, suffix, arg1_type, arg2_type) \
  extern "C" SEXP name##_##suffix(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    std::vector<double> results; \
    boost::math::name<double>(x, y, std::back_inserter(results)); \
    return boostmath::as_sexp(results); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION_SUFFIX(name, suffix, arg1_type, arg2_type) \
  extern "C" SEXP name##_##suffix(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const auto result = boost::math::name(x, y); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define TERNARY_BOOST_FUNCTION(name, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const auto result = boost::math::name(x, y, z); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define TERNARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const auto result = boost::math::namespace::name(x, y, z); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define TERNARY_BOOST_FUNCTION_VECTOR_SUFFIX(name, suffix, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_##suffix(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    std::vector<double> results; \
    boost::math::name<double>(x, y, z, std::back_inserter(results)); \
    return boostmath::as_sexp(results); \
    END_CPP11 \
  }

#define TERNARY_BOOST_FUNCTION_SUFFIX(name, suffix, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_##suffix(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const auto result = boost::math::name(x, y, z); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define QUARTERNARY_BOOST_FUNCTION(name, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    const auto result = boost::math::name(x, y, z, w); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define QUARTERNARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    const auto result = boost::math::namespace::name(x, y, z, w); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define QUARTERNARY_BOOST_FUNCTION_NAMESPACE_SUFFIX(namespace, name, suffix, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_##suffix(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    const auto result = boost::math::namespace::name(x, y, z, w); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define BINARY_DISTRIBUTION_BOOST_IMPL(func, dist, arg1_type, arg2_type) \
  extern "C" SEXP dist##_##func##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const auto result = boost::math::func(boost::math::dist##_distribution<>(y), x); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define BINARY_DISTRIBUTION_BOOST(dist, arg1_type, arg2_type) \
  BINARY_DISTRIBUTION_BOOST_IMPL(pdf, dist, arg1_type, arg2_type) \
  BINARY_DISTRIBUTION_BOOST_IMPL(logpdf, dist, arg1_type, arg2_type) \
  BINARY_DISTRIBUTION_BOOST_IMPL(cdf, dist, arg1_type, arg2_type) \
  BINARY_DISTRIBUTION_BOOST_IMPL(logcdf, dist, arg1_type, arg2_type) \
  BINARY_DISTRIBUTION_BOOST_IMPL(quantile, dist, double, arg2_type)

#define TERNARY_DISTRIBUTION_BOOST_IMPL(func, dist, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP dist##_##func##_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const auto result = boost::math::func(boost::math::dist##_distribution<>(y, z), x); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define TERNARY_DISTRIBUTION_BOOST(dist, arg1_type, arg2_type, arg3_type) \
  TERNARY_DISTRIBUTION_BOOST_IMPL(pdf, dist, arg1_type, arg2_type, arg3_type) \
  TERNARY_DISTRIBUTION_BOOST_IMPL(logpdf, dist, arg1_type, arg2_type, arg3_type) \
  TERNARY_DISTRIBUTION_BOOST_IMPL(cdf, dist, arg1_type, arg2_type, arg3_type) \
  TERNARY_DISTRIBUTION_BOOST_IMPL(logcdf, dist, arg1_type, arg2_type, arg3_type) \
  TERNARY_DISTRIBUTION_BOOST_IMPL(quantile, dist, double, arg2_type, arg3_type)

#define QUARTERNARY_DISTRIBUTION_BOOST_IMPL(func, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP dist##_##func##_(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    const auto result = boost::math::func(boost::math::dist##_distribution<>(y, z, w), x); \
    return boostmath::as_sexp(result); \
    END_CPP11 \
  }

#define QUARTERNARY_DISTRIBUTION_BOOST(dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(pdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(logpdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(cdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(logcdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(quantile, dist, double, arg2_type, arg3_type, arg4_type)

#endif
