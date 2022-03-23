#' Partial Argument Matching
#'
# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2022, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://gihub.com/mllg/checkmate/R/
# Modifications
# - Escaped square brackets in help text
# - Included @details
# - Use @rdname match_arg
# - rewritten to use included argument ignore.case.
# - included assert-functions from NVIcheckmate to provide comments
#
#' @title Argument Verification Using Partial Matching
#'
#' @description match.arg matches arguments against a table of candidate values as specified
#'     by choices. Matching is done using \code{\link[base]{pmatch}}, so arguments
#'     may be abbreviated. If \code{ignore.case = TRUE}, case is ignored when doing
#'     the matching.
#' @details This is an extensions to \code{\link[checkmate]{matchArg}} with support
#'     of \code{ignore.case} that is an extension of \code{\link[base]{match.arg}}
#'     with support for \code{\link{AssertCollection}}.
#'     The behavior is very similar to \code{\link[base]{match.arg}}, except that
#'     \code{NULL} is not a valid value for \code{x}.
#'
#' @param x \[character\]\cr
#'  User provided argument to match.
#' @param choices \[character()\]\cr
#'  Candidates to match \code{x} with.
#' @param several.ok \[logical(1)\]\cr
#'  If \code{TRUE}, multiple matches are allowed, cf. \code{\link[base]{match.arg}}.
#' @param ignore.case \[\code{logical(1)}\]\cr
#'    Case is ignored if \code{TRUE}. Default is \code{FALSE}.
#' @template assert
#' @return Subset of \code{choices}.
#' @export
#' @rdname match_arg
#' @examples
#' match_arg("a", choices = c("Apple", "Banana"), ignore.case = TRUE)
match_arg = function(x, choices, several.ok = FALSE, ignore.case = FALSE, .var.name = checkmate::vname(x), comment = NULL, add = NULL) {
  checkmate::assertCharacter(choices, min.len = 1L)
  checkmate::assertFlag(several.ok)
  checkmate::assertFlag(ignore.case)

  if (several.ok) {
    if (identical(x, choices))
      return(x)
    checkmate::assertCharacter(x, min.len = 1L, .var.name = .var.name, add = add)
    if (isTRUE(ignore.case)) {
      xx = choices[pmatch(tolower(x), tolower(choices), nomatch = 0L, duplicates.ok = TRUE)]
    } else {
      xx = choices[pmatch(x, choices, nomatch = 0L, duplicates.ok = TRUE)]
    }
    if (length(xx) == 0) {x <- x} else {x <- xx}
    assert_subset_character(x, choices, empty.ok = FALSE, .var.name = .var.name,
                            comment = comment,
                            add = add)
  } else {
    if (identical(x, choices))
      return(x[1L])
    checkmate::assertCharacter(x, len = 1L, .var.name = .var.name, add = add)
    if (isTRUE(ignore.case)) {
      xx = choices[pmatch(tolower(x), tolower(choices), nomatch = 0L, duplicates.ok = TRUE)]
    } else {
      xx = choices[pmatch(x, choices, nomatch = 0L, duplicates.ok = TRUE)]
    }
    if (length(xx) == 0) {x <- x} else {x <- xx}
    assert_choice_character(x, choices, .var.name = .var.name,
                            comment = comment,
                            add = add)
  }
  return(x)
}
