library(NVIcheckmate)
library(testthat)
library(checkmate)
context("check_choices_nocase")

test_that("No error for check_choice_anycase", {

  expect_identical(
    check_choice_anycase(x = "apple",
                         choices = c("Apple", "Pear", "Orange", "Pineapple")),
    TRUE)
} )



test_that("Make error for check_choices_nocase", {
  expect_identical(
    check_choice_anycase(x = "Apples",
                         choices = c("Apple", "Pear", "Orange", "Pineapple")),
    "Must be element of set {'Apple','Pear','Orange','Pineapple'} (case insensitive), but is 'Apples'")

  expect_identical(
    check_choice_anycase(x = c("Apple", "pear"),
                         choices = c("Apple", "Pear", "Orange", "Pineapple")),
    "Must have length 1, but has length 2" )


})
