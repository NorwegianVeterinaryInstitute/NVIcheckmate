library(NVIcheckmate)
library(testthat)

test_that("No error for assert_character", {

  expect_identical(
    assert_character(x = "Tomato",
                min.chars = 1, max.chars = 20, any.missing = FALSE, len = 1),
    "Tomato")
})

test_that("Make error for assert_character", {

  expect_error(
    assert_character(x = "Tomato",
                     min.chars = 1, max.chars = 5, any.missing = FALSE, len = 1),
    regexp = "All elements must have at most 5 characters")
  
  expect_error(
    assert_character(x = "Tomato",
                     min.chars = 1, max.chars = 5, any.missing = FALSE, len = 1,
                     comment = "Vegetables must have at most 5 characters"),
    regexp = "Vegetables must have at most 5 characters")
  
})
