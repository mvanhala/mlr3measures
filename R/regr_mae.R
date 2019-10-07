#' @title Mean Absolute Errors
#'
#' @description
#' Definition:
#' \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left| t_i - r_i \right|.
#' }{
#'   mean(abs(t - r))
#' }
#'
#' @templateVar mid mae
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @export
mae = function(truth, response) {
  mean(ae(truth, response))
}

#' @include metainfo.R
add_info(mae, "regr", 0, Inf, TRUE)