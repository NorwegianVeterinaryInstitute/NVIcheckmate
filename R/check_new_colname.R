#' @title Check if an object already is used as a column name
#' @description Used in the add-functions to check if the name of a new column already exists as column name in 
#'    the data frame.
#' @details Compares the names of existing column(s) in data frame with the new names of the columns that should be created.
#'    If a new column is the same as the code column, an error is issued. Use the argument \code{code_columne = TRUE} to
#'    indicate that the argument to the columns are the code column.
#'    If the name of the new column already exist but \code{code_column = FALSE}, an error is issued unless \code{overwrite = TRUE}.
#'
#' @templateVar fn NewColname
#' @template x
#' @param columns \[\code{character}\]\cr
#'    The column names of the existing column(s)
#' @param code_column \[\code{logical(1)}\]\cr
#'    Whether the existing column(s) (\code{x}) is the code_column or not.
#' @param overwrite \[\code{logical(1)}\]\cr
#'    Whether existing columns should be overwritten. Only applicable if \code{code_column = FALSE}

#' @template checker

#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#' @examples
#' # error:
#'   check_new_colname(x = "komnr",
#'                     columns = c("saksnr", "komnr"),
#'                     code_column = FALSE,
#'                     overwrite = FALSE)
#'                     


check_new_colname <- function(x, columns, code_column = FALSE, overwrite = FALSE) {
  if (length(intersect(columns, x) ) >0) {
    if (code_column) {
      # issue error if the new column name is the same as the code column.
      return(paste0("The new column cannot have the same name as the code_column '",  paste(intersect(columns,  x), collapse = ", "),  "`."))
    }
    if (!code_column) {
      if (!overwrite) {
        # issue error if names already exists
        return(paste(paste0("The column name(s): '", paste(intersect(columns,  x), collapse = ", "), "' already exist in the data frame."),
                     paste0("Either give new column name(s) for the column(s) named '", paste(intersect(columns,  x), collapse = ", "), "' or"),
                     "specify overwrite = TRUE to replace values in the existing column(s) with new content.", sep = " "))
      } else {
        return(TRUE)
      }
    }
  } else {
    return(TRUE)
  }
}


#' @export
#' @include makeAssertionFunction.R
#' @template custom.msg
#' @template assert
#' @rdname check_new_colname
assert_new_colname <- makeAssertionFunction(check_new_colname)

