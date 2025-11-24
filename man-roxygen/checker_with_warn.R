# BSD 3-Clause License
# 
# Copyright (c) 2019, Michel Lang
# Copyright (c) 2025, Norwegian Veterinary Institute
# All rights reserved.
# 
# The file has been imported from https://gihub.com/mllg/checkmate/man-roxygen/ 
# Modifications 
# - Removed reference to any other function than \code{assert_<%= fn %>} and
#   \code{check_<%= fn %>}. 
# - Includednew function \code{warn_<%= fn %>}
#' 
#' @return Depending on the function prefix:\cr
#'  If the check is successful, the function 
#'  \code{assert_<%= fn %>} return \code{x} invisibly, whereas
#'  \code{warn_<%= fn %>} and \code{check_<%= fn %>} return \code{TRUE}.\cr
#'  If the check is not successful, 
#'  \code{assert_<%= fn %>} throws an error message, 
#'  \code{warn_<%= fn %>} throws a warning message, and 
#'  \code{check_<%= fn %>} returns a string with the error/warning message.
#
