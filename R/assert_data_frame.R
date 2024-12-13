# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2024, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://github.com/mllg/checkmate/
# Modifications
# - Escaped square brackets in help text
# - Included @details
# - Wrote a short version of @return in stead of using template
# - Use @rdname assert_data_frame
# - generate the assert-function using
#    NVIcheckmate::makeAssertionFunction to include argument comment.
#
#' @title Check if an argument is vector of type data frame
#'
#' @description Check if an argument is vector of type data frame.
#' @details The assertions are based on
#'     \ifelse{html}{\code{\link[checkmate:check_data_frame]{checkmate::check_data_frame}}}{\code{checkmate::check_data_frame}}.
#'     \code{NVIcheckmate::assert_data_frame} differs from
#'     \ifelse{html}{\code{\link[checkmate:check_data_frame]{checkmate::assert_data_frame}}}{\code{checkmate::assert_data_frame}}
#'     in including the argument \code{comment}. The help
#'     is updated to reflect the changes.
#'
#' @templateVar fn Integer
#' @template x
#' @param types [\code{character}]\cr
#' Character vector of class names. Each list element must inherit
#'     from at least one of the provided types. The types “logical”,
#'     “integer”, “integerish”, “double”, “numeric”, “complex”,
#'     “character”, “factor”, “atomic”, “vector” “atomicvector”,
#'     “array”, “matrix”, “list”, “function”, “environment” and
#'     “null” are supported. For other types inherits is used as a
#'     fallback to check x's inheritance. Defaults to character(0)
#'     (no check).
#' @param any.missing [\code{logical(1)}]\cr
#' Are vectors with missing values allowed? Default is \code{TRUE}.
#' @param all.missing [\code{logical(1)}]\cr
#' Are vectors with no non-missing values allowed? Default is \code{TRUE}.
#'     Note that empty vectors do not have non-missing values.
#' @param min.rows [\code{integer(1)}]\cr
#' Minimum number of rows.
#' @param max.rows [\code{integer(1)}]\cr
#' Maximum number of rows.
#' @param min.cols [\code{integer(1)}]\cr
#' Minimum number of columns.
#' @param max.cols [\code{integer(1)}]\cr
#' Maximum number of columns.
#' @param nrows [\code{integer(1)}]\cr
#' Exact number of rows.
#' @param ncols [\code{integer(1)}]\cr
#' Exact number of columns.
#' @param row.names [\code{character(1)}]\cr
#' Check for row names. Default is “NULL” (no check). See
#'     \ifelse{html}{\code{\link[checkmate:check_named]{checkmate::check_named}}}{\code{checkmate::check_named}}
#'     for possible values. Note that you can use
#'     \ifelse{html}{\code{\link[checkmate:check_subset]{checkmate::check_subset}}}{\code{checkmate::check_subset}}
#'     to check for a specific set of names.
#' @param col.names [\code{character(1)}]\cr
#' Check for column names. Default is “NULL” (no check). See
#'     \ifelse{html}{\code{\link[checkmate:check_named]{checkmate::check_named}}}{\code{checkmate::check_named}}
#'     for possible values. Note that you can use
#'     \ifelse{html}{\code{\link[checkmate:check_subset]{checkmate::check_subset}}}{\code{checkmate::check_subset}}
#'     to test for a specific set of names.
#' @template null.ok
#' @template checker
#' @template assert
#' @template na-handling
#'
#' @return If the check is successful, the function
#'  \code{assert_data_frame} return \code{x} invisibly.\cr
#'  If the check is not successful,
#'  \code{assert_data_frame} throws an error message.
#'
#' @export
#' @rdname assert_data_frame
#' @include makeAssertionFunction.R
assert_data_frame = makeAssertionFunction(checkmate::check_data_frame)
