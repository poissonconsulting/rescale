test_that("rescale works", {
  mtcars <- datasets::mtcars
  expect_identical(rescale(mtcars), mtcars)
  expect_identical(rescale(mtcars, center = "mpg")[-1], mtcars[-1])
  expect_identical(rescale(mtcars, scale = "mpg")[-1], mtcars[-1])
  expect_type(rescale(mtcars, center = "cyl")$cyl, "double")
  mtcars$cyl <- as.integer(mtcars$cyl)
  expect_type(rescale(mtcars, center = "cyl")$cyl, "integer")
  mtcars$cyl <- as.numeric(mtcars$cyl)
  expect_equal(
    rescale(mtcars, center = names(mtcars)),
    as.data.frame(base::scale(mtcars, scale = FALSE))
  )
  expect_equal(
    rescale(mtcars, scale = names(mtcars)),
    as.data.frame(base::scale(mtcars))
  )
})
