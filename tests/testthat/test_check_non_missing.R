library(testthat)
library(checkmate)
library(NVIcheckmate)

test_that("No error for check_non_missing", {
  fruit <- "Apple" 
  vegetable <- NULL
  expect_identical(
    check_non_missing(x = list(fruit, vegetable)),
    TRUE)
  
  fruit <- "Apple" 
  vegetable <- NA
  expect_identical(
    check_non_missing(x = list(fruit, vegetable)),
    TRUE)
  
  fruit <- NA
  vegetable <- NULL
  cereal = "barley" 
  expect_identical(
    check_non_missing(x = list(fruit, vegetable, cereal)),
    TRUE)
  
} )

test_that("Make error for check_non_missing", {
  fruit <- NULL
  vegetable <- NULL
  expect_error(
    assert_non_missing(x = list(fruit, vegetable)),
    regexp = "At least one of the arguments" )
  
  fruit <- NA
  vegetable <- NULL
  expect_error(
    assert_non_missing(x = list(fruit, vegetable)),
    regexp = "At least one of the arguments" )
  
  fruit <- NA
  vegetable <- NA
  cereal = NA
  expect_error(
    assert_non_missing(x = list(fruit, vegetable, cereal)),
    regexp = "At least one of the arguments" )
  
  fruit <- NULL
  vegetable <- NA
  cereal = NULL 
  expect_error(
    assert_non_missing(x = list(fruit, vegetable, cereal)),
    regexp = "At least one of the arguments" )
  
})
