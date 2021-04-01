### check_RODBC
#' @title Check if x is an open RODBC-channel
#' @description Argument checking of RODBC channels to check if the channel is open.
    If the channel is not open and the database has returned an error message, this error message is added to the message. 
#' @details The check uses \code{RODBC:::odbcValidChannel} to check if the argument is anopen RODBC-channel.
#'     Be aware that this function is internal and may change within the package without warning.
#'
#' @templateVar fn RODBC
#' @template x
#' @param dbservice The database the channel should be connect to. 
#' @template checker
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#'
#' @examples
#' \dontrun{
#' #login to PJS
#' journal_rapp <- login("PJS")
#'
#' # error check:
#' check_RODBC(x = "journal_rapp", dbservice = "PJS")
#' }


check_RODBC <- function(x, dbservice) {
  if(!RODBC:::odbcValidChannel(x)) {
    res <- paste( deparse(substitute(x)),
                  "is not an open RODBC channel for",
                  dbservice)
} else {
  res <- TRUE
}
  return(res)
}

#' @export
#' @include makeAssertion.R
#' @template assert
#' @rdname check_RODBC
assert_RODBC  = checkmate::makeAssertionFunction(check_RODBC, use.namespace = FALSE)
