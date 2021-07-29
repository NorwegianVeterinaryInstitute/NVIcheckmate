# BSD 3-Clause License
# 
# Copyright (c) 2019, Michel Lang
# All rights reserved.
# 
# The file has been imported from https://gihub.com/mllg/checkmate/man-roxygen/ 
# Modifications
# - Square brackets are escaped. 
# - Removed reference to any other function than \code{assert_<%= fn %>} and
#   \code{check_<%= fn %>}. 
#' 
#' @return Depending on the function prefix:\cr
#'  If the check is successful, the function 
#'  \code{assert_<%= fn %>} return \code{x} invisibly, whereas
#'  \code{check_<%= fn %>} return \code{TRUE}.\cr
#'  If the check is not successful, 
#'  \code{assert_<%= fn %>} throws an error message and 
#'  \code{check_<%= fn %>} returns a string with the error message.
#
