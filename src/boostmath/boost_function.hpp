#ifndef BOOSTMATH_UTILS_HPP
#define BOOSTMATH_UTILS_HPP

#include <tuple>
#include "as_sexp.hpp"
#include "scalar_container.hpp"
#include <type_traits>
#include <utility>
#include <vector>

namespace boostmath {
  namespace internal {
    template <typename TypesTuple, typename ArgsTupleT, std::size_t... Is>
    auto make_containers_tuple_impl(ArgsTupleT&& args, std::index_sequence<Is...>) {
      return std::make_tuple(boostmath::scalar_container<std::tuple_element_t<Is, TypesTuple>>(std::get<Is>(args))...);
    }
  }

  template <typename TypesTupleT, typename ArgsTupleT>
  auto make_containers_tuple(ArgsTupleT&& args) {
    constexpr auto tuple_index_seq = std::make_index_sequence<std::tuple_size_v<std::decay_t<ArgsTupleT>>>{};
    return internal::make_containers_tuple_impl<TypesTupleT>(std::forward<ArgsTupleT>(args), tuple_index_seq);
  }

  template <typename F, typename... ArgsT>
  struct invoke_rtn {
    using type = std::invoke_result_t<F, ArgsT...>;
  };

  template <typename F, typename... ArgsT>
  struct invoke_rtn<F, std::tuple<ArgsT...>> {
    using type = std::invoke_result_t<F, ArgsT...>;
  };

  template <typename F, typename... ArgsT>
  using invoke_rtn_t = typename invoke_rtn<F, ArgsT...>::type;

  template <typename TypesTuple, typename F, typename ArgsTupleT>
  SEXP boost_function(F&& f, ArgsTupleT&& args) {
    const auto containers_tuple = make_containers_tuple<TypesTuple>(std::forward<ArgsTupleT>(args));

    using containers_tuple_t = decltype(containers_tuple);
    size_t max_n = std::apply([](auto&&... conts) { return std::max({conts.size()...}); },
                            std::forward<containers_tuple_t>(containers_tuple));

    std::vector<invoke_rtn_t<F, TypesTuple>> results(max_n);
    for (size_t i = 0; i < max_n; ++i) {
      results[i] = std::apply([&](auto&&... conts){ return f(conts[i]...); },
                              std::forward<containers_tuple_t>(containers_tuple));
    }
    if (max_n == 1) {
      return boostmath::as_sexp(results[0]);
    }
    return boostmath::as_sexp(results);
  }
}

#endif // BOOSTMATH_UTILS_HPP
