library(NVIcheckmate)
library(testthat)
library(checkmate)

test_that("No error for match_arg", {

  expect_identical(
    match_arg(x = "app",
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = FALSE,
              ignore.case = TRUE),
    "Apple")

  expect_identical(
    match_arg(x = c("app", "pea"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = TRUE),
    c("Apple", "Pear"))
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
    regexp = "Must be a subset of {'Apple','Pear','Orange','Pineapple'}, but is {'apple','pear'}",
    fixed = TRUE)

  expect_error(
    match_arg(x = c("ap", "pe"),
              choices = c("Apple", "Pear", "Orange", "Pineapple"),
              several.ok = TRUE,
              ignore.case = FALSE),
    regexp = "Must be a subset of {'Apple','Pear','Orange','Pineapple'}, but is {'ap','pe'}",
    fixed = TRUE)
  # "Must be element of set {'Apple','Pear','Orange','Pineapple'} (case is ignored), but is 'Apples'")

  options(width = unlist(linewidth))
})
