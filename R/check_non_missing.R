#' @title Check if two or more arguments are NULL or NA
#' @description Check whether two or more arguments that may replace each other both are NULL or NA. 
#' @details In some functions, one argument may replace another. The check is used to ensure that at least on of the arguments have a value. Specific checks for each argument should be used in addition. 
#' @templateVar fn non_missing
#' @param x \[any\]\cr
#'  List with objects to check.
#' @template checker
#' @export
#' @examples
#' data <- NULL
#' nrows_in_data <- 56
#' check_non_missing(x = list(data, nrows_in_data))
#' 

check_non_missing <- function(x) {
  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # Perform checks
  checkmate::assert_list(x, min.len = 2, null.ok = TRUE, add = checks)
  # Report check-results
  checkmate::reportAssertions(checks)
  
  # PERFORM CHECK ---- 
  res <- FALSE
  for (i in c(1:length(x))) {
    if (!is.null(x[[i]])) {
      if (!is.na(x[[i]])) {res <- TRUE} 
    } 
  } 
  if (!res) {
    res <- paste0("At least one of the arguments ", 
                  # "{'", 
                  # paste0(deparse(substitute(x)), collapse = "','"),
                  # "'} ", 
                  "must have input different from NULL and NA.")
  } 
  return(res)
}

#' @export
#' @include makeAssertionFunction.R
# @template comment
#' @template assert
#' @rdname check_non_missing
assert_non_missing <- makeAssertionFunction(check_non_missing)
