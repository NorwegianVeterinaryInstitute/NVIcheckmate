#' @title Check if an argument is an installed package of required version 
#' @description checks if an package is installed and if it is installed, check if the version is equal or higher than the required version.
#'
#' @templateVar fn package
#' @template x
#' @param version. The required version of the installed package. May be \code{NULL} 
#' @template checker
#' @export
#' @examples
#' TRUE 
#' check_package(x = "checkmate" , version = "2.0.0")
#' Error
#' check_package(x = "nopackage")

check_package(x, version = NULL) {
#ARGUMENT CHECKING 
assert_character (x, len = 1, min.char = 2)
assert_character(version, len = 1, null.ok = TRUE) 

  # if the package is not installed
  if (! nchar(system.file(package = x)))  {
res <- paste0("The package '", x, "' is not installed") 
} else {
    # Check if the required version is  installed
installed_version <- utils::packageDescription(x)$Version
    if (utils::compareVersion(installed_version, version) == -1) {
   res <- paste0("The package '", x, "' version '", installed_version, "' is  installed, while version '", version, "' is required." ) 
      } else {
res <- TRUE 
} 
} 

#' @export
#' @include makeAssertion.R
#' @template assert
#' @rdname check_package
assert_package <- makeAssertionFunction(check_package, use.namespace = FALSE)
