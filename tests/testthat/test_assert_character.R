library(NVIcheckmate)
library(testthat)

test_that("No error for assert_character", {

  expect_identical(
    assert_character(x = "Tomato",
                     min.chars = 1, max.chars = 20, any.missing = FALSE, len = 1),
    "Tomato")
  
  expect_identical(
    assert_character(x = c("Tomato", "Potato"),
                     min.chars = 1, max.chars = 20, any.missing = FALSE, max.len = 4),
    c("Tomato", "Potato"))
})

test_that("Make error for assert_character", {
  linewidth <- options("width")
  options(width = 80)
  
  expect_error(
    assert_character(x = "Tomato",
                     min.chars = 1, max.chars = 5, any.missing = FALSE, len = 1),
    regexp = "All elements must have at most 5 characters")

  expect_error(
    assert_character(x = "Tomato",
                     min.chars = 1, max.chars = 5, any.missing = FALSE, len = 1,
                     comment = "Vegetables must have at most 5 characters"),
    regexp = "Vegetables must have at most 5 characters")

  expect_error(
    assert_character(x = c("Tomato", "Potato"),
                     min.chars = 1, max.chars = 20, any.missing = FALSE, len = 1),
    regexp = "Must have length 1, but has length 2")
  
  expect_error(
    assert_character(x = c("Tomato", "Potato"),
                     min.chars = 1, max.chars = 20, any.missing = FALSE, max.len = 4,
                     ignore.case = TRUE, pattern = "mato"),
    regexp = "Must comply to pattern 'mato'")
  
  options(width = unlist(linewidth))
})
