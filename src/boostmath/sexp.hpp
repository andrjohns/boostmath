#ifndef CPP11_COMPLEX_HPP
#define CPP11_COMPLEX_HPP

#include <cpp11.hpp>
#include <complex>
#include <vector>

// cpp11 does not support interop for std::complex, implement our own and delegate to cpp11 only for other types

namespace boostmath {
  namespace internal {
    template <typename T, std::size_t... Is>
    auto as_cpp_doubles_tuple_impl(SEXP x, std::index_sequence<Is...>) {
      return std::make_tuple(REAL_ELT(x, Is)...);
    }

    template <typename T, std::size_t... Is>
    auto as_cpp_doubles_array_impl(SEXP x, std::index_sequence<Is...>) {
      return std::array<double, sizeof...(Is)>{REAL_ELT(x, Is)...};
    }

    template <typename T, std::size_t... Is>
    auto as_sexp_doubles_tuple_impl(const T& x, std::index_sequence<Is...>) {
      return cpp11::as_sexp(std::vector<double>{std::get<Is>(x)...});
    }

    template <typename T, std::size_t... Is>
    auto as_sexp_doubles_array_impl(const T& x, std::index_sequence<Is...>) {
      return cpp11::as_sexp(std::vector<double>{x[Is]...});
    }
  }
  template <typename... Targs>
  struct is_doubles_tuple : std::false_type {};

  template <typename... Targs>
  struct is_doubles_tuple<std::tuple<Targs...>>
    : std::conjunction<std::is_same<Targs, double>...> {};

  template <typename T>
  struct is_doubles_array : std::false_type {};

  template <std::size_t N>
  struct is_doubles_array<std::array<double, N>> : std::true_type {};

  template <typename T>
  struct is_doubles_array_vector : std::false_type {};

  template <std::size_t N>
  struct is_doubles_array_vector<std::vector<std::array<double, N>>> : std::true_type {};

  template <typename T>
  using is_cpp11 = std::negation<std::disjunction<
    std::is_same<T, std::complex<double>>,
    std::is_same<T, std::pair<double, double>>,
    is_doubles_tuple<T>,
    is_doubles_array<T>,
    is_doubles_array_vector<T>
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

  template <typename T, std::enable_if_t<is_doubles_tuple<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return internal::as_cpp_doubles_tuple_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_doubles_array<T>::value>* = nullptr>
  inline T as_cpp(SEXP x) {
    return internal::as_cpp_doubles_array_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_doubles_array_vector<T>::value>* = nullptr>
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

  template <typename T, std::enable_if_t<std::is_same<T, std::pair<double, double>>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    std::vector<double> data = {x.first, x.second};
    return cpp11::as_sexp(data);
  }

  template <typename T, std::enable_if_t<is_doubles_tuple<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return internal::as_sexp_doubles_tuple_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_doubles_array<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return internal::as_sexp_doubles_array_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_doubles_array_vector<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    using array_type = typename T::value_type;
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
