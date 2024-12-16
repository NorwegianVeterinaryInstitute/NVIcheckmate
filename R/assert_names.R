# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2021, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://gihub.com/mllg/checkmate/R/
# Modifications
# - Included @details
# - Corrected to names in @templateVar
# - Corrected to disjunct.from in @param disjunct.from
# - Wrote a short version of @return in stead of using template
# - Use @rdname assert_names
# - generate the assert-function using
#    NVIcheckmate::makeAssertionFunction to include argument comment.
#
#' Check names to comply to specific rules
#'
#' @description
#' Performs assertions with various checks on character vectors, usually names.
#' @details The assertions are based on \code{checkmate::checkNames}. \code{NVIcheckmate::assert_names}
#'     differs from \code{checkmate::assert_names} in including the argument \code{comment = }. The help
#'     is updated to reflect the changes.
#'
#' @templateVar fn names
#' @param x [\code{character} | \code{NULL}]\cr
#'  Names to check using rules defined via \code{type}.
#' @param type [character(1)]\cr
#'  Type of formal check(s) to perform on the names.
#'  \describe{
#'  \item{unnamed:}{Checks \code{x} to be \code{NULL}.}
#'  \item{named:}{Checks \code{x} for regular names which excludes names to be \code{NA} or empty (\code{""}).}
#'  \item{unique:}{Performs checks like with \dQuote{named} and additionally tests for non-duplicated names.}
#'  \item{strict:}{Performs checks like with \dQuote{unique} and additionally fails for names with UTF-8 characters
#'      and names which do not comply to R's variable name restrictions. As regular expression, this is
#'      \dQuote{^\[.\]*\[a-zA-Z\]+\[a-zA-Z0-9._\]*$}.}
#'  \item{ids:}{Same as \dQuote{strict}, but does not enforce uniqueness.}
#'  }
#'  Note that for zero-length \code{x}, all these name checks evaluate to \code{TRUE}.
#' @param subset.of [\code{character}]\cr
#'  Names provided in \code{x} must be subset of the set \code{subset.of}.
#' @param must.include [\code{character}]\cr
#'  Names provided in \code{x} must be a superset of the set \code{must.include}.
#' @param permutation.of [\code{character}]\cr
#'  Names provided in \code{x} must be a permutation of the set \code{permutation.of}.
#'  Duplicated names in \code{permutation.of} are stripped out and duplicated names in \code{x}
#'  thus lead to a failed check.
#'  Use this argument instead of \code{identical.to} if the order of the names is not relevant.
#' @param identical.to [\code{character}]\cr
#'  Names provided in \code{x} must be identical to the vector \code{identical.to}.
#'  Use this argument instead of \code{permutation.of} if the order of the names is relevant.
#' @param disjunct.from [\code{character}]\cr
#'  Names provided in \code{x} must may not be present in the vector \code{disjunct.from}.
#' @param what [\code{character(1)}]\cr
#'  Type of name vector to check, e.g. \dQuote{names} (default), \dQuote{colnames} or \dQuote{rownames}.
#' @template assert
#' @return If the check is successful, the function
#'  \code{assert_names} return \code{x} invisibly.\cr
#'  If the check is not successful,
#'  \code{assert_names} throws an error message.
#'
#' @export
#' @rdname assert_names


#' @include makeAssertionFunction.R
assert_names = makeAssertionFunction(checkmate::checkNames)
