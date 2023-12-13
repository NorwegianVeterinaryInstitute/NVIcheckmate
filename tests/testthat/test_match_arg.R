library(NVIcheckmate)
library(testthat)
# library(checkmate)

test_that("No error for match_arg", {

  expect_identical(
    match_arg(x = "Orange",
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = FALSE),
    "Orange")

  expect_identical(
    match_arg(x = "Orange",
              choices = c("Orange"),
              several.ok = FALSE,
              ignore.case = FALSE),
    "Orange")

  expect_identical(
    match_arg(x = "apple",
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = TRUE),
    "Apple")

  expect_identical(
    match_arg(x = "app",
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = TRUE),
    "Apple")

  expect_identical(
    match_arg(x = c("Apple", "Pear", "Orange", "Pineapple"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = FALSE),
    c("Apple", "Pear", "Orange", "Pineapple"))
  
  expect_identical(
    match_arg(x = c("app", "pea"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    c("Apple", "Pear"))

  expect_identical(
    match_arg(x = c("Apple", "Pear"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    c("Apple", "Pear"))

  expect_identical(
    match_arg(x = c("Apple"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    c("Apple"))

  expect_identical(
    match_arg(x = c("Apple", "Apple", "Pear"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    c("Apple", "Apple", "Pear"))


  expect_identical(
    match_arg(x = c("app", "app"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    c("Apple", "Apple"))
  })



test_that("Make error for match_arg", {
  linewidth <- options("width")
  options(width = 80)

  expect_error(
    match_arg(x = "Apples",
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = TRUE),
    regexp = "Must be element of set {'Apple','Pear','Orange','Pineapple'}, but is 'Apples'",
    fixed = TRUE)
  # "Must be element of set {'Apple','Pear','Orange','Pineapple'} (case is ignored), but is 'Apples'")

  expect_error(
    match_arg(x = c("Apple", "pear"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = TRUE),
    regexp = "Must have length 1, but has length 2",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("apple", "pear"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = FALSE),
    regexp = "Must be a subset of {'Apple','Pear','Orange','Pineapple'}, but has additional elements {'apple','pear'}",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("Apple", "Pear", "Orange", "Pineapple"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = TRUE),
    regexp = "Must have length 1, but has length 4",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("ap", "pe"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = FALSE),
    regexp = "Must be a subset of {'Apple','Pear','Orange','Pineapple'}, but has additional elements {'ap','pe'}",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("p"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    regexp = "Must be a subset of {'Apple','Pear','Orange','Pineapple'}, but has additional elements {'p'}",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("Ap", "p"),
              choices = c("Apple", "Apricot", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    regexp = "Must be a subset of {'Apple','Apricot','Pear','Orange','Pineapple'}, but has additional elements {'Ap','p'}",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("Ap", "p"),
              choices = c("Apple", "Apricot", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = FALSE),
    regexp = "Must be a subset of {'Apple','Apricot','Pear','Orange','Pineapple'}, but has additional elements {'Ap','p'}",
    fixed = TRUE)
  options(width = unlist(linewidth))
})
