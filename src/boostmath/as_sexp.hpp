#ifndef BOOSTMATH_AS_SEXP_HPP
#define BOOSTMATH_AS_SEXP_HPP

#include <cpp11.hpp>
#include <complex>
#include "./type_traits.hpp"

namespace boostmath {
  namespace internal {
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
