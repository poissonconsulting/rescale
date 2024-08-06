test_that("rescale_f works", {
  mtcars <- datasets::mtcars
  mtcars2 <- mtcars
  mtcars2$mpg <- mtcars2$mpg - 10
  expect_identical(rescale_f(mtcars), mtcars)
  expect_identical(
    rescale_f(mtcars, transform = list(log = "mpg"))$mpg,
    log(mtcars$mpg)
  )
  expect_identical(
    rescale_f(mtcars, transform = list(sqrt = c("mpg", "cyl")))$cyl,
    sqrt(mtcars$cyl)
  )
  expect_identical(rescale_f(mtcars, transform = list(log = "mpg"))[-1], mtcars[-1])
  expect_identical(rescale_f(mtcars, subtract = list(mean = "mpg")), rescale(mtcars, center = "mpg"))
  expect_identical(
    rescale_f(mtcars, mtcars2, subtract = list(mean = "mpg"))$mpg,
    mtcars$mpg - mean(mtcars2$mpg)
  )
  expect_identical(rescale_f(mtcars, subtract = list(mean = "mpg"), divide_by = list(sd = "mpg")), rescale(mtcars, scale = "mpg"))
  expect_identical(rescale_f(mtcars, subtract = list(mean = c("mpg", "cyl", "drat")), divide_by = list(sd = c("cyl", "mpg"))), rescale(mtcars, center = c("drat", "mpg"), scale = c("mpg", "cyl")))
})
