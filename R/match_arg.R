#' Partial Argument Matching
#'
# BSD 3-Clause License
#
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2022, Norwegian Veterinary Institute
# All rights reserved.
#
# The file has been imported from https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fgihub.com%2fmllg%2fcheckmate%2fR%2f&umid=5711e6e8-6122-4eba-99ce-c61fbc457186&auth=004f5606958fa2bf5d6199a524a3177448fdaa2d-13efb903a571b4c22cdde09383725f7bdd4c9fa8
# Modifications
# - Escaped square brackets in help text.
# - Included @details.
# - Use @rdname match_arg.
# - Rewritten to use \code{\link[base]{grep}} for partial matching instead of \code{\link[base]{pmatch}}.
# - Rewritten to include argument ignore.case.
# - Rewritten to include argument comment. Therefore, assert-functions from NVIcheckmate with argument comment are used.
#
#' @title Argument Verification Using Partial Matching
#'
#' @description match.arg matches arguments against a table of candidate values as specified
#'     by choices. Matching is done using \code{\link[base]{grep}}, and arguments
#'     may be abbreviated. If \code{ignore.case = TRUE}, case is ignored when performing
#'     the matching.
#' @details This is an extensions to \code{\link[checkmate]{matchArg}} with support
#'     for \code{ignore.case} and \code{comment}. \code{\link[checkmate]{matchArg}} is an extension of \code{\link[base]{match.arg}}
#'     with support for \code{\link{AssertCollection}}.
#'     The behavior is very similar to \code{\link[base]{match.arg}}, except that
#'     \code{NULL} is not a valid value for \code{x}. In addition, it is required that all values for \code{x} match a value in \code{choices} and that each value in \code{x} matches only one value in \code{choices}.
#'
#' @param x \[character\]\cr
#'  User provided argument to match.
#' @param choices \[character()\]\cr
#'  Candidates to match \code{x} with.
#' @param several.ok \[logical(1)\]\cr
#'  If \code{TRUE}, \code{x} should be allowed to have more than one element.
#' @param ignore.case \[\code{logical(1)}\]\cr
#'    Case is ignored if \code{TRUE}. Default is \code{FALSE}.
#' @template assert
#' @return Character vector with subset of \code{choices}.
#' @export
#' @rdname match_arg
#' @examples
#' match_arg("a", choices = c("Apple", "Banana"), ignore.case = TRUE)
#' match_arg(c("a", "Ban"), choices = c("Apple", "Banana"), several.ok = TRUE, ignore.case = TRUE)
match_arg <- function(x, choices, several.ok = FALSE, ignore.case = FALSE, .var.name = checkmate::vname(x), comment = NULL, add = NULL) {
  checkmate::assertCharacter(x = choices, min.len = 1L)
  checkmate::assertFlag(x = several.ok)
  checkmate::assertFlag(x = ignore.case)

  if (several.ok) {
    if (identical(x, choices))
      return(x)
    checkmate::assertCharacter(x = x, min.len = 1L, .var.name = .var.name, add = add)
    xx <- paste0("^", x, "[[:print:]]*")
    y <- sapply(X = xx, FUN = grep, value = TRUE, ignore.case = ignore.case, x = choices, simplify = TRUE)
    class_y <- class(y)
    if (length(class_y) == 1 & class_y[1] == "character") {
      yy <- unname(y)
    } else { # if class(y) not character
      if (length(class_y) == 1 & class_y[1] == "list") {
        yy <- x
        yy[which(lengths(y) == 1)] <- unname(unlist(y[which(lengths(y) == 1)]))
        if (any(lengths(y) > 1)) {
          comment <- paste(comment, "Abbreviated arguments can only be matched to one single value among the possible arguments")
        }
      } else { # if class(y) neither character nor list (i.e. is array and/or matrix)
        yy <- x
        comment <- paste(comment, "Abbreviated arguments can only be matched to one single value among the possible arguments")
      }
    }
    assert_subset_character(x = yy, choices = choices, empty.ok = FALSE, .var.name = .var.name,
                            comment = comment,
                            add = add)

  } else { # if several.ok = FALSE
    if (identical(x, choices))
      return(x[1L])
    checkmate::assertCharacter(x = x, len = 1L, .var.name = .var.name, add = add)
    xx <- paste0("^", x, "[[:print:]]*")
    yy <- grep(pattern = xx, value = TRUE, ignore.case = ignore.case, x = choices)
    if (length(yy) == 0) {
      yy <- x
    }
    if (length(yy) > 1) {
      yy <- x
      comment <- paste(comment, "Abbreviated arguments can only be matched to one single value among the possible arguments")
    }
    assert_choice_character(x = yy, choices = choices, .var.name = .var.name,
                            comment = comment,
                            add = add)
  }
  return(yy)
}
