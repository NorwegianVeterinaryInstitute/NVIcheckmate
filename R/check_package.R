#' @title Check if an object is an installed package of the required version 
#' @description Check if an package is installed and if it is installed, check if the version is equal 
#'     to or higher than the required version.
#'
#' @templateVar fn package
#' @template x
#' @param version \[character(1)\]\cr
#'     The required version of the installed package. May be \code{NULL}.
#' @template checker
#' @export
#' @examples
<<<<<<< HEAD
#' TRUE i.e. no error message
#' check_package(x = "checkmate" , version = "2.0.0")
#' 
#' Produces an error message
=======
#' # returns TRUE 
#' check_package(x = "checkmate" , version = "2.0.0")
#' 
#' # returns an error message
>>>>>>> b18e74c479360dffccd115a46ca80a8aab4129be
#' check_package(x = "nopackage")

check_package <- function(x, version = NULL) {
  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # Perform checks
<<<<<<< HEAD
  checkmate::assert_character (x, len = 1, min.char = 2)
  checkmate::assert_character(version, len = 1, null.ok = TRUE)
=======
  checkmate::assert_character (x, len = 1, min.char = 2, add = checks)
  checkmate::assert_character(version, len = 1, null.ok = TRUE, add = checks)
>>>>>>> b18e74c479360dffccd115a46ca80a8aab4129be
  # Report check-results
  checkmate::reportAssertions(checks)
  
  # PERFORM CHECK
  # if the package is not installed
  if (!nchar(system.file(package = x)))  {
    res <- paste0("The package '", x, "' is not installed")
  } else {
<<<<<<< HEAD
    # Check if the required version is  installed
    installed_version <- utils::packageDescription(x)$Version
    if (utils::compareVersion(installed_version, version) == -1) {
      res <- paste0("The package '", x, "' version '", installed_version, "' is installed, while version '", version, "' is required." )
    } else {
      res <- TRUE
    }
  }
=======
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
  return(res)
>>>>>>> b18e74c479360dffccd115a46ca80a8aab4129be
}


#' @export
#' @include makeAssertionFunction.R
#' @template comment
#' @template assert
#' @rdname check_package
assert_package <- makeAssertionFunction(check_package)
