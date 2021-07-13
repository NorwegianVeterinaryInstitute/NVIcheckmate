#' @title Check if an argument is a subset of a given set ignoring case
#' @description Check if an object is a subset of a given set ignoring case in 
#'     the object name. The function is based on code/{checkmate::check_subset}.
#' @details The object must be of type character. The check is intended for functions were using 
#'     camelCase may make the argument easier to remember. Therefore, the input to the function is
#'     ignoring case.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn subset_ignore_case
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
#' check_subset_ignore_case(x = "Apple", choices = c("apple", "pear", "orange", "banana"))
#' check_subset_ignore_case(x = c("Apple", "Pear"), choices = c("apple", "pear", "orange", "banana"))
#' 
#' # returns a message
#' check_subset_ignore_case(x = "Tomato", choices = c("apple", "pear", "orange", "banana"))
#' 


check_subset_ignore_case <- function(x, choices, empty.ok = TRUE, fmatch = FALSE) {
  res <- checkmate::check_character(x=x)
  if (!isTRUE(res)) { return(res)}
  
  xx <- tolower(x)
  choicesx <- tolower(choices)
  res <- checkmate::check_subset(x = xx, choices = choicesx , empty.ok = empty.ok, fmatch = fmatch)
  if (!isTRUE(res)) {
    # set_collapse as used in check_choices to get identical string
    # copied from check_choice_ignore_case, must be modified
    res <- paste0(substr(res, 1, regexpr("\\{", res)[1]-1),
                  # set_collapse(choices),
                  paste0("{'", paste0(unique(choices), collapse = "','"), "'}"),
                  " (case is ignored), but is ",
                  # set_collapse(x)
                  paste0("{'", paste0(unique(x), collapse = "','"), "'}"))
    
  }
  return(res)
}


#' @export
#' @include makeAssertionFunction.R
#' @template comment
#' @template assert
#' @rdname check_subset_ignore_case
assert_subset_ignore_case <- makeAssertionFunction(check_subset_ignore_case)
