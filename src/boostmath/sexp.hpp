#ifndef BOOSTMATH_SEXP_HPP
#define BOOSTMATH_SEXP_HPP

#include <cpp11.hpp>
#include <complex>
#include "./type_traits.hpp"
#include "Rinternals.h"

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
    return {r_complex.r, r_complex.i};
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::complex<double>>>::value>* = nullptr>
  inline std::vector<std::complex<double>> as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    std::vector<std::complex<double>> result(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      Rcomplex r_complex = COMPLEX_ELT(x, i);
      result[i] = {r_complex.r, r_complex.i};
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<uint64_t>>::value>* = nullptr>
  inline std::vector<uint64_t> as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    std::vector<uint64_t> result(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      result[i] = static_cast<uint64_t>(Rf_isInteger(x) ? INTEGER_ELT(x, i) : REAL_ELT(x, i));
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<int64_t>>::value>* = nullptr>
  inline std::vector<int64_t> as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    std::vector<int64_t> result(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      result[i] = static_cast<int64_t>(Rf_isInteger(x) ? INTEGER_ELT(x, i) : REAL_ELT(x, i));
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<int>>::value>* = nullptr>
  inline std::vector<int> as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    std::vector<int> result(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      result[i] = static_cast<int>(Rf_isInteger(x) ? INTEGER_ELT(x, i) : REAL_ELT(x, i));
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<double>>::value>* = nullptr>
  inline std::vector<double> as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    std::vector<double> result(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      result[i] = static_cast<double>(Rf_isInteger(x) ? INTEGER_ELT(x, i) : REAL_ELT(x, i));
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::list<double>>::value>* = nullptr>
  inline std::list<double> as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    std::list<double> result(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      result.push_back(static_cast<double>(Rf_isInteger(x) ? INTEGER_ELT(x, i) : REAL_ELT(x, i)));
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::vector<double>>>::value>* = nullptr>
  inline std::vector<std::vector<double>> as_cpp(SEXP x) {
    if (Rf_isNewList(x)) {
      const R_xlen_t n = Rf_xlength(x);
      std::vector<std::vector<double>> result(n);
      for (R_xlen_t i = 0; i < n; ++i) {
        SEXP xi = VECTOR_ELT(x, i);
        result[i] = as_cpp<std::vector<double>>(xi);
      }
      return result;
    }
    return {as_cpp<std::vector<double>>(x)};
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

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::complex<double>>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](CPLXSXP, n);
    Rcomplex* r_complex = COMPLEX(data);
    for (R_xlen_t i = 0; i < n; ++i) {
      r_complex[i].r = x[i].real();
      r_complex[i].i = x[i].imag();
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::list<double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](REALSXP, n);
    double* ptr = REAL(data);
    size_t i = 0;
    for (const auto& value : x) {
      ptr[i++] = value;
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::list<double>>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](VECSXP, n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SET_VECTOR_ELT(data, i, as_sexp(x[i]));
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<uint64_t>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](INTSXP, n);
    int* ptr = INTEGER(data);
    for (R_xlen_t i = 0; i < n; ++i) {
      ptr[i] = static_cast<int>(x[i]);
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<int64_t>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](INTSXP, n);
    int* ptr = INTEGER(data);
    for (R_xlen_t i = 0; i < n; ++i) {
      ptr[i] = static_cast<int>(x[i]);
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<int>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](INTSXP, n);
    int* ptr = INTEGER(data);
    for (R_xlen_t i = 0; i < n; ++i) {
      ptr[i] = static_cast<int>(x[i]);
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](REALSXP, n);
    double* ptr = REAL(data);
    for (R_xlen_t i = 0; i < n; ++i) {
      ptr[i] = static_cast<double>(x[i]);
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::vector<double>>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](VECSXP, n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SET_VECTOR_ELT(data, i, as_sexp(x[i]));
    }
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

  template <typename T, std::enable_if_t<is_cpp11<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return cpp11::as_sexp(x);
  }

}

#endif // BOOSTMATH_SEXP_HPP
