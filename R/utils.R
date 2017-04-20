center_col <- function(x, y) x - mean(y, na.rm = TRUE)

center <- function(data, data2) purrr::map2_df(data, data2, center_col)

divide_by_cols <- function(x, y, fun_name) {
  expr <- glue("x %<>% magrittr::divide_by({fun_name}(y))") %>%
    parse(text = .)
  eval(expr)
  x
}

divide_by <- function(data, data2, divide_by) {
  for (i in seq_along(divide_by)) {
    for (j in seq_along(divide_by[[i]])) {
      data[[divide_by[[i]][j]]] %<>% divide_by_cols(data2[[divide_by[[i]][j]]],
                                                  names(divide_by[i]))
    }
  }
  data
}

error <- function(...) stop(..., call. = FALSE)

is_nlist <- function(x) {
  if (!is.list(x)) return(FALSE)
  if (!length(x)) return(TRUE)
  if (is.null(names(x))) return(FALSE)
  return(!any(vapply(x, is.list, TRUE)))
}

scale_col <- function(x, y) x / stats::sd(y, na.rm = TRUE)

scale <- function(data, data2) purrr::map2_df(data, data2, scale_col)

subtract_cols <- function(x, y, fun_name) {
  expr <- glue("x %<>% magrittr::subtract({fun_name}(y))") %>%
    parse(text = .)
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

transform_cols <- function(x, fun_name) {
  expr <- glue("x %<>% {fun_name}()") %>% parse(text = .)
    eval(expr)
  x
}

transform <- function(data, transform) {
  for (i in seq_along(transform))
    data[] %<>% purrr::map_at(transform[[i]], transform_cols, names(transform[i]))
  data
}
