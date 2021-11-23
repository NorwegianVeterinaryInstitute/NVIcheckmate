#' @title Check if an argument is a subset of a given set ignoring case
#' @description Check if an object is a subset of a given set in 
#'     the object name. The function is based on code/{checkmate::check_subset},
#'     but includes the argument \code{ignore.case}.
#' @details The object must be of type character. The check is intended for functions were using 
#'     camelCase may make the argument easier to remember. Therefore, the input to the function is
#'     ignoring case.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn subset_character
#' @template x
#' @param choices \[\code{character}\]\cr
#'    Set of possible values. May be empty.
#' @param empty.ok \[\code{logical(1)}\]\cr
#'    Treat zero-length \code{x} as subset of any set \code{choices} (this includes \code{NULL})? 
#'    Default is \code{TRUE}.
#' @param ignore.case \[\code{logical(1)}\]\cr
#'    Case is ignored if \code{TRUE}. Default is \code{FALSE}.
#' @template fmatch
#' @template checker
#' 
#' @export
#' @examples
#' # returns TRUE
#' check_subset_character(x = "Apple", 
#'                        choices = c("apple", "pear", "orange", "banana"), 
#'                        ignore.case = TRUE)
#' check_subset_character(x = c("Apple", "Pear"), 
#'                        choices = c("apple", "pear", "orange", "banana"), 
#'                        ignore.case = TRUE)
#' 
#' # returns a message
#' check_subset_character(x = "Tomato", 
#'                        choices = c("apple", "pear", "orange", "banana"), 
#'                        ignore.case = TRUE)
#' 


check_subset_character <- function(x, choices, ignore.case = FALSE, empty.ok = TRUE, fmatch = FALSE) {
  res <- checkmate::check_character(x=x)
  if (!isTRUE(res)) { return(res)}
  
  if (isTRUE(ignore.case)) { 
    xx <- tolower(x)
    choicesx <- tolower(choices)
  } else {
    xx <- x
    choicesx <- choices
  }
  res <- checkmate::check_subset(x = xx, choices = choicesx , empty.ok = empty.ok, fmatch = fmatch)
  if (!isTRUE(res) & isTRUE(ignore.case)) {
    # set_collapse as used in check_choices to get identical string
    # copied from check_choice_ignore_case, must be modified
    res <- paste0(substr(res, 1, regexpr("\\{", res)[1]-1),
                  # set_collapse(choices),
                  paste0("{'", paste0(unique(choices), collapse = "', '"), "'}"),
                  " (case is ignored), but is ",
                  # set_collapse(x)
                  paste0("{'", paste0(unique(x), collapse = "', '"), "'}"))
    
  }
  return(res)
}


#' @export
#' @include makeAssertionFunction.R
#' @template assert
#' @rdname check_subset_character
assert_subset_character <- makeAssertionFunction(check_subset_character)

