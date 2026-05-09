#ifndef BOOSTMATH_SCALAR_CONTAINER_HPP
#define BOOSTMATH_SCALAR_CONTAINER_HPP

#include <cstddef>
#include <vector>
#include "as_cpp.hpp"

namespace boostmath {
  template <typename T>
  struct scalar_container {
    std::vector<T> value_;
    size_t size_;
    bool is_scalar_;

    scalar_container() = default;
    scalar_container(SEXP x) :
      value_(boostmath::as_cpp<std::vector<T>>(x)),
      size_(value_.size()),
      is_scalar_(size_ == 1) {}

    T operator[](size_t i) const { return is_scalar_ ? value_[0] : value_[i]; }
    size_t size() const { return size_; }

  };
}

#endif
