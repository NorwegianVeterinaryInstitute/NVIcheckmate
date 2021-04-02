### check_new_colname
#' @title check if name of new column already exist
#' @description Used in the add-functions to check if the name of a new column already exists as colnames in the data frame.
#' @details Compares the names of existing column in data with the new names of the columns that will be created.
#'    If a new column is the same as the code_column, an error is issues.
#'   if the name of the new already exist, an error is issued unless overwrite = TRUE.
#'
#' @param columns column names of existing columns in the data frame
#' @param new_column the column names of the new columns
#' @param code_column logical, TRUE if columns are the code variable, FALSE if the columns are not the code_column
#' @param overwrite whether existing columns should be overwriten

#' @return error if columns exist or TRUE if no error
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#' @examples
#' # error:
#' check_new_colname(columns = colnames(data), new_column = new_column, code_column = FALSE, overwrite = overwrite)


check_new_colname = function(columns, new_column, code_column = FALSE, overwrite = FALSE) {
  if (length(intersect(columns, new_column) ) >0) {
    if (code_column) {
      # issue error if the new column name is the same as the code column.
      return(paste0("The new column cannot have the same name as the code_column '",  paste(intersect(columns,  new_column), collapse = ", "),  "`."))
    }
    if (!code_column) {
      if (!overwrite) {
        # issue error if names already exists
        return(paste(paste0("The column name(s): '", paste(intersect(columns,  new_column), collapse = ", "), "' already exist in the data frame."),
                     paste0("Either give new column name(s) for the column(s) named '", paste(intersect(columns,  new_column), collapse = ", "), "' or"),
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
#' @include makeAssertion.R
#' @template assert
#' @rdname check_new_colname
assert_new_colname <- makeAssertionFunction(check_new_colname, use.namespace = FALSE)


