library(testthat)
library(checkmate)
# library(NVIcheckmate)

test_that("test output from check_duplicate_rows", {
  # Creating data
  pt_data <- as.data.frame(list("prodnr8" = c("01234567", "12345678"), "P157" = c(200, 300)))
  prod_name <- as.data.frame(
    list("prodnr8" = c("01234567", "12345678"),
         "prodnr10" = c("0123456713", "1234567814"),
         "navn" = c("Ola Nordmann", "Kari Trestakk")))
  # merge
  pt_data <- merge(pt_data, prod_name, by = "prodnr8")
  # checking for double rows per prodnr8
  expect_true(
    check_duplicate_rows(x = pt_data,
                          group_var = "prodnr8"))

  # Creating data
  pt_data <- as.data.frame(list("prodnr8" = c("01234567", "12345678"), "P157" = c(200, 300)))
  prod_name <- as.data.frame(
    list("prodnr8" = c("01234567", "12345678", "12345678"),
         "prodnr10" = c("0123456713", "1234567814", "1234567826"),
         "navn" = c("Ola Nordmann", "Kari Trestakk", "Per Trestakk")))
  # merge
  pt_data <- merge(pt_data, prod_name, by = "prodnr8")
  # checking for double rows per prodnr8
  expect_match(check_duplicate_rows(x = pt_data,
                                     group_var = "prodnr8"),
               regexp = "The data: 'pt_data' has at least 1 unique combinations of the group")

  })

test_that("No error for assert_duplicate_rows", {
  # Creating data
  pt_data <- as.data.frame(list("prodnr8" = c("01234567", "12345678"), "P157" = c(200, 300)))
  prod_name <- as.data.frame(
    list("prodnr8" = c("01234567", "12345678"),
         "prodnr10" = c("0123456713", "1234567814"),
         "navn" = c("Ola Nordmann", "Kari Trestakk")))
  # merge
  pt_data <- merge(pt_data, prod_name, by = "prodnr8")
  # checking for double rows per prodnr8
  expect_data_frame(
    assert_duplicate_rows(x = pt_data,
                          group_var = "prodnr8",
                          comment = "Checked after merging pt_data med prod_name"))

})

test_that("Make error for assert_duplicate_rows", {
  linewidth <- options("width")
  options(width = 80)

  # Creating data
  pt_data <- as.data.frame(list("prodnr8" = c("01234567", "12345678"), "P157" = c(200, 300)))
  prod_name <- as.data.frame(
    list("prodnr8" = c("01234567", "12345678", "12345678"),
         "prodnr10" = c("0123456713", "1234567814", "1234567826"),
         "navn" = c("Ola Nordmann", "Kari Trestakk", "Per Trestakk")))
  # merge
  pt_data <- merge(pt_data, prod_name, by = "prodnr8")
  # checking for double rows per prodnr8
  expect_error(assert_duplicate_rows(x = pt_data,
                        group_var = "prodnr8",
                        comment = "Checked after merging pt_data med prod_name"),
    regexp = "Assertion on 'pt_data' failed: The data: 'x' has at least 1 unique")

  options(width = unlist(linewidth))

})
