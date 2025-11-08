#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/filters/daubechies.hpp>
#include <boost/preprocessor/iteration/local.hpp>

extern "C" {
  SEXP daubechies_scaling_filter_(SEXP order_) {
    BEGIN_CPP11
    const size_t order = cpp11::as_cpp<size_t>(order_);

    switch (order) {
#define BOOST_PP_LOCAL_MACRO(n) \
      case n: \
        return cpp11::as_sexp(boost::math::filters::daubechies_scaling_filter<double, n>());
#define BOOST_PP_LOCAL_LIMITS (1, 19)
#include BOOST_PP_LOCAL_ITERATE()
      default:
        cpp11::stop("Unsupported order for Daubechies filters");
        return R_NilValue;
    }

    END_CPP11
  }

  SEXP daubechies_wavelet_filter_(SEXP order_) {
    BEGIN_CPP11
    const size_t order = cpp11::as_cpp<size_t>(order_);

    switch (order) {
#define BOOST_PP_LOCAL_MACRO(n) \
      case n: \
        return cpp11::as_sexp(boost::math::filters::daubechies_wavelet_filter<double, n>());
#define BOOST_PP_LOCAL_LIMITS (1, 19)
#include BOOST_PP_LOCAL_ITERATE()
      default:
        cpp11::stop("Unsupported order for Daubechies filters");
        return R_NilValue;
    }

    END_CPP11
  }
}
