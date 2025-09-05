#ifndef BOOSTMATH_TYPE_TRAITS_HPP
#define BOOSTMATH_TYPE_TRAITS_HPP

#include <type_traits>
#include <tuple>
#include <vector>

namespace boostmath {
  template <typename... Targs>
  struct is_doubles_tuple : std::false_type {};

  template <typename... Targs>
  struct is_doubles_tuple<std::tuple<Targs...>>
    : std::conjunction<std::is_same<Targs, double>...> {};

  template <typename T>
  struct is_doubles_array : std::false_type {};

  template <std::size_t N>
  struct is_doubles_array<std::array<double, N>> : std::true_type {};

  template <typename... Targs>
  struct is_doubles_pair : std::false_type {};

  template <>
  struct is_doubles_pair<std::pair<double, double>> : std::true_type {};

  template <typename T>
  struct is_doubles_array_vector : std::false_type {};

  template <std::size_t N>
  struct is_doubles_array_vector<std::vector<std::array<double, N>>> : std::true_type {};

  template <typename T>
  using is_doubles_container = std::disjunction<is_doubles_tuple<T>, is_doubles_array<T>, is_doubles_pair<T>>;

  template <typename T>
  using is_cpp11 = std::negation<
    std::disjunction<
      std::is_same<T, std::complex<double>>,
      is_doubles_container<T>,
      is_doubles_array_vector<T>,
      std::is_void<T>
    >
  >;
}

#endif // BOOSTMATH_TYPE_TRAITS_HPP
