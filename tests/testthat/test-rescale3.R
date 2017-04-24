context("rescale3")

test_that("rescale3 works", {

  mtcars <- datasets::mtcars
  mtcars2 <- mtcars

  expect_identical(rescale3(mtcars), mtcars)
  expect_identical(rescale3(mtcars, colnames = "identity(mpg)"), mtcars)
  expect_identical(rescale3(mtcars, colnames = "log(mpg)")$mpg,
                   log(mtcars$mpg))

  expect_identical(rescale3(mtcars, colnames = c("sqrt(mpg)", "sqrt(cyl)"))$cyl,
                   sqrt(mtcars$cyl))
  expect_identical(rescale3(mtcars, colnames = "log(mpg)")[-1], mtcars[-1])

  mtcars2$mpg <- mtcars2$mpg - 10

  expect_identical(rescale3(mtcars, colnames = "mpg+"), rescale(mtcars, center = "mpg"))
  expect_identical(rescale3(mtcars, mtcars2, colnames = c("mpg+"))$mpg,
                   mtcars$mpg - mean(mtcars2$mpg))
  expect_identical(rescale3(mtcars, colnames = "mpg*"), rescale(mtcars, scale = "mpg"))
  expect_identical(rescale3(mtcars, colnames = c("mpg*", "cyl*", "drat+")), rescale(mtcars, center = c("drat", "mpg"), scale = c("mpg","cyl")))
})
