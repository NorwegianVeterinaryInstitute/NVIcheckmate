% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_subset_character.R
\name{check_subset_character}
\alias{check_subset_character}
\alias{assert_subset_character}
\title{Check if an argument is a subset of a given set}
\usage{
check_subset_character(
  x,
  choices,
  ignore.case = FALSE,
  empty.ok = TRUE,
  fmatch = FALSE
)

assert_subset_character(
  x,
  choices,
  ignore.case = FALSE,
  empty.ok = TRUE,
  fmatch = FALSE,
  .var.name = checkmate::vname(x),
  comment = NULL,
  add = NULL
)
}
\arguments{
\item{x}{[\code{any}]\cr
Object to check.}

\item{choices}{[\code{character}]\cr
Set of possible values. May be empty.}

\item{ignore.case}{[\code{logical(1)}]\cr
Case is ignored if \code{TRUE}. Default is \code{FALSE}.}

\item{empty.ok}{[\code{logical(1)}]\cr
Treat zero-length \code{x} as subset of any set \code{choices} (this includes \code{NULL})?
Default is \code{TRUE}.}

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
Depending on the function prefix:\cr
If the check is successful, the function
\code{assert_subset_character} return \code{x} invisibly, whereas
\code{check_subset_character} return \code{TRUE}.\cr
If the check is not successful,
\code{assert_subset_character} throws an error message and
\code{check_subset_character} returns a string with the error message.
}
\description{
Check if an object is a subset of a given set in
the object name. The function is based on \code{checkmate::check_subset},
but includes the argument \code{ignore.case}.
}
\details{
The object must be of type character. The check is intended
for functions were using camelCase may make the argument easier
to remember. Therefore, the function will ignore case if
\code{ignore.case = TRUE}.
}
\examples{
# returns TRUE
check_subset_character(x = "Apple",
                       choices = c("apple", "pear", "orange", "banana"),
                       ignore.case = TRUE)
check_subset_character(x = c("Apple", "Pear"),
                       choices = c("apple", "pear", "orange", "banana"),
                       ignore.case = TRUE)

# returns a message
check_subset_character(x = "Tomato",
                       choices = c("apple", "pear", "orange", "banana"),
                       ignore.case = TRUE)
}
\author{
Petter Hopp Petter.Hopp@vetinst.no
}
