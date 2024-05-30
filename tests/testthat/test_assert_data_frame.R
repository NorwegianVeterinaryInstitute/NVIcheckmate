# library(NVIcheckmate)
library(testthat)
iris <- datasets::iris
test_that("No error for assert_data_frame", {
  expect_identical(
    assert_data_frame(x = iris),
    iris)

  expect_identical(
    assert_data_frame(x = iris, min.rows = 10, min.cols = 2),
    iris)
})

test_that("Make error for assert_data_frame", {
  linewidth <- options("width")
  options(width = 80)

  expect_error(
    assert_data_frame(x = iris, min.cols = 6),
    regexp = "Must have at least 6 cols")


  iris0 <- iris[0, ]
  expect_error(
    assert_data_frame(x = iris0, min.rows = 1),
    regexp = "Must have at least 1 rows, but has 0 rows")

  expect_error(
    assert_data_frame(x = iris0, min.rows = 1, comment = "It has more than 0 rows"),
    regexp = "It has more than 0 rows")

  options(width = unlist(linewidth))
})
