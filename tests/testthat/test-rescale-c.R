context("rescale_c")

test_that("rescale_c works", {

  mtcars <- datasets::mtcars
  mtcars2 <- mtcars

  expect_identical(rescale_c(mtcars), mtcars)
  expect_identical(rescale_c(mtcars, colnames = "identity(mpg)"), mtcars)
  expect_identical(rescale_c(mtcars, colnames = "log(mpg)")$mpg,
                   log(mtcars$mpg))

  expect_identical(rescale_c(mtcars, colnames = c("sqrt(mpg)", "sqrt(cyl)"))$cyl,
                   sqrt(mtcars$cyl))
  expect_identical(rescale_c(mtcars, colnames = "log(mpg)")[-1], mtcars[-1])

  mtcars2$mpg <- mtcars2$mpg - 10

  expect_identical(rescale_c(mtcars, colnames = "mpg+"), rescale(mtcars, center = "mpg"))
  expect_identical(rescale_c(mtcars, mtcars2, colnames = c("mpg+"))$mpg,
                   mtcars$mpg - mean(mtcars2$mpg))
  expect_identical(rescale_c(mtcars, colnames = "mpg*"), rescale(mtcars, scale = "mpg"))
  expect_identical(rescale_c(mtcars, colnames = c("mpg*", "cyl*", "drat+")), rescale(mtcars, center = c("drat", "mpg"), scale = c("mpg","cyl")))
})
