test_check_non_missing
library(NVIcheckmate)
library(testthat)
library(checkmate)

test_that("No error for check_non_missing", {
fruit <- "Apple" 
vegetable <- NULL
  expect_identical(
    check_non_missing( x = c("fruit", "vegetables"),
    TRUE)
  
  fruit <- "Apple" 
vegetable <- NA
  expect_identical(
    check_non_missing( x = c("fruit", "vegetables"),
    TRUE)

  fruit <- NA
vegetable <- NULL
cereal = "barley" 
  expect_identical(
    check_non_missing( x = c("fruit", "vegetables", cereal),
    TRUE)
  
} )

test_that("Make error for check_non_missing", {
  fruit <- NULL
vegetable <- NULL
  expect_error(
    check_non_missing( x = c("fruit", "vegetables"),
  regexp = "At least one of the arguments" )
  
fruit <- NA
vegetable <- NULL
  expect_error(
    check_non_missing( x = c("fruit", "vegetables"),
  regexp = "At least one of the arguments" )

  fruit <- NA
vegetable <- NA
cereal = NA
  expect_error(
    check_non_missing( x = c("fruit", "vegetables", "cereal"),
  regexp = "At least one of the arguments" )
  
fruit <- NULL
vegetable <- NA
cereal = NULL 
  expect_error(
    check_non_missing( x = c("fruit", "vegetables", "cereal"),
  regexp = "At least one of the arguments" )

})
