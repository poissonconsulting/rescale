center_col <- function(x, y) x - mean(y, na.rm = TRUE)

center <- function(data, data2) purrr::map2_df(data, data2, center_col)

error <- function(...) stop(..., call. = FALSE)

scale_col <- function(x, y) x / stats::sd(y, na.rm = TRUE)

scale <- function(data, data2) purrr::map2_df(data, data2, scale_col)
