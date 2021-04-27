#' @title Check if an object is an open RODBC-channel
#' @description Check if an object is an open RODBC-channel.  
#' @details The check uses \code{RODBC:::odbcValidChannel} to check if the argument is an open RODBC-channel.
#'     Be aware that this function is an internal \code{RODBC}-function and may change within that package without warning.
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @templateVar fn rodbc
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
#' check_rodbc(x = "journal_rapp", dbservice = "PJS")
#' }


check_rodbc <- function(x, dbservice = NULL) {
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
#' @include makeAssertion.R
#' @template assert
#' @rdname check_rodbc
assert_rodbc = checkmate::makeAssertionFunction(check_rodbc, use.namespace = FALSE)
