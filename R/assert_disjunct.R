# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2023, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://gihub.com/mllg/checkmate/R/
# Modifications
# - Escaped square brackets in help text
# - Included @details
# - Corrected to names in @templateVar
# - Corrected to disjunct.from in @param disjunct.from
# - Wrote a short version of @return in stead of using template
# - Use @rdname assert_disjunct
# - generate the assert-function using
#    NVIcheckmate::makeAssertionFunction to include argument comment.
#
#' @title Check if an argument is disjunct from a given set
#'
#' @description Check if an argument is disjunct from a given set.
#' @details The assertions are based on \code{checkmate::checkDisjunct}. \code{NVIcheckmate::assert_disjunct}
#'     differs from \code{checkmate::assert_disjunct} in including the argument \code{comment = }. The help
#'     is updated to reflect the changes.
#'
#' @templateVar fn disjunct
#' @template x
#' @param y [atomic]\cr
#'     Other set.
#' @template fmatch
#' @template assert
#' @return If the check is successful, the function
#'  \code{assert_disjunct} return \code{x} invisibly.\cr
#'  If the check is not successful,
#'  \code{assert_disjunct} throws an error message.
#'
#' @export
#' @rdname assert_disjunct


#' @include makeAssertionFunction.R
assert_disjunct = makeAssertionFunction(checkmate::checkDisjunct)
