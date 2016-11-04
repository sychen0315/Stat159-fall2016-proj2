library(testthat)
source("../functions/eda-functions.R")

# Description: Tests for eda-functions

context("Test for eda_summary")

test_that("eda_summary works as expected", {
  expect_equal(as.vector(eda_summary(mtcars$mpg)[1:6]), as.vector(summary(mtcars$mpg)))
  expect_equal(as.vector(eda_summary(mtcars$mpg)[7]), max(mtcars$mpg)-min(mtcars$mpg))
  expect_equal(as.vector(eda_summary(mtcars$mpg)[8]), IQR(mtcars$mpg))
  expect_equal(as.vector(eda_summary(mtcars$mpg)[9]), sd(mtcars$mpg))
})