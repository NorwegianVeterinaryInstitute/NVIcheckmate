#' @title Check if an object is an element of a given set
#' @description Check if an object is an element of a given set in
#'     the object name. The function is based on \code{checkmate::check_choice},
#'     but includes the argument \code{ignore.case}.
#' @details The object must be of type character. The check is intended
#'     for functions were using camelCase may make the argument easier
#'     to remember. Therefore, the function will ignore case if
#'     \code{ignore.case = TRUE}.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn choice_character
#' @template x
#' @param choices [\code{character}]\cr
#'    Set of possible values.
#' @template null.ok
#' @param ignore.case [\code{logical(1)}]\cr
#'    Case is ignored if \code{TRUE}. Default is \code{FALSE}.
#' @template fmatch
#' @template checker
#'
#' @examples
#' # returns TRUE
#' check_choice_character(x = "APPLE",
#'                      choices = c("Apple", "Pear", "Orange"),
#'                      null.ok = FALSE,
#'                      ignore.case = TRUE,
#'                      fmatch = FALSE)
#' @export

check_choice_character <- function(x, choices, null.ok = FALSE, ignore.case = FALSE, fmatch = FALSE) {
  res <- checkmate::check_character(x = x, len = 1)
  if (!isTRUE(res)) { return(res)}

  if (isTRUE(ignore.case)) {
    xx <- tolower(x)
    choicesx <- tolower(choices)
  } else {
    xx <- x
    choicesx <- choices
  }
  res <- checkmate::check_choice(x = xx, choices = choicesx, null.ok = null.ok, fmatch = fmatch)
  if (!isTRUE(res) & isTRUE(ignore.case)) {
    # set_collapse as used in check_choices to get identical string
    res <- paste0(substr(res, 1, regexpr("\\{", res)[1] - 1),
                  # set_collapse(choices),
                  paste0("{'", paste0(unique(choices), collapse = "', '"), "'}"),
                  " (case is ignored)",
                  sub(xx, x, substr(res, regexpr("\\}", res)[1] + 1, nchar(res))))
  }
  return(res)
}


#' @export
#' @include makeAssertionFunction.R
# @template comment
#' @template assert
#' @rdname check_choice_character
assert_choice_character = makeAssertionFunction(check_choice_character)
