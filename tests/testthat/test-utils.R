context("utils")

test_that("is_valid_rescaler", {
  expect_true(is_valid_rescaler("x"))
  expect_true(is_valid_rescaler("x*"))
  expect_true(is_valid_rescaler("name="))
  expect_true(is_valid_rescaler("log(name)+"))
  expect_true(is_valid_rescaler("log(name_1)/"))
  expect_true(is_valid_rescaler("fun(name_1)-"))
})

test_that("is_valid_rescaler detects problem", {
  expect_false(is_valid_rescaler("*"))
  expect_false(is_valid_rescaler("x#"))
  expect_false(is_valid_rescaler("x x="))
  expect_false(is_valid_rescaler("log(name+)"))
  expect_false(is_valid_rescaler("log(log(name))"))
})

test_that("get_rescaler_code", {
  expect_identical(get_rescaler_code("*"), "*")
  expect_identical(get_rescaler_code("*+"), "+")
  expect_identical(get_rescaler_code("*w"), character(0))
})

test_that("get_rescaler_colnames", {
  expect_identical(get_rescaler_colnames("var"), "var")
  expect_identical(get_rescaler_colnames("mean+"), "mean")
  expect_identical(get_rescaler_colnames("log(mean)"), "mean")
  expect_identical(get_rescaler_colnames("log(mean)*"), "mean")
  expect_identical(get_rescaler_colnames(c("log(mean)*", "sqrt(cc)=")), c("mean", "cc"))

})

test_that("get_rescaler_transform", {
  expect_identical(get_rescaler_transform("log(mean)*"), "log")
  expect_identical(get_rescaler_transform("mean"), character(0))
})
