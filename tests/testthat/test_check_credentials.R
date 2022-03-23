library(NVIcheckmate)
library(testthat)
# library(checkmate)

context("check_credentials")

test_that("No error for check_credentials", {

  expect_identical(check_credentials(x = "pjs"),
                   TRUE)

  expect_identical(check_credentials(x = "PJS"),
                   TRUE)

  expect_identical(assert_credentials(x = "PJS"),
                   "PJS")
})



test_that("Make error for check_credentials", {
  expect_identical(check_credentials(x = "nodb"),
                   paste("The credentials (username and password) for the service 'nodb'",
                         "have not been saved in the user's profile at this computer.",
                         "Use 'NVIdb::set_credentials' to save the credentials in the user's profile"))


  expect_error(assert_credentials(x = "nodb"),
               regexp = "have not been saved in the user's profile at this computer")
})
