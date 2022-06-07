# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2021, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://gihub.com/mllg/checkmate/R/
# Modifications
# - Escaped square brackets in help text
# - Included information on source and functional changes in @description.
# - Included @details
# - Removed use.namespace from help and function
# - Included argument comment in created assert-functions.
#
#' @title Turn a Check into an Assertion
#'
#' @description \code{makeAssertionFunction} can be used to automatically create
#'     an assertion function based on a check function (see example). This is a
#'     modification of \code{checkmate::makeAssertionFunction} that includes the
#'     argument comment in the assertion function.
#'
#' @details The code is imported from \code{checkmate}. The modifications in the
#'     code is marked. The argument use.namespace is deleted as
#'     \code{checkmate::makeAssertion} and \code{checkmate::vname} always should
#'     be used.
#'
#' @template makeFunction
#  @template use.namespace  # Removed argument use.namespace as checkmate:makeAssertion should always be used
#' @param coerce \[\code{logical(1)}\]\cr
#'  If \code{TRUE}, injects some lines of code to convert numeric values to integer after an successful assertion.
#'  Currently used in \code{\link{assertCount}}, \code{\link{assertInt}} and \code{\link{assertIntegerish}}.
#' @export

# Removed argument use.namespace as checkmate:makeAssertion should always be used
# makeAssertionFunction = function(check.fun, c.fun = NULL, use.namespace = TRUE, coerce = FALSE, env = parent.frame()) {
makeAssertionFunction = function(check.fun, c.fun = NULL, coerce = FALSE, env = parent.frame()) {
  fun.name = if (is.character(check.fun)) check.fun else deparse(substitute(check.fun))
  check.fun = match.fun(check.fun)
  check.args = fun.args = formals(args(check.fun))
  x.name = names(fun.args[1L])
  new.fun = function() TRUE

  body = sprintf("if (missing(%s)) stop(sprintf(\"argument \\\"%%s\\\" is missing, with no default\", .var.name))", x.name)

  if (is.null(c.fun)) {
    body = paste0(body, sprintf("; res = %s(%s)", fun.name, paste0(names(check.args), collapse = ", ")))
  } else {
    body = paste0(body, sprintf("; res = .Call(%s)", paste0(c(c.fun, names(check.args)), collapse = ", ")))
  }

  if (coerce) {
    fun.args = c(fun.args, alist(coerce = FALSE))
  }

  # Modified to introduce argument comment (2 lines)
  # fun.args = c(fun.args, alist(comment = NULL))
  # body = paste0(body, "; if (!isTRUE(res) & !is.null(comment)) {res = paste0(res, '. ', comment) }")

  # Removed argument use.namespace as checkmate:makeAssertion should always be used
  # if (use.namespace) {
  fun.args = c(fun.args, list(.var.name = bquote(checkmate::vname(.(as.name(x.name)))), comment = NULL, add = NULL))
  body = paste0(body, "; if (!isTRUE(res) & !is.null(comment)) {res = paste0(res, '. ', comment) }")
  body = paste0(body, "; checkmate::makeAssertion")
  # } else {
  #   fun.args = c(fun.args, list(.var.name = bquote(vname(.(as.name(x.name)))), add = NULL))
  #   body = paste0(body, "; makeAssertion")
  # }
  body = paste0(body, sprintf("(%s, res, .var.name, add)", x.name))

  if (coerce) {
    body = paste0(body, "; if (isTRUE(coerce) && is.double(x)) x = setNames(as.integer(round(x, 0L)), names(x)); invisible(x)")
  }

  formals(new.fun) = fun.args
  body(new.fun) = parse(text = paste("{", body, "}"))
  environment(new.fun) = env
  return(new.fun)
}
