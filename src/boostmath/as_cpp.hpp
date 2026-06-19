#ifndef BOOSTMATH_AS_CPP_HPP
#define BOOSTMATH_AS_CPP_HPP

#include <cpp11.hpp>
#include <complex>
#include <type_traits>
#include "./type_traits.hpp"

namespace boostmath {
  namespace internal {
    template <typename T, std::size_t... Is>
    T as_cpp_arithmetic_container_impl(SEXP x, std::index_sequence<Is...>) {
      if constexpr (is_integral_scalar_type<T>::value) {
        return {INTEGER_ELT(x, Is)...};
      } else {
        return {REAL_ELT(x, Is)...};
      }
    }
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::complex<double>>::value>* = nullptr>
  inline std::complex<double> as_cpp(SEXP x) {
    Rcomplex r_complex = COMPLEX_ELT(x, 0);
    return {r_complex.r, r_complex.i};
  }

  template <typename T, std::enable_if_t<is_fixed_container<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return internal::as_cpp_arithmetic_container_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_cpp11<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return cpp11::as_cpp<T>(x);
  }

  template <typename T, std::enable_if_t<is_vector_or_list<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    using scalar_t = typename T::value_type;
    const bool is_list = Rf_isNewList(x);
    const R_xlen_t n = (!is_vector_or_list<scalar_t>::value || is_list) ? Rf_xlength(x) : 1;
    T rtn;
    rtn.reserve(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      if constexpr (std::is_arithmetic_v<scalar_t>) {
        rtn.push_back(Rf_isInteger(x) ? INTEGER_ELT(x, i) : REAL_ELT(x, i));
      } else if constexpr (std::is_same_v<scalar_t, std::complex<double>>) {
        rtn.push_back({COMPLEX_ELT(x, i).r, COMPLEX_ELT(x, i).i});
      } else {
        if (is_list) {
          rtn.push_back(as_cpp<scalar_t>(VECTOR_ELT(x, i)));
        } else {
          rtn.push_back(as_cpp<scalar_t>(x));
        }
      }
    }
    return rtn;
  }
}
#endif
