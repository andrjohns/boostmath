#ifndef BOOSTMATH_UTILS_HPP
#define BOOSTMATH_UTILS_HPP

#include <tuple>
#include "as_sexp.hpp"
#include "as_cpp.hpp"
#include <utility>
#include <vector>

namespace boostmath {

  template <typename... Targs>
  size_t max_size(const std::vector<Targs>&... xs) {
    return std::max({xs.size()...});
  }

  template <typename ArgsTupleT>
  std::size_t max_size(ArgsTupleT&& args) {
    return std::apply([](auto&&... x){ return std::max({x.size()...}); }, std::forward<ArgsTupleT>(args));
  }

  template <typename T>
  T index(const std::vector<T>& x, const size_t i) {
    return x.size() == 1 ? x[0] : x[i];
  }

  template <typename F, typename ArgsTupleT, std::size_t... Is>
  auto index_apply(F&& f, ArgsTupleT&& args, std::index_sequence<Is...>, size_t i) {
    return f(boostmath::index(std::get<Is>(args), i)...);
  }

  template <typename TypesTuple, typename ArgsTupleT, std::size_t... Is>
  auto make_cpp_args(ArgsTupleT&& args, std::index_sequence<Is...>) {
    return std::make_tuple(boostmath::as_cpp<std::vector<std::tuple_element_t<Is, TypesTuple>>>(std::get<Is>(args))...);
  }

  template <typename TypesTuple, typename F, typename ArgsTupleT>
  auto boostfun(F&& f, ArgsTupleT&& args) {
    constexpr auto tuple_index_seq = std::make_index_sequence<std::tuple_size_v<std::decay_t<ArgsTupleT>>>{};

    const auto cpp_args = make_cpp_args<TypesTuple>(std::forward<ArgsTupleT>(args), tuple_index_seq);
    using cpp_args_t = decltype(cpp_args);
    const size_t n = boostmath::max_size(cpp_args);

    if (n == 1) {
      return boostmath::as_sexp(boostmath::index_apply(f, std::forward<cpp_args_t>(cpp_args), tuple_index_seq, 0));
    }

    std::vector<decltype(boostmath::index_apply(f, std::forward<cpp_args_t>(cpp_args), tuple_index_seq, 0))> results(n);
    for (size_t i = 0; i < n; ++i) {
      results[i] = boostmath::index_apply(f, std::forward<cpp_args_t>(cpp_args), tuple_index_seq, i);
    }
    return boostmath::as_sexp(results);
  }
}

#endif // BOOSTMATH_UTILS_HPP
