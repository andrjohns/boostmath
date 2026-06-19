#ifndef BOOSTMATH_AS_SEXP_HPP
#define BOOSTMATH_AS_SEXP_HPP

#include <cpp11.hpp>
#include <complex>
#include "./type_traits.hpp"

namespace boostmath {
  namespace internal {
    template <typename T, std::size_t... Is>
    auto as_sexp_arithmetic_container_impl(const T& x, std::index_sequence<Is...>) {
      SEXP data;
      if constexpr (is_integral_scalar_type<T>::value) {
        data = cpp11::safe[Rf_allocVector](INTSXP, sizeof...(Is));
        int* ptr = INTEGER(data);
        ((ptr[Is] = std::get<Is>(x)), ...);
      } else {
        data = cpp11::safe[Rf_allocVector](REALSXP, sizeof...(Is));
        double* ptr = REAL(data);
        ((ptr[Is] = std::get<Is>(x)), ...);
      }

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

  template <typename T, std::enable_if_t<is_fixed_container<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return internal::as_sexp_arithmetic_container_impl<T>(x, std::make_index_sequence<std::tuple_size<T>::value>{});
  }

  template <typename T, std::enable_if_t<is_cpp11<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    return cpp11::as_sexp(x);
  }

  template <typename T, std::enable_if_t<is_vector_or_list<T>::value>* = nullptr>
  inline SEXP as_sexp(const T& x) {
    const R_xlen_t n = x.size();
    using scalar_t = typename T::value_type;
    SEXP data;
    if constexpr (std::is_integral_v<scalar_t>) {
      data = cpp11::safe[Rf_allocVector](INTSXP, n);
      std::copy(x.cbegin(), x.cend(), INTEGER(data));
    } else if constexpr (std::is_floating_point_v<scalar_t>) {
      data = cpp11::safe[Rf_allocVector](REALSXP, n);
      std::copy(x.cbegin(), x.cend(), REAL(data));
    } else if constexpr (std::is_same_v<scalar_t, std::complex<double>>) {
      data = cpp11::safe[Rf_allocVector](CPLXSXP, n);
      std::transform(x.cbegin(), x.cend(), COMPLEX(data),
                     [](const std::complex<double>& y) { return Rcomplex{ y.real(), y.imag()}; });
    } else {
      data = cpp11::safe[Rf_allocVector](VECSXP, n);
      PROTECT(data);
      for (R_xlen_t i = 0; i < n; ++i) {
        SET_VECTOR_ELT(data, i, as_sexp(x[i]));
      }
      UNPROTECT(1);
    }
    return data;
  }
}

#endif // BOOSTMATH_SEXP_HPP
