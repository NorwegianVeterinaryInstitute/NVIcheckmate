#' @title Check if data has duplicate rows
#' @description Check if data has duplicate rows for one or more group variables.
#' @details Used the check that the group variables can be a unique identifyer
#'     of rows in the data. The data can be data.frame, tibble or data.table.
#'
#' The function is mainly intended to be used to check data in scripts
#'     transforming data. In particular, it is intended for use routine scripts
#'     preparing data to avoid that there are more than one row for group
#'     variables that should be unique, for example in data with
#'     "prodnr8" properties where "prodnr8" is expected to by an unique id. This
#'     can be important to avoid problems in for example joins/mergings.
#' @templateVar fn duplicate_rows
#' @template x
#' @param group_var [\code{character}]\cr
#' The variables in the data that should constitute an unique id. Defaults to
#'     \code{NULL}.
#' @template checker
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#' @examples
#' \dontrun{
#' # Creating data
#' pt_data <- as.data.frame(list("prodnr8" = c("01234567", "12345678"), "P157" = c(200, 300)))
#' prod_name <- as.data.frame(
#'     list("prodnr8" = c("01234567", "12345678", "12345678"),
#'          "prodnr10" = c("0123456713", "1234567814", "1234567826"),
#'          "navn" = c("Ola Nordmann", "Kari Trestakk", "Per Trestakk")))
#' # merge
#' pt_data <- merge(pt_data, prod_name, by = "prodnr8")
#' # checking for double rows per prodnr8
#' assert_duplicate_rows(x = pt_data,
#'                         group_var = "prodnr8",
#'                         comment = "Checked after merging pt_data med prod_name")
#' }
#'
check_duplicate_rows <- function(x, group_var) {

  # Get name of input data frame
  df_name <- deparse(substitute(x))

  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # data
  checkmate::assert_data_frame(x, add = checks)
  # id
  checkmate::assert_subset(group_var, choices = colnames(x), empty.ok = FALSE, add = checks)
  # Report check-results
  checkmate::reportAssertions(checks)


  # PERFORM CHECK ----
  res <- FALSE
  # FIND NUMBER OF DOUBLE ROWS ----
  x$count <- 1
  duplicate_rows <- stats::aggregate(x[c("count")], by = x[group_var], FUN = sum, na.rm = TRUE)
  duplicate_rows <- duplicate_rows[which(duplicate_rows$count > 1), c(group_var, "count")]
  if (nrow(duplicate_rows) == 0) {res <- TRUE}
  if (!res) {
    res <- paste0("The data: '", df_name,
                   "' has at least ",
                   nrow(duplicate_rows),
                   " unique combinations of the group variables '",
                   paste(group_var, collapse = ', '), "' ",
                  " with more than one row per group variable compination")
  }
  return(res)
}


#' @export
#' @include makeAssertionFunction.R
#' @template assert
#' @rdname check_duplicate_rows
assert_duplicate_rows = makeAssertionFunction(check_duplicate_rows)
