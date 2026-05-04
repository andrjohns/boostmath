#ifndef BOOSTMATH_UTILS_HPP
#define BOOSTMATH_UTILS_HPP

#include <tuple>
#include "as_sexp.hpp"
#include "as_cpp.hpp"
#include <vector>

namespace boostmath {

  template <typename... Targs>
  size_t max_size(const std::vector<Targs>&... xs) {
    return std::max({xs.size()...});
  }

  template <typename T>
  T index(const std::vector<T>& x, size_t i) {
    return x.size() == 1 ? x[0] : x[i];
  }

  namespace internal {
    template <typename TypesTuple, std::size_t... Is>
    auto make_cpp_args_impl(const std::array<SEXP, std::tuple_size_v<TypesTuple>>& args, std::index_sequence<Is...>) {
      return std::make_tuple(boostmath::as_cpp<std::vector<std::tuple_element_t<Is, TypesTuple>>>(args[Is])...);
    }

    template <typename F, typename ArgsTupleT, std::size_t... Is>
    auto index_apply_impl(F&& f, ArgsTupleT&& args, std::index_sequence<Is...>, size_t i) {
      return f(boostmath::index(std::get<Is>(args), i)...);
    }
  }

  template <typename ArgsTupleT>
  std::size_t max_size(ArgsTupleT&& args) {
    return std::apply([](auto&&... x){ return std::max({x.size()...}); }, std::forward<ArgsTupleT>(args));
  }

  template <typename TypesTuple>
  auto make_cpp_args(const std::array<SEXP, std::tuple_size_v<TypesTuple>>& args) {
    return internal::make_cpp_args_impl<TypesTuple>(args, std::make_index_sequence<std::tuple_size_v<TypesTuple>>{});
  }

  template <typename F, typename ArgsTupleT>
  auto index_apply(F&& f, ArgsTupleT&& args, size_t i) {
    return internal::index_apply_impl(std::forward<F>(f), std::forward<ArgsTupleT>(args), std::make_index_sequence<std::tuple_size_v<std::decay_t<ArgsTupleT>>>{}, i);
  }

  template <typename TypesTuple, typename F>
  auto boostfun(F&& f, const std::array<SEXP, std::tuple_size_v<TypesTuple>>& args) {
    const auto cpp_args = make_cpp_args<TypesTuple>(args);

    const size_t n = boostmath::max_size(cpp_args);
    std::vector<decltype(boostmath::index_apply(f, cpp_args, 0))> results(n);
    for (size_t i = 0; i < n; ++i) {
      results[i] = boostmath::index_apply(f, cpp_args, i);
    }
    if (results.size() == 1) {
      return boostmath::as_sexp(results[0]);
    }
    return boostmath::as_sexp(results);
  }
}

#endif // BOOSTMATH_UTILS_HPP
