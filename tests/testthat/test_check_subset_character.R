library(NVIcheckmate)
library(testthat)
library(checkmate)
context("check_subset_character")

test_that("No error for check_subset_character", {
  
  expect_identical(
    check_subset_character(x = "apple",
                           choices = c("Apple", "Pear", "Orange", "Banana"),
                           ignore.case = TRUE),
    TRUE)
  
  expect_identical(
    check_subset_character(x = "bAnAnA",
                           choices = c("Apple", "Pear", "Orange", "Banana"),
                           ignore.case = TRUE),
    TRUE)
  expect_identical(
    check_subset_character(x = c("apple", "pear"),
                           choices = c("Apple", "Pear", "Orange", "Banana"),
                           ignore.case = TRUE),
    TRUE)
} )

test_that("Make error for check_subset_character", {
  expect_error(
    assert_subset_character(x = "Tomato",
                           choices = c("Apple", "Pear", "Orange", "Banana"),
                           ignore.case = TRUE),
    regexp = "Must be a subset of {'Apple', 'Pear', 'Orange', 'Banana'} (case is ignored), but is {'Tomato'}",
    fixed = TRUE)
  
  expect_error(
    assert_subset_character(x = c("Tomato", "Apple"), 
                           choices = c("Apple", "Pear", "Orange", "Banana"),
                           ignore.case = TRUE),
    regexp = "Must be a subset of {'Apple', 'Pear', 'Orange', 'Banana'} (case is ignored), but is {'Tomato', 'Apple'}",
    fixed = TRUE)
})
