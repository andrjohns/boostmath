#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/quadrature/ooura_fourier_integrals.hpp>

extern "C" {
  SEXP ooura_fourier_sin_(SEXP f_, SEXP omega_, SEXP relative_error_tolerance_, SEXP levels_) {
#ifndef BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS
    std::pair<double, double> result_pair = {std::numeric_limits<double>::quiet_NaN(), std::numeric_limits<double>::quiet_NaN()};
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
    cpp11::function f(f_);
    double omega = cpp11::as_cpp<double>(omega_);
    double relative_error_tolerance = cpp11::as_cpp<double>(relative_error_tolerance_);
    size_t levels = cpp11::as_cpp<size_t>(levels_);

    auto func = [&f](double x) {
      return cpp11::as_cpp<double>(f(x));
    };

    boost::math::quadrature::ooura_fourier_sin<double> integrator(relative_error_tolerance, levels);
    result_pair = integrator.integrate(func, omega);
    } catch (cpp11::unwind_exception & e) {
      err = e.token;
    } catch (std::exception & e) {
      strncpy(buf, e.what(), sizeof(buf) - 1);
    } catch (...) {
      strncpy(buf, "C++ error (unknown cause)", sizeof(buf) - 1);
    }

    if (buf[0] != '\0') {
      Rf_errorcall(R_NilValue, "%s", buf);
    } else if (err != R_NilValue) {
      R_ContinueUnwind(err);
    }
    cpp11::writable::doubles result;
    result.push_back(result_pair.first);
    result.attr("relative_error") = result_pair.second;
    return cpp11::as_sexp(result);
#else
    BEGIN_CPP11
    cpp11::stop("Ooura Fourier integrals are not supported on this platform as they require long double precision");
    END_CPP11
#endif
  }

  SEXP ooura_fourier_cos_(SEXP f_, SEXP omega_, SEXP relative_error_tolerance_, SEXP levels_) {
#ifndef BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS
    std::pair<double, double> result_pair = {std::numeric_limits<double>::quiet_NaN(), std::numeric_limits<double>::quiet_NaN()};
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
    cpp11::function f(f_);
    double omega = cpp11::as_cpp<double>(omega_);
    double relative_error_tolerance = cpp11::as_cpp<double>(relative_error_tolerance_);
    size_t levels = cpp11::as_cpp<size_t>(levels_);

    auto func = [&f](double x) {
      return cpp11::as_cpp<double>(f(x));
    };

    boost::math::quadrature::ooura_fourier_cos<double> integrator(relative_error_tolerance, levels);
    result_pair = integrator.integrate(func, omega);
    } catch (cpp11::unwind_exception & e) {
      err = e.token;
    } catch (std::exception & e) {
      strncpy(buf, e.what(), sizeof(buf) - 1);
    } catch (...) {
      strncpy(buf, "C++ error (unknown cause)", sizeof(buf) - 1);
    }

    if (buf[0] != '\0') {
      Rf_errorcall(R_NilValue, "%s", buf);
    } else if (err != R_NilValue) {
      R_ContinueUnwind(err);
    }
    cpp11::writable::doubles result;
    result.push_back(result_pair.first);
    result.attr("relative_error") = result_pair.second;
    return cpp11::as_sexp(result);
#else
    BEGIN_CPP11
    cpp11::stop("Ooura Fourier integrals are not supported on this platform as they require long double precision");
    END_CPP11
#endif
  }
}
