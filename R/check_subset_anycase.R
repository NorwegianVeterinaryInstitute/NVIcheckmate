#' @title Check if an argument is a subset of a given set regardless of case
#' @description Check if an object is a subset of a given set regardless of the object name is 
#'     written in lower and upper case. The function is based on code/{checkmate::check_subset}.
#' @details The object must be of type character. The check is intended for functions were using 
#'     camelCase may make the argument easier to remember. Therefore, the input to the function is
#'     made case insensitive.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn subset_anycase
#' @template x
#' @param choices \[\code{character}\]\cr
#'    Set of possible values. May be empty.
#' @param empty.ok \[\code{logical(1)}\]\cr
#'    Treat zero-length \code{x} as subset of any set \code{choices} (this includes \code{NULL})? 
#'    Default is \code{TRUE}.
#' @template fmatch
#' @template checker
#' 
#' @export
#' @examples
#' # returns TRUE
#' check_subset_anycase(x = "Apple", choices = c("apple", "pear", "orange", "banana"))
#' check_subset_anycase(x = c("Apple", "Pear"), choices = c("apple", "pear", "orange", "banana"))
#' 
#' # returns a message
#' check_subset_anycase(x = "Tomato", choices = c("apple", "pear", "orange", "banana"))
#' 


check_subset_anycase <- function(x, choices, empty.ok = TRUE, fmatch = FALSE) {
  res <- checkmate::check_character(x=x)
  if (res != TRUE) { return(res)}

    xx <- tolower(x)
  choicesx <- tolower(choices)
  res <- checkmate::check_subset(x = xx, choices = choicesx , empty.ok = empty.ok, fmatch = fmatch)
  if (res != TRUE) {
    # set_collapse as used in check_choices to get identical string
    # copied from check_choice_anycase, must be modified
    res <- paste0(substr(res, 1, regexpr("\\{", res)[1]-1),
                  # set_collapse(choices),
                  paste0("{'", paste0(unique(choices), collapse = "','"), "'}"),
                  " (case insensitive), but is ",
                  # set_collapse(x)
                  paste0("{'", paste0(unique(x), collapse = "','"), "'}"))

  }
  return(res)
}


#' @export
#' @include makeAssertionFunction.R
#' @template custom.msg
#' @template assert
#' @rdname check_subset_anycase
assert_subset_anycase <- makeAssertionFunction(check_subset_anycase)

