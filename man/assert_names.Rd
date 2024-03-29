% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_names.R
\name{assert_names}
\alias{assert_names}
\title{Check names to comply to specific rules}
\usage{
assert_names(
  x,
  type = "named",
  subset.of = NULL,
  must.include = NULL,
  permutation.of = NULL,
  identical.to = NULL,
  disjunct.from = NULL,
  what = "names",
  .var.name = checkmate::vname(x),
  comment = NULL,
  add = NULL
)
}
\arguments{
\item{x}{[\code{character} || \code{NULL}]\cr
Names to check using rules defined via \code{type}.}

\item{type}{[character(1)]\cr
Type of formal check(s) to perform on the names.
\describe{
\item{unnamed:}{Checks \code{x} to be \code{NULL}.}
\item{named:}{Checks \code{x} for regular names which excludes names to be \code{NA} or empty (\code{""}).}
\item{unique:}{Performs checks like with \dQuote{named} and additionally tests for non-duplicated names.}
\item{strict:}{Performs checks like with \dQuote{unique} and additionally fails for names with UTF-8 characters
and names which do not comply to R's variable name restrictions. As regular expression, this is
\dQuote{^[.]\emph{[a-zA-Z]+[a-zA-Z0-9._]}$}.}
\item{ids:}{Same as \dQuote{strict}, but does not enforce uniqueness.}
}
Note that for zero-length \code{x}, all these name checks evaluate to \code{TRUE}.}

\item{subset.of}{[\code{character}]\cr
Names provided in \code{x} must be subset of the set \code{subset.of}.}

\item{must.include}{[\code{character}]\cr
Names provided in \code{x} must be a superset of the set \code{must.include}.}

\item{permutation.of}{[\code{character}]\cr
Names provided in \code{x} must be a permutation of the set \code{permutation.of}.
Duplicated names in \code{permutation.of} are stripped out and duplicated names in \code{x}
thus lead to a failed check.
Use this argument instead of \code{identical.to} if the order of the names is not relevant.}

\item{identical.to}{[\code{character}]\cr
Names provided in \code{x} must be identical to the vector \code{identical.to}.
Use this argument instead of \code{permutation.of} if the order of the names is relevant.}

\item{disjunct.from}{[\code{character}]\cr
Names provided in \code{x} must may not be present in the vector \code{disjunct.from}.}

\item{what}{[\code{character(1)}]\cr
Type of name vector to check, e.g. \dQuote{names} (default), \dQuote{colnames} or \dQuote{rownames}.}

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
\code{assert_names} return \code{x} invisibly.\cr
If the check is not successful,
\code{assert_names} throws an error message.
}
\description{
Performs assertions with various checks on character vectors, usually names.
}
\details{
The assertions are based on \code{checkmate::checkNames}. \code{NVIcheckmate::assert_names}
differs from \code{checkmate::assert_names} in including the argument \code{comment = }. The help
is updated to reflect the changes.
}
