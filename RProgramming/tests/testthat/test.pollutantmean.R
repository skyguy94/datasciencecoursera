library(testthat)

context("integration tests")
source('Assignment1/pollutantmean.R')

test_that("The Sample Cases Process Correctly", {
  expect_equal(pollutantmean("specdata", "sulfate", 1:10), 4.064, tolerance = 0.001)
  expect_equal(pollutantmean("specdata", "nitrate", 70:72), 1.706, tolerance = 0.001)
  expect_equal(pollutantmean("specdata", "nitrate", 23), 1.281, tolerance = 0.001)
})