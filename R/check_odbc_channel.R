#' @title Check if an object is an open ODBC-channel
#' @description Check if an object is an open ODBC-channel.  
#' @details The check uses \code{RODBC:::odbcValidChannel} to check if the argument is an open ODBC-channel.
#'     Be aware that this function is an internal \code{RODBC}-function and may change within that package without warning.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn odbc_channel
#' @template x
#' @param dbservice \[character(1)\]\cr
#'     The database the channel should be connect to. 
#' @template checker
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' #login to PJS
#' journal_rapp <- login("PJS")
#'
#' # error check:
#' check_odbc_channel(x = "journal_rapp", dbservice = "PJS")
#' }


check_odbc_channel <- function(x, dbservice = NULL) {
  if(!RODBC:::odbcValidChannel(x)) {
    res <- paste(deparse(substitute(x)),
                  "is not an open RODBC channel")
    if (!is.null(dbservice)) {res <- paste(res, "for", dbservice)}
} else {
  res <- TRUE
}
  return(res)
}

#' @export
#' @include makeAssertionFunction.R
#' @template assert
#' @rdname check_odbc_channel
assert_odbc_channel = makeAssertionFunction(check_odbc_channel)
