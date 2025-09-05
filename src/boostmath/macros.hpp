#ifndef BOOSTMATH_MACROS_HPP
#define BOOSTMATH_MACROS_HPP

#include "sexp.hpp"

#define NOARG_BOOST_FUNCTION(name) \
  extern "C" SEXP name##_() { \
    BEGIN_CPP11 \
    return boostmath::as_sexp(boost::math::name()); \
    END_CPP11 \
  }

#define NOARG_BOOST_MEMBER(name) \
  extern "C" SEXP name##_() { \
    BEGIN_CPP11 \
    return boostmath::as_sexp(boost::math::name); \
    END_CPP11 \
  }

#define NOARG_BOOST_MEMBER_VALUE(name) \
  extern "C" SEXP name##_() { \
    BEGIN_CPP11 \
    return boostmath::as_sexp(boost::math::name<double>::value); \
    END_CPP11 \
  }

#define NOARG_BOOST_FUNCTION_TYPE(name, template_type) \
  extern "C" SEXP name##_() { \
    BEGIN_CPP11 \
    return boostmath::as_sexp(boost::math::name<template_type>()); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION(name, arg_type) \
  extern "C" SEXP name##_(SEXP x_) { \
    BEGIN_CPP11 \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(boost::math::name<double>(x)); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION_NOTYPE(name, arg_type) \
  extern "C" SEXP name##_(SEXP x_) { \
    BEGIN_CPP11 \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(boost::math::name(x)); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg_type) \
  extern "C" SEXP name##_(SEXP x_) { \
    BEGIN_CPP11 \
    arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(boost::math::namespace::name(x)); \
    END_CPP11 \
  }

#define UNARY_BOOST_FUNCTION_SUFFIX(name, suffix, arg_type) \
  extern "C" SEXP name##_##suffix(SEXP x_) { \
    BEGIN_CPP11 \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(boost::math::name(x)); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION(name, arg1_type, arg2_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    return boostmath::as_sexp(boost::math::name(x, y)); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION_TYPE(name, template_type, arg1_type, arg2_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    return boostmath::as_sexp(boost::math::name<template_type>(x, y)); \
    END_CPP11 \
  }

#define BINARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    return boostmath::as_sexp(boost::math::namespace::name(x, y)); \
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
    return boostmath::as_sexp(boost::math::name(x, y)); \
    END_CPP11 \
  }

#define TERNARY_BOOST_FUNCTION(name, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    return boostmath::as_sexp(boost::math::name(x, y, z)); \
    END_CPP11 \
  }

#define TERNARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    return boostmath::as_sexp(boost::math::namespace::name(x, y, z)); \
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
    return boostmath::as_sexp(boost::math::name(x, y, z)); \
    END_CPP11 \
  }

#define QUARTERNARY_BOOST_FUNCTION(name, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    return boostmath::as_sexp(boost::math::name(x, y, z, w)); \
    END_CPP11 \
  }

#define QUARTERNARY_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    return boostmath::as_sexp(boost::math::namespace::name(x, y, z, w)); \
    END_CPP11 \
  }

#define QUARTERNARY_BOOST_FUNCTION_NAMESPACE_SUFFIX(namespace, name, suffix, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_##suffix(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    return boostmath::as_sexp(boost::math::namespace::name(x, y, z, w)); \
    END_CPP11 \
  }

#define PENTA_BOOST_FUNCTION_NAMESPACE(namespace, name, arg1_type, arg2_type, arg3_type, arg4_type, arg5_type) \
  extern "C" SEXP name##_(SEXP x_, SEXP y_, SEXP z_, SEXP w_, SEXP v_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    const arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    const arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    const arg4_type v = boostmath::as_cpp<arg4_type>(v_); \
    return boostmath::as_sexp(boost::math::namespace::name(x, y, z, w, v)); \
    END_CPP11 \
  }

