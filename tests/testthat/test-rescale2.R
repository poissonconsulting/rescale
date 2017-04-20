context("rescale2")

test_that("rescale2 works", {

  mtcars <- datasets::mtcars
  expect_identical(rescale2(mtcars), mtcars)
  expect_identical(rescale2(mtcars, transform = list(log = "mpg"))$mpg,
                   log(mtcars$mpg))
  expect_identical(rescale2(mtcars, transform = list(log = "mpg"))[-1], mtcars[-1])
})
