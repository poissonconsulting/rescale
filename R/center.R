center_col <- function(x, y) x - mean(y, na.rm = TRUE)

center <- function(data, data2) {
  purrr::map2_df(data, data2, center_col)
}
