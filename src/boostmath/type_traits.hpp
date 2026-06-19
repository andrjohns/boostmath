#ifndef BOOSTMATH_TYPE_TRAITS_HPP
#define BOOSTMATH_TYPE_TRAITS_HPP

#include <cstddef>
#include <type_traits>
#include <tuple>
#include <vector>
#include <list>

namespace boostmath {
  template <typename... T>
  struct is_fixed_container : std::false_type {};

  template <typename... T>
  struct is_fixed_container<std::tuple<T...>> : std::true_type {};

  template <typename T, std::size_t N>
  struct is_fixed_container<std::array<T, N>> : std::true_type {};

  template <typename T1, typename T2>
  struct is_fixed_container<std::pair<T1, T2>> : std::true_type {};

  template <typename T>
  struct is_vector_or_list : std::false_type {};

  template <typename T>
  struct is_vector_or_list<std::vector<T>> : std::true_type {};

  template <typename T>
  struct is_vector_or_list<std::list<T>> : std::true_type {};

  template <typename T>
  using is_cpp11 = std::negation<
    std::disjunction<
      is_vector_or_list<T>,
      std::is_same<T, std::complex<double>>,
      is_fixed_container<T>
    >
  >;

  template <typename... TArgs>
  struct is_integral_scalar_type : std::false_type {};

  template <typename T>
  struct is_integral_scalar_type<T> : std::is_integral<T> {};

  template <typename T, std::size_t N>
  struct is_integral_scalar_type<std::array<T, N>> : std::is_integral<T> {};

  template <typename T>
  struct is_integral_scalar_type<std::vector<T>> : std::is_integral<T> {};

  template <typename... TArgs>
  struct is_integral_scalar_type<std::tuple<TArgs...>> : std::is_integral<std::common_type_t<TArgs...>> {};

  template <typename... TArgs>
  struct is_integral_scalar_type<std::pair<TArgs...>> : std::is_integral<std::common_type_t<TArgs...>> {};
}

#endif // BOOSTMATH_TYPE_TRAITS_HPP
