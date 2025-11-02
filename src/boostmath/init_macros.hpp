#ifndef BOOSTMATH_INIT_MACROS_HPP
#define BOOSTMATH_INIT_MACROS_HPP

#define xstr(s) str(s)
#define str(s) #s

#define DISTRIBUTION_DECLARATIONS(dist) \
  SEXP dist##_cdf_ptr_(SEXP ptr_, SEXP x_); \
  SEXP dist##_logcdf_ptr_(SEXP ptr_, SEXP x_); \
  SEXP dist##_pdf_ptr_(SEXP ptr_, SEXP x_); \
  SEXP dist##_logpdf_ptr_(SEXP ptr_, SEXP x_); \
  SEXP dist##_hazard_ptr_(SEXP ptr_, SEXP x_); \
  SEXP dist##_chf_ptr_(SEXP ptr_, SEXP x_); \
  SEXP dist##_mean_ptr_(SEXP ptr_); \
  SEXP dist##_median_ptr_(SEXP ptr_); \
  SEXP dist##_mode_ptr_(SEXP ptr_); \
  SEXP dist##_range_ptr_(SEXP ptr_); \
  SEXP dist##_quantile_ptr_(SEXP ptr_, SEXP p_); \
  SEXP dist##_standard_deviation_ptr_(SEXP ptr_); \
  SEXP dist##_support_ptr_(SEXP ptr_); \
  SEXP dist##_variance_ptr_(SEXP ptr_); \
  SEXP dist##_skewness_ptr_(SEXP ptr_); \
  SEXP dist##_kurtosis_ptr_(SEXP ptr_); \
  SEXP dist##_kurtosis_excess_ptr_(SEXP ptr_);

#define DISTRIBUTION_CALLDEFS(dist) \
  {xstr(dist##_cdf_ptr_), (DL_FUNC) &dist##_cdf_ptr_, 2}, \
  {xstr(dist##_logcdf_ptr_), (DL_FUNC) &dist##_logcdf_ptr_, 2}, \
  {xstr(dist##_pdf_ptr_), (DL_FUNC) &dist##_pdf_ptr_, 2}, \
  {xstr(dist##_logpdf_ptr_), (DL_FUNC) &dist##_logpdf_ptr_, 2}, \
  {xstr(dist##_hazard_ptr_), (DL_FUNC) &dist##_hazard_ptr_, 2}, \
  {xstr(dist##_chf_ptr_), (DL_FUNC) &dist##_chf_ptr_, 2}, \
  {xstr(dist##_mean_ptr_), (DL_FUNC) &dist##_mean_ptr_, 1}, \
  {xstr(dist##_median_ptr_), (DL_FUNC) &dist##_median_ptr_, 1}, \
  {xstr(dist##_mode_ptr_), (DL_FUNC) &dist##_mode_ptr_, 1}, \
  {xstr(dist##_range_ptr_), (DL_FUNC) &dist##_range_ptr_, 1}, \
  {xstr(dist##_quantile_ptr_), (DL_FUNC) &dist##_quantile_ptr_, 2}, \
  {xstr(dist##_standard_deviation_ptr_), (DL_FUNC) &dist##_standard_deviation_ptr_, 1}, \
  {xstr(dist##_support_ptr_), (DL_FUNC) &dist##_support_ptr_, 1}, \
  {xstr(dist##_variance_ptr_), (DL_FUNC) &dist##_variance_ptr_, 1}, \
  {xstr(dist##_skewness_ptr_), (DL_FUNC) &dist##_skewness_ptr_, 1}, \
  {xstr(dist##_kurtosis_ptr_), (DL_FUNC) &dist##_kurtosis_ptr_, 1}, \
  {xstr(dist##_kurtosis_excess_ptr_), (DL_FUNC) &dist##_kurtosis_excess_ptr_, 1},

#define UNARY_DISTRIBUTION_BOOST_DECLARATIONS(dist) \
  SEXP dist##_init_(SEXP param1_); \
  DISTRIBUTION_DECLARATIONS(dist)

#define BINARY_DISTRIBUTION_BOOST_DECLARATIONS(dist) \
  SEXP dist##_init_(SEXP param1_, SEXP param2_); \
  DISTRIBUTION_DECLARATIONS(dist)

#define TERNARY_DISTRIBUTION_BOOST_DECLARATIONS(dist) \
  SEXP dist##_init_(SEXP param1_, SEXP param2_, SEXP param3_); \
  DISTRIBUTION_DECLARATIONS(dist)

#define UNARY_DISTRIBUTION_BOOST_CALLDEFS(dist) \
  {xstr(dist##_init_), (DL_FUNC) &dist##_init_, 1}, \
  DISTRIBUTION_CALLDEFS(dist)

#define BINARY_DISTRIBUTION_BOOST_CALLDEFS(dist) \
  {xstr(dist##_init_), (DL_FUNC) &dist##_init_, 2}, \
  DISTRIBUTION_CALLDEFS(dist)

#define TERNARY_DISTRIBUTION_BOOST_CALLDEFS(dist) \
  {xstr(dist##_init_), (DL_FUNC) &dist##_init_, 3}, \
  DISTRIBUTION_CALLDEFS(dist)

#endif // BOOSTMATH_INIT_MACROS_HPP
