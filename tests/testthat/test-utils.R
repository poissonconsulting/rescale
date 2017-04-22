context("utils")

test_that("is_valid_rescaler", {
  expect_true(is_valid_rescaler("x"))
  expect_true(is_valid_rescaler("x*"))
  expect_true(is_valid_rescaler("name^"))
  expect_true(is_valid_rescaler("log(name)+"))
  expect_true(is_valid_rescaler("log(name_1)/"))
  expect_true(is_valid_rescaler("fun(name_1)-"))
})

test_that("is_valid_rescaler detects problem", {
  expect_false(is_valid_rescaler("*"))
  expect_false(is_valid_rescaler("x#"))
  expect_false(is_valid_rescaler("x x^"))
  expect_false(is_valid_rescaler("log(name+)"))
  expect_false(is_valid_rescaler("log(log(name))"))
})
