center_col <- function(x, y) x - mean(y, na.rm = TRUE)

center <- function(data, data2) purrr::map2_df(data, data2, center_col)

is_nlist <- function(x) {
  if (!is.list(x)) return(FALSE)
  if (!length(x)) return(TRUE)
  if (is.null(names(x))) return(FALSE)
  return(!any(vapply(x, is.list, TRUE)))
}

error <- function(...) stop(..., call. = FALSE)

scale_col <- function(x, y) x / sd(y, na.rm = TRUE)

scale <- function(data, data2) purrr::map2_df(data, data2, scale_col)

transform_cols <- function(x, fun_name) {
  expr <- paste0("x %<>% ", fun_name, "()") %>% parse(text = .)
  eval(expr)
  x
}

transform <- function(data, transform) {
  for (i in seq_along(transform))
    data[] %<>% purrr::map_at(transform[[i]], transform_cols, names(transform[i]))
  data
}

subtract_cols <- function(x, y, fun_name) {
  expr <- paste0("x %<>% magrittr::subtract( ", fun_name, "(y))") %>% parse(text = .)
  eval(expr)
  x
}

subtract <- function(data, data2, subtract) {
  for (i in seq_along(subtract)) {
    for (j in seq_along(subtract[[i]])) {
      data[[subtract[[i]][j]]] %<>% subtract_cols(data2[[subtract[[i]][j]]],
                                                  names(subtract[i]))
    }
  }
  data
}

