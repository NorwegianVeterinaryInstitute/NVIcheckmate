#' @title Check if an object is a service for which credentials are saved in the user profile
#' @description Check if credentials are saved in the user profile for the service.
#'
#' @templateVar fn credentials
#' @template x
#' @template checker
#' @export
#' @examples
#' check_credentials(x = "PJS")
check_credentials <- function(x) {
  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # Perform checks
  checkmate::assert_character(x = x, len = 1, add = checks)
  # Report check-results
  checkmate::reportAssertions(checks)

  # PERFORM CHECK
  if (Sys.info()["sysname"] == "Windows") {
    if (!is.element(tolower(x), tolower(keyring::key_list()[, 1]))) {
      res <- paste0("The credentials (username and password) for the service '",
                    x,
                    "' have not been saved in the user's profile at this computer. ",
                    "Use 'NVIdb::set_credentials' to save the credentials in the user's profile")
    } else {
      res <- TRUE
    }
  }

  if (Sys.info()["sysname"] == "Linux") {
    env_variables <- Sys.getenv()
    if (!any(grepl(paste0(x, ":"), names(env_variables), ignore.case = TRUE) == TRUE)) {
    # if (!is.element(tolower(x), tolower(keyring::key_list()[, 1]))) {
      res <- paste0("The credentials (username and password) for the service '",
                    x,
                    "' have not been saved for any user at this computer. ",
                    "Use 'NVIdb::set_credentials' to save the credentials")
    } else {
      res <- TRUE
    }
  }

  return(res)
}

#' @export
#' @include makeAssertionFunction.R
# @template comment
#' @template assert
#' @rdname check_credentials
assert_credentials <- makeAssertionFunction(check_credentials)
