library(NVIcheckmate) 
library(testthat)
test_that("No error for assert_integerish", {
  expect_identical(
    assert_integerish(x = 1),
    1)	
  
  expect_identical(
    assert_integerish(x = c(0, 1, 2)), 
    c(0, 1, 2))
})
  
  test_that("Make error for assert_integerish", { 
    linewidth <- options("width") 
    options(width = 80)
    
  expect_error(
    assert_integerish(x = 1990, lower = 1995, 
                      comment = "The year must be at least 1995"), 
    regexp = "The year must be at least 1995")
  
  options(width = unlist(linewidth))
  })
  