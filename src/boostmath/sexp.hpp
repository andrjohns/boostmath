#ifndef CPP11_COMPLEX_HPP
#define CPP11_COMPLEX_HPP

#include <cpp11.hpp>
#include <complex>

// cpp11 does not support interop for std::complex, implement our own and delegate to cpp11 only for other types

namespace boostmath {
  template <typename T>
  using is_cpp11 = std::negation<std::disjunction<
    std::is_same<T, std::complex<double>>,
    std::is_same<T, std::pair<double, double>>,
    std::is_same<T, std::tuple<double, double, double>>,
    std::is_same<T, std::tuple<double, double, double, double>>,
    std::is_same<T, std::array<double, 3>>,
    std::is_same<T, std::vector<std::array<double, 3>>>,
    std::is_same<T, std::array<double, 2>>,
    std::is_same<T, std::vector<std::array<double, 2>>>
  >>;


  template <typename T, std::enable_if_t<std::is_same<T, std::complex<double>>::value>* = nullptr>
  inline std::complex<double> as_cpp(SEXP x) {
    Rcomplex r_complex = COMPLEX_ELT(x, 0);
    return std::complex<double>(r_complex.r, r_complex.i);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::pair<double, double>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return std::make_pair(REAL_ELT(x, 0), REAL_ELT(x, 1));
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::tuple<double, double, double>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return std::make_tuple(
      REAL_ELT(x, 0),
      REAL_ELT(x, 1),
      REAL_ELT(x, 2)
    );
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::tuple<double, double, double, double>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return std::make_tuple(
      REAL_ELT(x, 0),
      REAL_ELT(x, 1),
      REAL_ELT(x, 2),
      REAL_ELT(x, 3)
    );
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::array<double, 3>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return {REAL_ELT(x, 0), REAL_ELT(x, 1), REAL_ELT(x, 2)};
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::array<double, 3>>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    T result;
    result.reserve(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SEXP xi = VECTOR_ELT(x, i);
      result.push_back(as_cpp<std::array<double, 3>>(xi));
    }
    return result;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::array<double, 2>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return {REAL_ELT(x, 0), REAL_ELT(x, 1)};
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::array<double, 2>>>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    R_xlen_t n = Rf_xlength(x);
    T result;
    result.reserve(n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SEXP xi = VECTOR_ELT(x, i);
      result.push_back(as_cpp<std::array<double, 2>>(xi));
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

  template <typename T, std::enable_if_t<std::is_same<T, std::pair<double, double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    std::vector<double> data = {x.first, x.second};
    return cpp11::as_sexp(data);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::tuple<double, double, double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    std::vector<double> data = {
      std::get<0>(x),
      std::get<1>(x),
      std::get<2>(x)
    };
    return cpp11::as_sexp(data);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::tuple<double, double, double, double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    std::vector<double> data = {
      std::get<0>(x),
      std::get<1>(x),
      std::get<2>(x),
      std::get<3>(x)
    };
    return cpp11::as_sexp(data);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::array<double, 3>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    std::vector<double> data = {x[0], x[1], x[2]};
    return cpp11::as_sexp(data);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::array<double, 3>>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    R_xlen_t n = x.size();
    SEXP data = cpp11::safe[Rf_allocVector](VECSXP, n);
    for (R_xlen_t i = 0; i < n; ++i) {
      SET_VECTOR_ELT(data, i, as_sexp(x[i]));
    }
    return data;
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::array<double, 2>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    std::vector<double> data = {x[0], x[1]};
    return cpp11::as_sexp(data);
  }

  template <typename T, std::enable_if_t<std::is_same<T, std::vector<std::array<double, 2>>>::value>* = nullptr>
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

#endif // CPP11_COMPLEX_HPP
