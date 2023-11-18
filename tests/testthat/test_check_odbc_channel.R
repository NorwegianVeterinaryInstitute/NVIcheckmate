library(NVIdb)
library(NVIcheckmate)
library(testthat)

test_that("check_odbc_channel for package RODBC", {
  # skip if package not installed
  skip_if_not(isTRUE(check_package("RODBC")))
  # skip if credentials for PJS is lacking
  skip_if_not(isTRUE(check_credentials("PJS")))

  odbc_connection <- login_PJS(dbinterface = "RODBC")
  expect_true(check_odbc_channel(odbc_connection, dbinterface = "RODBC"))
  RODBC::odbcClose(odbc_connection)
})

# test_that("check_odbc_channel for package odbc", {
#   # skip if package not installed
#   skip_if_not(isTRUE(check_package("odbc")))
#   # skip if credentials for PJS is lacking
#   skip_if_not(isTRUE(check_credentials("PJS")))
# #
# #   odbc_connection <- login("PJS", dbinterface = "odbc")
# #   odbc_connection <- login_PJS(dbinterface = "odbc")
#   odbc_connection <- login_by_credentials_PJS(dbinterface = "odbc")
#   expect_true(check_odbc_channel(odbc_connection, dbinterface = "odbc"))
#   DBI::dbDisconnect(odbc_connection)
# })

test_that("check_odbc_channel for package RPostgreSQL", {
  # skip if package not installed
  skip_if_not(isTRUE(check_package("RPostgreSQL")))
  # skip if credentials for PJS is lacking
  skip_if_not(isTRUE(check_credentials("Decide")))

  odbc_connection <- login(dbservice = "Decide", dbinterface = "RPostgreSQL")
  expect_true(check_odbc_channel(odbc_connection, dbinterface = "RPostgreSQL"))
  DBI::dbDisconnect(odbc_connection)
})

# test_that("Errors or warnings for login", {
#   linewidth <- options("width")
#   options(width = 80)
#
# expect_error(login("PHS"),
#              regexpr = "Variable 'dbservice': Must be element of")
# expect_warning(login(dbservice = "PJS",
#                      dbdriver = "x",
#                      db = "y",
#                      dbserver = "z",
#                      dbport = "x",
#                      dbprotocol = "y",
#                      dbinterface = NULL),
#                regexpr = "ODBC connection failed")
# options(width = unlist(linewidth))
# })