#define BINARY_DISTRIBUTION_BOOST_IMPL(func, dist, arg1_type, arg2_type) \
  extern "C" SEXP dist##_##func##_(SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    return boostmath::as_sexp(boost::math::func(boost::math::dist##_distribution<>(y), x)); \
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
    return boostmath::as_sexp(boost::math::func(boost::math::dist##_distribution<>(y, z), x)); \
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
    return boostmath::as_sexp(boost::math::func(boost::math::dist##_distribution<>(y, z, w), x)); \
    END_CPP11 \
  }

#define QUARTERNARY_DISTRIBUTION_BOOST(dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(pdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(logpdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(cdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(logcdf, dist, arg1_type, arg2_type, arg3_type, arg4_type) \
  QUARTERNARY_DISTRIBUTION_BOOST_IMPL(quantile, dist, double, arg2_type, arg3_type, arg4_type)

#define POLYNOMIAL_UNARY_INIT_BOOST(name, template_type, arg_type) \
  extern "C" SEXP name##_init_(SEXP x_) { \
    BEGIN_CPP11 \
    arg_type x = boostmath::as_cpp<arg_type>(x_); \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(new boost::math::interpolators::name<template_type>(std::move(x))); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_TERNARY_INIT_BOOST(name, template_type, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_init_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(new boost::math::interpolators::name<template_type>(std::move(x), std::move(y), std::move(z))); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_TERNARY_INIT_NOSPACE_BOOST(name, template_type, arg1_type, arg2_type, arg3_type) \
  extern "C" SEXP name##_init_(SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    cpp11::external_pointer<boost::math::name<template_type>> ptr(new boost::math::name<template_type>(std::move(x), std::move(y), z)); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_QUARTERNARY_INIT_BOOST(name, template_type, arg1_type, arg2_type, arg3_type, arg4_type) \
  extern "C" SEXP name##_init_(SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(new boost::math::interpolators::name<template_type>(std::move(x), std::move(y), std::move(z), std::move(w))); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_PENTA_INIT_BOOST(name, template_type, arg1_type, arg2_type, arg3_type, arg4_type, arg5_type) \
  extern "C" SEXP name##_init_(SEXP x_, SEXP y_, SEXP z_, SEXP w_, SEXP v_) { \
    BEGIN_CPP11 \
    arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    arg5_type v = boostmath::as_cpp<arg5_type>(v_); \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(new boost::math::interpolators::name<template_type>(std::move(x), std::move(y), std::move(z), w, v)); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_HEPTA_INIT_BOOST(name, template_type, arg1_type, arg2_type, arg3_type, arg4_type, arg5_type, arg6_type, arg7_type) \
  extern "C" SEXP name##_init_(SEXP x_, SEXP y_, SEXP z_, SEXP w_, SEXP v_, SEXP u_, SEXP t_) { \
    BEGIN_CPP11 \
    arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    arg5_type v = boostmath::as_cpp<arg5_type>(v_); \
    arg6_type u = boostmath::as_cpp<arg6_type>(u_); \
    arg7_type t = boostmath::as_cpp<arg6_type>(t_); \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(new boost::math::interpolators::name<template_type>(std::move(x), std::move(y), std::move(z), w, v, u, t)); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_PENTA_INIT_ITER_BOOST(name, template_type, arg1_type, arg2_type, arg3_type, arg4_type, arg5_type) \
  extern "C" SEXP name##_init_(SEXP x_, SEXP y_, SEXP z_, SEXP w_, SEXP v_) { \
    BEGIN_CPP11 \
    arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    arg2_type y = boostmath::as_cpp<arg2_type>(y_); \
    arg3_type z = boostmath::as_cpp<arg3_type>(z_); \
    arg4_type w = boostmath::as_cpp<arg4_type>(w_); \
    arg5_type v = boostmath::as_cpp<arg5_type>(v_); \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(new boost::math::interpolators::name<template_type>(x.begin(), x.end(), y, z, w, v)); \
    return ptr; \
    END_CPP11 \
  }

#define POLYNOMIAL_UNARY_EVAL_BOOST(name, template_type, arg_type) \
  extern "C" SEXP name##_eval_(SEXP ptr_, SEXP x_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(ptr->operator()(x)); \
    END_CPP11 \
  }

#define POLYNOMIAL_BINARY_EVAL_BOOST(name, template_type, arg1_type, arg2_type) \
  extern "C" SEXP name##_eval_(SEXP ptr_, SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    const arg1_type x = boostmath::as_cpp<arg1_type>(x_); \
    const arg2_type y = boostmath::as_cpp<arg1_type>(y_); \
    return boostmath::as_sexp(ptr->operator()(x, y)); \
    END_CPP11 \
  }

#define POLYNOMIAL_UNARY_EVAL_NOSPACE_BOOST(name, template_type, arg_type) \
  extern "C" SEXP name##_eval_(SEXP ptr_, SEXP x_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::name<template_type>> ptr(ptr_); \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(ptr->operator()(x)); \
    END_CPP11 \
  }

