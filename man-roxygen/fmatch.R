# BSD 3-Clause License
# 
# Copyright (c) 2019, Michel Lang
# All rights reserved.
# 
# The file has been imported from https://gihub.com/mllg/checkmate/man-roxygen/ 
# Modifications
# - Square brackets are escaped
#' 
#' @param fmatch \[\code{logical(1)}\]\cr
#'     Use the set operations implemented in \code{fmatch} in package \pkg{fastmatch}.
#'     If \pkg{fastmatch} is not installed, this silently falls back to \code{\link[base]{match}}.
#'     \code{fastmatch::fmatch} modifies \code{y} by reference:
#'     A hash table is added as attribute which is used in subsequent calls.
#'  
