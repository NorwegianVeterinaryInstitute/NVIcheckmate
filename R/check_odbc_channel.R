#' @title Check if an object is an open ODBC-channel
#' @description Check if an object is an open ODBC-channel.
#' @details The check uses \code{RODBC:::odbcValidChannel} to check
#'     if the argument is an open ODBC-channel. Be aware that this
#'     function is an internal \code{RODBC}-function and may change
#'     within that package without warning.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn odbc_channel
#' @template x
#' @param dbservice \[character(1)\]\cr
#'     The database the channel should be connect to.
#' @param dbinterface \[character(1)\]\cr
#'     The R-package that is used for interface towards the data
#'     base. Defaults to \code{NULL}.
#' @template checker
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # login to PJS
#' journal_rapp <- login("PJS")
#'
#' # error check:
#' check_odbc_channel(x = "journal_rapp", dbservice = "PJS")
#' }
#'
check_odbc_channel <- function(x, dbservice = NULL, dbinterface = "odbc") {
  # ARGUMENT CHECKING
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()

  # dbinterface
  checkmate::assert_choice(dbinterface, choices = c("odbc", "RODBC", "RPostgreSQL"), add = checks)

  # Report check-results
  checkmate::reportAssertions(checks)

  # CHECK IF OPEN CHANNEL
  res <- FALSE
  if (dbinterface %in% c("odbc", "RPostgreSQL")) {
    if (DBI::dbIsValid(x)) {res <- TRUE }
  }
  if (dbinterface %in% c("RODBC")) {
    if (RODBC:::odbcValidChannel(x)) {res <- TRUE }
  }
  if (isFALSE(res)) {
    if (!is.null(dbservice)) {dbservice <- paste("for", dbservice)}
    res <- paste(deparse(substitute(x)),
                 "is not an open odbc channel",
                 dbservice,
                 "when using package",
                 dbinterface)
  }
  return(res)
}

#' @export
#' @include makeAssertionFunction.R
#' @template assert
#' @rdname check_odbc_channel
assert_odbc_channel = makeAssertionFunction(check_odbc_channel)
