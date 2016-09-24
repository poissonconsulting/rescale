context("rescale")

test_that("rescale works", {

  mtcars <- datasets::mtcars
  expect_identical(rescale(mtcars), mtcars)
  expect_identical(rescale(mtcars, center = "mpg")[-1], mtcars[-1])
  expect_identical(rescale(mtcars, scale = "mpg")[-1], mtcars[-1])
  expect_equivalent(rescale(mtcars, center = names(mtcars)),
                    as.data.frame(scale(mtcars, scale = FALSE)))
  expect_equivalent(rescale(mtcars, scale = names(mtcars)),
                    as.data.frame(scale(mtcars)))
})

