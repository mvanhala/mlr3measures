#' @title Measure Registry
#'
#' @description
#' The [environment()] `measures` keeps track of all measures in this package.
#' Stores meta information about measures, such as minimum, maximum of if the
#' measure must be minimized or maximized.
#'
#' @export
#' @examples
#' names(measures)
#' measures$tpr
measures = new.env(parent = emptyenv())

# adds items to registry
add_measure = function(obj, title, type, lower, upper, minimize) {
  id = deparse(substitute(obj))

  assign(id, list(
      id = id,
      type = assert_choice(type, c("binary", "classif", "regr")),
      title = assert_string(title),
      lower = assert_number(lower),
      upper = assert_number(upper),
      predict_type = intersect(names(formals(obj)), c("response", "prob")),
      minimize = assert_flag(minimize, na.ok = TRUE)
  ), envir = measures)
}
