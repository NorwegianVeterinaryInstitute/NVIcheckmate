# ARGUMENT CHECKING ----
# Argument checking is based on package checkmate. Here argument checking extending checkmate is given.

#
### check_subset_anycase
#' @title Extension of check_subset that don't check the case.
#' @description Argument checking of choices that accept both lower and upper case, ie the check is caseinsensitive. The function is based on code/{checkmate::check_choice}
#' @details check the argument is in agreement with the choices. By having caseinsensitive check it is possible to write the argument with combinations of lower and upper case which May make the argument easier to remember.
#'
#' @param x Object to check.
#' @param choices Set of valid values for x
#' @param null.ok If set to TRUE, x may also be NULL. In this case only a type check of x is performed, all additional checks are disabled.
#' @param fmatch Use the set operations implemented in fmatch in package fastmatch. If fastmatch is not installed, this silently falls back to match.

#' @return error if columns exist or TRUE if no error
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @examples
#' \dontrun{
#' # warning:
#' check_subset_anycase(x = "colClasses", choices = c() , null.ok = FALSE, fmatch = FALSE)
#' }
#' @noRd


check_subset_anycase = function(x, choices, empty.ok = TRUE, fmatch = FALSE) {
  res <- checkmate::check_character(x=x, min.len = 1)
  if (res != TRUE) { return(res)}

    xx <- tolower(x)
  choicesx <- tolower(choices)
  res <- checkmate::check_subset(x = xx, choices = choicesx , null.ok = null.ok, fmatch = fmatch)
  if (res != TRUE) {
    # set_collapse as used in check_choices to get identical string
    # copied from check_choice_anycase, must be modified
    res <- paste0(substr(res, 1, regexpr("\\{", res)[1]-1),
                  checkmate:::set_collapse(choices),
                  " (case insensitive)",
                  sub(xx, x, substr(res, regexpr("\\}", res)[1]+1, nchar(res))))

  }
  return(res)
}

# assertions:
assert_subset_anycase  = checkmate::makeAssertionFunction(check_subset_anycase)




