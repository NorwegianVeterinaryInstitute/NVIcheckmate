library(NVIcheckmate)
library(testthat)
library(checkmate)
context("check_choice_ignore_case")

test_that("No error for check_choice_ignore_case", {
  
  expect_identical(
    check_choice_ignore_case(x = "apple",
                             choices = c("Apple", "Pear", "Orange", "Pineapple")),
    TRUE)
} )



test_that("Make error for check_choice_ignore_case", {
  expect_identical(
    check_choice_ignore_case(x = "Apples",
                             choices = c("Apple", "Pear", "Orange", "Pineapple")),
    "Must be element of set {'Apple','Pear','Orange','Pineapple'} (case is ignored), but is 'Apples'")
  
  expect_identical(
    check_choice_ignore_case(x = c("Apple", "pear"),
                             choices = c("Apple", "Pear", "Orange", "Pineapple")),
    "Must have length 1, but has length 2" )
  
  
})
