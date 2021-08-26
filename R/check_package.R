#' @title Check if an object is an installed or attached package
#' @description Check if a package is installed and if it is installed, check if the version is equal 
#'     to or higher than the required version or check if a package is attached.
#'
#' @templateVar fn package
#' @template x
#' @param version \[character(1)\]\cr
#'     The required version of the installed package. May be \code{NULL}.
#' @param type \[character(1)\]\cr
#'  Type of formal check(s) to perform on the package.
#'  \describe{
#'  \item{installed:}{Checks if \code{x} is installed.}
#'  \item{attached:}{Checks if \code{x} is attached.}
#'  }

#' @template checker
#' @export
#' @examples
#' # returns TRUE i.e. no error message
#' check_package(x = "checkmate" , version = "2.0.0", type = "installed")
#' 
#' # returns an error message
#' check_package(x = "nopackage", type = "installed")
#' check_package(x = "nopackage", type = "attached")

check_package <- function(x, version = NULL, type = "installed") {
  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  
  # Perform checks
  checkmate::assert_character (x, len = 1, min.char = 2, add = checks)
  checkmate::assert_character(version, len = 1, null.ok = TRUE, add = checks)
  checkmate::assert_choice(type, choices = c("attached", "installed"), add = checks)
  
  # Report check-results
  checkmate::reportAssertions(checks)
  
  # PERFORM CHECK
  if (type == "installed") {
    # if the package is not installed
    if (!nchar(system.file(package = x)))  {
      res <- paste0("The package '", x, "' is not installed")
    } else {
      if (is.null(version)) { 
        res <- TRUE
      } else {
        # Check if the required version is  installed
        installed_version <- utils::packageDescription(x)$Version
        if (utils::compareVersion(installed_version, version) == -1) {
          res <- paste0("The package '", x, "' version '", installed_version, "' is installed, while version '", version, "' is required." )
        } else {
          res <- TRUE
        }
      }
    }
  }
  if (type == "attached") {
    # TRUE if the package is attached
    if(x %in% (.packages())){
      res <- TRUE
      # message if the package is not attached
    } else {
      res <- paste0("The package '", x, "' is not attached")
    }
  }
  return(res)
  
}


#' @export
#' @include makeAssertionFunction.R
#' @template assert
#' @rdname check_package
assert_package <- makeAssertionFunction(check_package)
