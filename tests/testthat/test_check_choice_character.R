library(NVIcheckmate)
library(testthat)
library(checkmate)

test_that("No error for check_choice_character", {
  
  expect_identical(
    check_choice_character(x = "apple",
                           choices = c("Apple", "Pear", "Orange", "Pineapple"),
                           ignore.case = TRUE),
    TRUE)
} )



test_that("Make error for check_choice_character", {
  linewidth <- options("width")
  options(width = 80)
  
  expect_identical(
    check_choice_character(x = "Apples",
                           choices = c("Apple", "Pear", "Orange", "Pineapple"),
                           ignore.case = TRUE),
    "Must be element of set {'Apple', 'Pear', 'Orange', 'Pineapple'} (case is ignored), but is 'Apples'")
  
  expect_identical(
    check_choice_character(x = c("Apple", "pear"),
                           choices = c("Apple", "Pear", "Orange", "Pineapple"),
                           ignore.case = TRUE),
    "Must have length 1, but has length 2" )
  
  options(width = unlist(linewidth))
})
