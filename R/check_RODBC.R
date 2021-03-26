### check_RODBC
#' @title Check if x is an open RODBC-channel
#' @description Argument checking of RODBC channels to check if the channel is open.
#' @details The check uses \code{RODBC:::odbcValidChannel} to check if the argument is anopen RODBC-channel.
#'     Be aware that this function is inernal and may change within the package without warning.
#'
#' @param x Object to check.
#' @param dbservice Data base service

#' @return error if there are no open channel to the dbservice, else TRUE
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @examples
#' \dontrun{
#' #login to PJS
#' journal_rapp <- login("PJS")
#'
#' # error check:
#' check_RODBC(x = "journal_rapp", dbservice = "PJS")
#' }
#' @noRd

check_RODBC <- function(x, dbservice) {
  if(!RODBC:::odbcValidChannel(channel)) {
    res <- paste( deparse(substitute(x)),
                  "is not an open RODBC channel for",
                  dbservice)
} else {
  res <- TRUE
}
  return(res)
}

# assertions:
assert_RODBC  = checkmate::makeAssertionFunction(check_RODBC)

