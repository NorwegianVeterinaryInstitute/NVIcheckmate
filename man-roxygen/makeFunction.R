# File imported from https://gihub.com/mllg/checkmate/man-roxygen/ and modified for NVIcheckmate
# Author and copyright Michel Lang, <michellang@@gmail.com>, see Licence and copyright.
#' 
#' @param check.fun \[\code{function}\]
#'  Function which checks the input. Must return \code{TRUE} on success and a string with the error message otherwise.
#' @param c.fun \[\code{character(1)}\]
#'  If not \code{NULL}, instead of calling the function \code{check.fun}, use \code{.Call} to call a C function \dQuote{c.fun} with the identical
#'  set of parameters. The C function must be registered as a native symbol, see \code{\link[base]{CallExternal}}.
#'  Useful if \code{check.fun} is just a simple wrapper.
#' @param env \[\code{environment}\]
#'  The environment of the created function. Default is the \code{parent.frame}, see \code{\link[base]{sys.parent}}.
