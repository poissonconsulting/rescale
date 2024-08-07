test_that("check_valid_rescalers", {
  expect_identical(check_valid_rescalers("x"), "x")
  x <- as.name("arg")
  expect_identical(check_valid_rescalers(x), as.name("arg"))
  expect_error(check_valid_rescalers("x@"), "includes invalid rescalers")
})

test_that("check_uniquely_named_list", {
  x <- list(x = 1)
  expect_identical(check_uniquely_named_list(x), x)
  expect_error(check_uniquely_named_list(as.name("x")), "must be a named list")
  y <- as.name("x")
  expect_error(check_uniquely_named_list(1), "must be a named list")
})
