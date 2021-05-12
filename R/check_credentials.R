#' @title Check if an object is a service for which credentials are saved in the user profile 
#' @description Check if credentials are saved in the user profile for the service.
#'
#' @templateVar fn credentials
#' @template x
#' @template checker
#' @export
#' @examples
#' check_credentials(x = "PJS")
#' 

check_credentials <- function(x) {
  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # Perform checks
  checkmate::assert_character (x, len = 1, add = checks)
  # Report check-results
  checkmate::reportAssertions(checks)
  
  # PERFORM CHECK
  if (!is.element(tolower(x), tolower(keyring::key_list()[, 1]))) {
    res <- paste0(" (username and password) for the service '", 
                  x, 
                  "' have not been saved in the user's profile at this computer.",
                  "Use 'NVIdb::set_credentials' for saving the credentials in the user's profile")
  } else {
    res <- TRUE
  }
  return(res)
}

#' @export
#' @include makeAssertionFunction.R
#' @template custom.msg
#' @template assert
#' @rdname check_credentials
assert_credentials <- makeAssertionFunction(check_credentials)
