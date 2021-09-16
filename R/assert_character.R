# BSD 3-Clause License
# 
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2021, Norwegian Veterinary Institute 
# All rights reserved.
#
# The file has been imported from https://gihub.com/mllg/checkmate/R/ 
# Modifications
# - Escaped square brackets in help text
# - Included @details
# - Wrote a short version of @return in stead of using template
# - Use @rdname assert_character
# - generate the assert-function using
#    NVIcheckmate::makeAssertionFunction to include argument comment. 
# 
#' Check if an argument is a vector of type character
#'
#' @description Performs assertions if an argument is a vector of type character.
#' @details The assertions are based on \code{checkmate::checkCharacter}. \code{NVIcheckmate::assert_character} 
#'     differs from \code{checkmate::assert_character} in including the argument \code{comment = }. The help 
#'     is updated to reflect the changes.
#'
#' @templateVar fn character
#' @template x
#' @template na-handling
#' 
#' @param any.missing \[\code{logical(1)}\]\cr
#'  Are vectors with missing values allowed? Default is \code{TRUE}.
#' @param all.missing \[\code{logical(1)}\]\cr
#'  Are vectors with no non-missing values allowed? Default is \code{TRUE}.
#'  Note that empty vectors do not have non-missing values.
#' @param len \[\code{integer(1)}\]\cr
#'  Exact expected length of \code{x}.
#' @param min.len \[\code{integer(1)}\]\cr
#'  Minimal length of \code{x}.
#' @param max.len \[\code{integer(1)}\]\cr
#'  Maximal length of \code{x}.
#' @param unique \[\code{logical(1)}\]\cr
#'  Must all values be unique? Default is \code{FALSE}.
#' @param names \[\code{character(1)}\]\cr
#'  Check for names. See \code{\link{checkNamed}} for possible values.
#'  Default is \dQuote{any} which performs no check at all.
#'  Note that you can use \code{\link{checkSubset}} to check for a specific set of names.
#'  
#' @param pattern \[\code{character(1L)}\]\cr
#'  Regular expression as used in \code{\link[base:grep]{grepl}}.
#'  All non-missing elements of \code{x} must comply to this pattern.
#' @param fixed \[\code{character(1)}\]\cr
#'  Substring to detect in \code{x}. Will be used as \code{pattern} in \code{\link[base:grep]{grepl}}
#'  with option \code{fixed} set to \code{TRUE}.
#'  All non-missing elements of \code{x} must contain this substring.
#' @param ignore.case \[\code{logical(1)}\]\cr
#'  See \code{\link[base:grep]{grepl}}. Default is \code{FALSE}.
#' @param min.chars \[\code{integer(1)}\]\cr
#'  Minimum number of characters for each element of \code{x}.
#' @template sorted
#' @template null.ok
#' @template assert
#' @return If the check is successful, the function 
#'  \code{assert_character} return \code{x} invisibly.\cr
#'  If the check is not successful, 
#'  \code{assert_character} throws an error message.
#' 
#' @export
#' @rdname assert_character


#' @include makeAssertionFunction.R
# assert_character = makeAssertionFunction(checkmate::check_character())
assert_character <- function (x, min.chars = NULL, pattern = NULL, fixed = NULL, 
                              ignore.case = FALSE, any.missing = TRUE, all.missing = TRUE, 
                              len = NULL, min.len = NULL, max.len = NULL, unique = FALSE, 
                              sorted = FALSE, names = NULL, null.ok = FALSE, .var.name = checkmate::vname(x), 
                              comment = NULL, add = NULL) 
{
  if (missing(x)) 
    stop(sprintf("argument \"%s\" is missing, with no default", 
                 .var.name))
  res = checkmate::checkCharacter(x, min.chars, pattern, fixed, ignore.case, 
                                  any.missing, all.missing, len, min.len, max.len, unique, 
                                  sorted, names, null.ok)
  if (!isTRUE(res) & !is.null(comment)) {
    res = paste0(res, ". ", comment)
  }
  checkmate::makeAssertion(x, res, .var.name, add)
}


