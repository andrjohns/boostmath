#ifndef BOOSTMATH_SEXP_HPP
#define BOOSTMATH_SEXP_HPP

#include <cpp11.hpp>
#include <complex>
#include "./type_traits.hpp"

namespace boostmath {
  namespace internal {
    template <typename T, std::size_t... Is, std::enable_if_t<std::negation<is_integral_scalar_type<T>>::value>* = nullptr>
    T as_cpp_arithmetic_container_impl(SEXP x, std::index_sequence<Is...>) {
      return {REAL_ELT(x, Is)...};
    }

    template <typename T, std::size_t... Is, std::enable_if_t<is_integral_scalar_type<T>::value>* = nullptr>
    T as_cpp_arithmetic_container_impl(SEXP x, std::index_sequence<Is...>) {
      return {INTEGER_ELT(x, Is)...};
    }

    template <typename T, std::size_t... Is, std::enable_if_t<std::negation<is_integral_scalar_type<T>>::value>* = nullptr>
    auto as_sexp_arithmetic_container_impl(const T& x, std::index_sequence<Is...>) {
      SEXP data = cpp11::safe[Rf_allocVector](REALSXP, sizeof...(Is));
      double* ptr = REAL(data);
      ((ptr[Is] = std::get<Is>(x)), ...);
      return data;
    }

    template <typename T, std::size_t... Is,  std::enable_if_t<is_integral_scalar_type<T>::value>* = nullptr>
    auto as_sexp_arithmetic_container_impl(const T& x, std::index_sequence<Is...>) {
      SEXP data = cpp11::safe[Rf_allocVector](INTSXP, sizeof...(Is));
      int* ptr = INTEGER(data);
      ((ptr[Is] = std::get<Is>(x)), ...);
      return data;
    }
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::complex<double>>::value>* = nullptr>
  inline std::complex<double> as_cpp(SEXP x) {
    Rcomplex r_complex = COMPLEX_ELT(x, 0);
    return std::complex<double>(r_complex.r, r_complex.i);
  }

  template <typename T, std::enable_if_t<is_arithmetic_container<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return internal::as_cpp_arithmetic_container_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_vector_of_arithmetic_containers<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    using array_type = typename T::value_type;
    R_xlen_t n = Rf_xlength(x);
    T result;
    result.reserve(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SEXP xi = VECTOR_ELT(x, i);
      result.push_back(as_cpp<array_type>(xi));
    }
    return result;
  }

  template <typename T, std::enable_if_t<is_cpp11<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return cpp11::as_cpp<T>(x);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::complex<double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    SEXP data = cpp11::safe[Rf_allocVector](CPLXSXP, 1);
    Rcomplex* r_complex = COMPLEX(data);
    r_complex->r = x.real();
    r_complex->i = x.imag();
    return data;
  }

  template <typename T, std::enable_if_t<is_arithmetic_container<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return internal::as_sexp_arithmetic_container_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_vector_of_arithmetic_containers<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](VECSXP, n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SET_VECTOR_ELT(data, i, as_sexp(x[i]));
    }
    return data;
  }

  inline SEXP as_sexp(void) {
    return R_NilValue;
  }

  template <typename T, std::enable_if_t<is_cpp11<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return cpp11::as_sexp(x);
  }

}

#endif // BOOSTMATH_SEXP_HPP
