# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2023, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://github.com/mllg/checkmate/
# Modifications
# - Escaped square brackets in help text
# - Included @details
# - Corrected to names in @templateVar
# - Corrected to disjunct.from in @param disjunct.from
# - Wrote a short version of @return in stead of using template
# - Use @rdname assert_integer
# - generate the assert-function using
#    NVIcheckmate::makeAssertionFunction to include argument comment.
#
#' @title Check if an argument is vector of type integer
#'
#' @description Check if an argument is vector of type integer.
#' @details The assertions are based on \code{checkmate::checkInteger}. \code{NVIcheckmate::assert_integer}
#'     differs from \code{checkmate::assert_integer} in including the argument \code{comment = }. The help
#'     is updated to reflect the changes.
#'
#' @templateVar fn Integer
#' @template x
#' @template bounds
#' @param any.missing \[\code{logical(1)}\]\cr
#'     Are vectors with missing values allowed? Default is \code{TRUE}.
#' @param all.missing \[\code{logical(1)}\]\cr
#'     Are vectors with no non-missing values allowed? Default is \code{TRUE}.
#'     Note that empty vectors do not have non-missing values.
#' @param len \[\code{integer(1)}\]\cr
#'     Exact expected length of \code{x}.
#' @param min.len \[\code{integer(1)}\]\cr
#'     Minimal length of \code{x}.
#' @param max.len \[\code{integer(1)}\]\cr
#'     Maximal length of \code{x}.
#' @param unique \[\code{logical(1)}\]\cr
#'     Must all values be unique? Default is \code{FALSE}.
#' @template sorted
#' @param names \[\code{character(1)}\]\cr
#'     Check for names. See \code{\link{checkNamed}} for possible values.
#'     Default is \dQuote{any} which performs no check at all.
#'     Note that you can use \code{\link{checkSubset}} to check for a specific set of names.
#' @template typed.missing
#' @template null.ok
#' @template checker
#' @template assert
#' @template na-handling
#'

#' @return If the check is successful, the function
#'  \code{assert_integer} return \code{x} invisibly.\cr
#'  If the check is not successful,
#'  \code{assert_integer} throws an error message.
#'
#' @export
#' @rdname assert_integer

#' @include makeAssertionFunction.R
assert_integer = makeAssertionFunction(checkmate::checkInteger)
