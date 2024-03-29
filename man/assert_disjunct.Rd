% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_disjunct.R
\name{assert_disjunct}
\alias{assert_disjunct}
\title{Check if an argument is disjunct from a given set}
\usage{
assert_disjunct(
  x,
  y,
  fmatch = FALSE,
  .var.name = checkmate::vname(x),
  comment = NULL,
  add = NULL
)
}
\arguments{
\item{x}{[\code{any}]\cr
Object to check.}

\item{y}{[atomic]\cr
Other set.}

\item{fmatch}{[\code{logical(1)}]\cr
Use the set operations implemented in \code{fmatch} in package \pkg{fastmatch}.
If \pkg{fastmatch} is not installed, this silently falls back to \code{\link[base]{match}}.
\code{fastmatch::fmatch} modifies \code{y} by reference:
A hash table is added as attribute which is used in subsequent calls.}

\item{.var.name}{[\code{character(1)}]\cr
Name of the checked object to print in error messages. Defaults to
the heuristic implemented in \code{\link[checkmate]{vname}}.}

\item{comment}{[\code{character(1)}]\cr
Extra information to be appended to the standard error message in assertions.}

\item{add}{[\code{AssertCollection}]\cr
Collection to store assertions. See \code{\link[checkmate]{AssertCollection}}.}
}
\value{
If the check is successful, the function
\code{assert_disjunct} return \code{x} invisibly.\cr
If the check is not successful,
\code{assert_disjunct} throws an error message.
}
\description{
Check if an argument is disjunct from a given set.
}
\details{
The assertions are based on \code{checkmate::checkDisjunct}. \code{NVIcheckmate::assert_disjunct}
differs from \code{checkmate::assert_disjunct} in including the argument \code{comment = }. The help
is updated to reflect the changes.
}