#define POLYNOMIAL_NOARG_CALL_NOSPACE_BOOST(name, call, template_type) \
  extern "C" SEXP name##_##call##_(SEXP ptr_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::name<template_type>> ptr(ptr_); \
    return boostmath::as_sexp(ptr->call()); \
    END_CPP11 \
  }

#define POLYNOMIAL_NOARG_CALL_BOOST(name, call, template_type) \
  extern "C" SEXP name##_##call##_(SEXP ptr_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    return boostmath::as_sexp(ptr->call()); \
    END_CPP11 \
  }

#define POLYNOMIAL_UNARY_CALL_BOOST(name, call, template_type, arg_type) \
  extern "C" SEXP name##_##call##_(SEXP ptr_, SEXP x_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(ptr->call(x)); \
    END_CPP11 \
  }

#define POLYNOMIAL_UNARY_CALL_NOSPACE_BOOST(name, call, template_type, arg_type) \
  extern "C" SEXP name##_##call##_(SEXP ptr_, SEXP x_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::name<template_type>> ptr(ptr_); \
    const arg_type x = boostmath::as_cpp<arg_type>(x_); \
    return boostmath::as_sexp(ptr->call(x)); \
    END_CPP11 \
  }

#define POLYNOMIAL_BINARY_CALL_VOID_BOOST(name, call, template_type, arg_type1, arg_type2) \
  extern "C" SEXP name##_##call##_(SEXP ptr_, SEXP x_, SEXP y_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    const arg_type1 x = boostmath::as_cpp<arg_type1>(x_); \
    const arg_type2 y = boostmath::as_cpp<arg_type2>(y_); \
    ptr->call(x, y); \
    return R_NilValue; \
    END_CPP11 \
  }

#define POLYNOMIAL_TERNARY_CALL_VOID_BOOST(name, call, template_type, arg_type1, arg_type2, arg_type3) \
  extern "C" SEXP name##_##call##_(SEXP ptr_, SEXP x_, SEXP y_, SEXP z_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    const arg_type1 x = boostmath::as_cpp<arg_type1>(x_); \
    const arg_type2 y = boostmath::as_cpp<arg_type2>(y_); \
    const arg_type3 z = boostmath::as_cpp<arg_type3>(z_); \
    ptr->call(x, y, z); \
    return R_NilValue; \
    END_CPP11 \
  }

#define POLYNOMIAL_QUARTERNARY_CALL_VOID_BOOST(name, call, template_type, arg_type1, arg_type2, arg_type3, arg_type4) \
  extern "C" SEXP name##_##call##_(SEXP ptr_, SEXP x_, SEXP y_, SEXP z_, SEXP w_) { \
    BEGIN_CPP11 \
    cpp11::external_pointer<boost::math::interpolators::name<template_type>> ptr(ptr_); \
    const arg_type1 x = boostmath::as_cpp<arg_type1>(x_); \
    const arg_type2 y = boostmath::as_cpp<arg_type2>(y_); \
    const arg_type3 z = boostmath::as_cpp<arg_type3>(z_); \
    const arg_type4 w = boostmath::as_cpp<arg_type4>(w_); \
    ptr->call(x, y, z, w); \
    return R_NilValue; \
    END_CPP11 \
  }

#define COMMA ,

#endif
