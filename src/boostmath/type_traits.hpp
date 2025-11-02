#ifndef BOOSTMATH_TYPE_TRAITS_HPP
#define BOOSTMATH_TYPE_TRAITS_HPP

#include <type_traits>
#include <tuple>
#include <vector>

namespace boostmath {
  template <typename... Targs>
  struct is_arithmetic_tuple : std::false_type {};

  template <typename... Targs>
  struct is_arithmetic_tuple<std::tuple<Targs...>>
    : std::conjunction<std::is_arithmetic<Targs>...> {};

  template <typename T>
  struct is_arithmetic_array : std::false_type {};

  template <typename T, std::size_t N>
  struct is_arithmetic_array<std::array<T, N>> : std::is_arithmetic<T> {};

  template <typename... Targs>
  struct is_arithmetic_pair : std::false_type {};

  template <typename T1, typename T2>
  struct is_arithmetic_pair<std::pair<T1, T2>> : std::conjunction<std::is_arithmetic<T1>, std::is_arithmetic<T2>> {};

  template <typename T>
  struct is_vector_of_arithmetic_containers : std::false_type {};

  template <typename T, std::size_t N>
  struct is_vector_of_arithmetic_containers<std::vector<std::array<T, N>>> : std::is_arithmetic<T> {};

  template <typename T>
  using is_arithmetic_container = std::disjunction<is_arithmetic_tuple<T>, is_arithmetic_array<T>, is_arithmetic_pair<T>>;

  template <typename T>
  using is_cpp11 = std::negation<
    std::disjunction<
      std::is_same<T, std::complex<double>>,
      is_arithmetic_container<T>,
      is_vector_of_arithmetic_containers<T>,
      std::is_void<T>
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
