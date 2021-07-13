library(NVIcheckmate)
library(testthat)
library(checkmate)
context("check_subset_ignore_case")

test_that("No error for check_subset_ignore_case", {
  
  expect_identical(
    check_subset_ignore_case(x = "apple",
                             choices = c("Apple", "Pear", "Orange", "Banana")),
    TRUE)
  
  expect_identical(
    check_subset_ignore_case(x = "bAnAnA",
                             choices = c("Apple", "Pear", "Orange", "Banana")),
    TRUE)
  expect_identical(
    check_subset_ignore_case(x = c("apple", "pear"),
                             choices = c("Apple", "Pear", "Orange", "Banana")),
    TRUE)
} )

test_that("Make error for check_subset_ignore_case", {
  expect_identical(
    check_subset_ignore_case(x = "Tomato",
                             choices = c("Apple", "Pear", "Orange", "Banana")),
    "Must be a subset of {'Apple','Pear','Orange','Banana'} (case is ignored), but is {'Tomato'}")
  
  "Must be a subset of {'Apple','Pear','Orange','Banana'} (case is ignored), but is {'Tomato'}"
  expect_identical(
    check_subset_ignore_case(x = c("Tomato", "Apple"), 
                             choices = c("Apple", "Pear", "Orange", "Banana")),
    "Must be a subset of {'Apple','Pear','Orange','Banana'} (case is ignored), but is {'Tomato','Apple'}")
})
