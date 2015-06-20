library(testthat)

context("integration tests")
source('Assignment1/corr.R')

test_that("The Sample Cases Process Correctly", {
  expect_equal(corr("specdata", 150), 4.064, nil)
  expect_equal(corr("specdata", 400), 1.706, nil)
  expect_equal(corr("specdata", 5000), 1.281, nil)
  expect_equal(corr("specdata"), 1.281, nil)
})



                 
                 