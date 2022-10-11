library(NVIcheckmate)
library(testthat)

test_that("No error for assert_disjunct", {

  expect_identical(
    assert_disjunct(x = "Tomato",
                    y = c("Apple", "Pear", "Orange", "Banana")),
    "Tomato")

  expect_identical(
    assert_disjunct(x = "Apple",
                    y = c("apple")),
    "Apple")
})

test_that("Make error for assert_disjunct", {

  expect_error(
    assert_disjunct(x = "Apple",
                    y = c("Apple", "Pear", "Orange", "Banana"),
                    comment = "Please choose another name"),
    regexp = "be disjunct from \\{'Apple','Pear','Orange','Banana'},")

})
