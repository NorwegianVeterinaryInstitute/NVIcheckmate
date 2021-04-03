library(NVIcheckmate)
library(testthat)
library(checkmate)
context("check_package")

test_that("No error for check_package", {

  expect_identical(
    check_package(x = "checkmate"),
    TRUE)
expect_identical(
    check_package(x = "checkmate", version = "2.0.0),
    TRUE)
} )

test_that("Make error for check_package", {
  expect_identical(
    check_package(x = "nopackage")
    "Must be element of set {'Apple','Pear','Orange','Banana'} (case insensitive), but is 'Tomato'")
expect_identical(
    check_package(x = "checkmate", version = "99.0.0)
    "Must be element of set {'Apple','Pear','Orange','Banana'} (case insensitive), but is {'Tomato', 'Apple'}")

expect_identical(
    check_package(x = c("checkmate", "testthat"))
    "Must be element of set {'Apple','Pear','Orange','Banana'} (case insensitive), but is {'Tomato', 'Apple'}")
})
