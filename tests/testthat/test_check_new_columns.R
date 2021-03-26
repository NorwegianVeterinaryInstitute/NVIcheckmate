library(NVIdb)
library(testthat)


context("check_new_columns")

test_that("Make error for check_new_columns", {


  expect_identical(
  check_new_colname(columns = c("saksnr", "komnr"),
                      new_column = "komnr",
                      code_column = FALSE,
                      overwrite = FALSE),
  paste("The column name(s): 'komnr' already exist in the data frame. Either give new column name(s) for the column(s)",
        "named 'komnr' or specify overwrite = TRUE to replace values in the existing column(s) with new content."))

  expect_identical(
  check_new_colname(columns = c("saksnr", "komnr"), new_column = "komnr", code_column = TRUE, overwrite = FALSE),
  paste("The new column cannot have the same name as the code_column 'komnr`."))

  expect_identical(
  check_new_colname(columns = c("saksnr", "komnr", "hensiktkode", "artkode", "dyreartkode"),
                      new_column = c("hensiktkode", "artkode", "dyreartkode"),
                      code_column = FALSE, overwrite = FALSE),
  paste("The column name(s): 'hensiktkode, artkode, dyreartkode' already exist in the data frame.",
        "Either give new column name(s) for the column(s) named 'hensiktkode, artkode, dyreartkode' or specify",
        "overwrite = TRUE to replace values in the existing column(s) with new content."))

  expect_identical(
  check_new_colname(columns = c("saksnr", "komnr", "hensiktkode", "artkode", "dyreartkode"),
                      new_column = c("hensiktkode", "artkode", "dyreartkode"),
                      code_column = TRUE, overwrite = FALSE),
  paste("The new column cannot have the same name as the code_column 'hensiktkode, artkode, dyreartkode`."))


})





