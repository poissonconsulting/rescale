scale_col <- function(x, y) x / sd(y, na.rm = TRUE)

scale <- function(data, data2) {
  purrr::map2_df(data, data2, scale_col)
}
