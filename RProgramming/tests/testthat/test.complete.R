library(testthat)

context("integration tests")
source('Assignment1/complete.R')

test_that("The Sample Cases Process Correctly", {
  expect_identical(complete("specdata", 1), data.frame(id=c(1), nobs=c(117)))
  expect_equal(complete("specdata", c(2, 4, 8, 10, 12)), data.frame(id=c(2,4,8,10,12), nobs=c(1041, 474, 192,148)))
  expect_equal(complete("specdata", 30:25), data.frame(id=c(30,29,28,27,26,25), nobs=c(932,711,475,338,586,463)))
  expect_equal(complete("specdata", 3), data.frame(id=c(3), nobs=c(243)))
})