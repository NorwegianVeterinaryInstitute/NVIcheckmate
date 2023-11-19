library(NVIcheckmate)
library(testthat)
test_that("No error for assert_integer", {
  expect_identical(
    assert_integer(x = 1L),
    1L)

  expect_identical(
    assert_integer(x = c(0L, 1L, 2L)),
    c(0L, 1L, 2L))
})

  test_that("Make error for assert_integer", {
    linewidth <- options("width")
    options(width = 80)

  expect_error(
    assert_integer(x = 1990L, lower = 1995L,
                   comment = "The year must be at least 1995"),
    regexp = "The year must be at least 1995")

  options(width = unlist(linewidth))
  })
