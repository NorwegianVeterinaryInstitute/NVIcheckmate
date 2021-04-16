#' @title Check if an argument is a subset of a given set regardless of case
#' @description Wrapper around code/{checkmate::check_subset} that accept code/{x} and code/{choices} in different case, ie the check is case insensitive.
#' @details check the argument is in agreement with the choices. By having case insensitive check it is possible to write the argument with combinations of lower and upper case which may make the argument easier to remember.
#'
#' @templateVar fn subset_anycase
#' @template x
#' @param choices Set of possible values. May be empty.
#' @param empty.ok  Treat zero-length \code{x} as subset of any set \code{choices} (this includes \code{NULL})?
#'  Default is \code{TRUE}.
#' @template fmatch
#' @template checker
#' @export
#' @examples
#' #TRUE
#' check_subset_anycase(x = "Apple", choices = c("apple", "pear", "orange", "banana"))
#' check_subset_anycase(x = c("Apple", "Pear"), choices = c("apple", "pear", "orange", "banana"))
#' #Error
#' check_subset_anycase(x = "Apples", choices = c("apple", "pear", "orange", "banana"))


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
                  checkmate:::set_collapse(choices),
                  " (case insensitive), but is ",
                  checkmate:::set_collapse(x))
                  # sub(paste0("'", paste0(xx, collapse = "', '"), "'"),
                  #     paste0("'", paste0(x, collapse = "', '"), "'"), 
                  #     substr(res, gregexpr("\\{", res)[[1]][2]+1, nchar(res))))

  }
  return(res)
}

#' @export
#' @include makeAssertion.R
#' @template assert
#' @rdname check_subset_anycase
assert_subset_anycase <- makeAssertionFunction(check_subset_anycase, use.namespace = FALSE)



