library(NVIcheckmate)
library(testthat)
# library(checkmate)
context("check_package")

checkmate_version <- as.character(utils::packageVersion("checkmate"))

test_that("No error for check_package", {

  expect_identical(check_package(x = "checkmate"),
                   TRUE)

  expect_identical(assert_package(x = "checkmate"),
                   "checkmate")

  expect_identical(check_package(x = "checkmate", version = checkmate_version),
                   TRUE)
})

test_that("Make error for check_package", {
  expect_identical(check_package(x = "nopackage"),
                   "The package 'nopackage' is not installed")

  expect_error(assert_package(x = "nopackage"),
               regexp = "The package 'nopackage' is not installed")

  expect_identical(check_package(x = "checkmate", version = "9.1.0"),
               paste0("The package 'checkmate' version '", 
                     checkmate_version, 
                     "' is installed, while version '9.1.0' is required."))

  expect_error(assert_package(x = "checkmate", version = "9.0.0"),
               regexp = "is installed, while version '9.0.0' is required.")

  expect_error(check_package(x = c("checkmate", "testthat")),
               regexp = "Must have length 1, but has length 2")

})
