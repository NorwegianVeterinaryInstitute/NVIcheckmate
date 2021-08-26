library(NVIcheckmate)
library(testthat)
# library(checkmate)
context("assert_names")

test_that("No error for assert_names", {
  
  expect_identical(
    assert_names(x = "Tomato",
                 type = "named",
                 disjunct.from = c("Apple", "Pear", "Orange", "Banana")),
    "Tomato")
  
  expect_identical(
    assert_names(x = "Apple",
                 type = "named",
                 identical.to = c("Apple")),
    "Apple")
} )

test_that("Make error for assert_names", {
  
  expect_error(
    assert_names(x = "Apple",
                 type = "named",
                 disjunct.from = c("Apple", "Pear", "Orange", "Banana"),
                 comment = "Please choose another name"),
    regexp = "Names must be disjunct from \\(Apple,Pear,Orange,Banana). Please choose another name.")
  
})
