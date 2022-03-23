library(NVIcheckmate)
library(testthat)
# library(checkmate)
context("assert")

test_that("Include comment in assert", {

  linewidth <- options("width")
  options(width = 80)

  x <- "Tomato"
  expect_error(
    assert(checkmate::check_choice(x, choices = c("Apple", "Pear", "Orange", "Banana")),
           checkmate::check_data_frame(x),
           combine = "or",
           comment = "Something was wrong"),
    regexp = "not\n * 'character'.\nSomething was wrong",
    fixed = TRUE)


  x <- "Tomato"
  checks <- checkmate::makeAssertCollection()
  assert(checkmate::check_choice(x, choices = c("Apple", "Pear", "Orange", "Banana")),
         checkmate::check_data_frame(x),
         combine = "and",
         comment = "Something was wrong",
         add = checks)
  expect_identical(grep("Something was wrong", checks$getMessages()), c(1L, 2L))

  options(width = unlist(linewidth))

})
