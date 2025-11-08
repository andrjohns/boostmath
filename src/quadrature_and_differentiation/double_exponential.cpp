#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/quadrature/tanh_sinh.hpp>
#include <boost/math/quadrature/exp_sinh.hpp>
#include <boost/math/quadrature/sinh_sinh.hpp>
#include <limits>

// Integrators need the return outside of the (BEGIN|END)_CPP11 block
// to avoid `rchk` false positives.

extern "C" {
  SEXP tanh_sinh_(SEXP f_, SEXP a_, SEXP b_, SEXP tol_, SEXP max_refinements_) {
    double result = std::numeric_limits<double>::quiet_NaN();
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
      cpp11::function f(f_);
      const double a = cpp11::as_cpp<double>(a_);
      const double b = cpp11::as_cpp<double>(b_);
      const double tol = cpp11::as_cpp<double>(tol_);
      const size_t max_refinements = cpp11::as_cpp<size_t>(max_refinements_);

      const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

      boost::math::quadrature::tanh_sinh<double> integrator(max_refinements);
      result = integrator.integrate(func, a, b, tol);
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
    return cpp11::as_sexp(result);
  }

  SEXP sinh_sinh_(SEXP f_, SEXP tol_, SEXP max_refinements_) {
    double result = std::numeric_limits<double>::quiet_NaN();
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
      cpp11::function f(f_);
      const double tol = cpp11::as_cpp<double>(tol_);
      const size_t max_refinements = cpp11::as_cpp<size_t>(max_refinements_);

      const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

      boost::math::quadrature::sinh_sinh<double> integrator(max_refinements);
      result = integrator.integrate(func, tol);
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
    return cpp11::as_sexp(result);
  }

  SEXP exp_sinh_(SEXP f_, SEXP a_, SEXP b_, SEXP tol_, SEXP max_refinements_) {
    double result = std::numeric_limits<double>::quiet_NaN();
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
      const cpp11::function f(f_);
      const double a = cpp11::as_cpp<double>(a_);
      const double b = cpp11::as_cpp<double>(b_);
      const double tol = cpp11::as_cpp<double>(tol_);
      const size_t max_refinements = cpp11::as_cpp<size_t>(max_refinements_);

      const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

      boost::math::quadrature::exp_sinh<double> integrator(max_refinements);
      result = integrator.integrate(func, a, b, tol);
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
    return cpp11::as_sexp(result);
  }
}
