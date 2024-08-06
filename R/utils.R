center_col <- function(x, y) {
  if (is.integer(x)) {
    return(x - as.integer(round(mean(y, na.rm = TRUE))))
  }
  x - mean(y, na.rm = TRUE)
}

center <- function(data, data2) purrr::map2(data, data2, center_col)

divide_by_cols <- function(x, y, fun_name) {
  expr <- glue("x <- x  / {fun_name}(y)") |>
    str2lang()
  eval(expr)
  x
}

divide_by <- function(data, data2, divide_by) {
  for (i in seq_along(divide_by)) {
    for (j in seq_along(divide_by[[i]])) {
      data[[divide_by[[i]][j]]] <- data[[divide_by[[i]][j]]] |>
        divide_by_cols(
          data2[[divide_by[[i]][j]]],
          names(divide_by[i])
        )
    }
  }
  data
}

error <- function(...) stop(..., call. = FALSE)

is_nlist <- function(x) {
  if (!is.list(x)) {
    return(FALSE)
  }
  if (!length(x)) {
    return(TRUE)
  }
  if (is.null(names(x))) {
    return(FALSE)
  }
  return(!any(vapply(x, is.list, TRUE)))
}

is.syntactic <- function(x) x == make.names(x)

scale_col <- function(x, y) x / stats::sd(y, na.rm = TRUE)

scale <- function(data, data2) purrr::map2(data, data2, scale_col)

standardise_col <- function(x, y) {
  x <- x |> center_col(y)
  x <- x |> scale_col(y)
  x
}

subtract_min_col <- function(x, y) x - min(y, na.rm = TRUE)
subtract_min_plus1_col <- function(x, y) x - min(y, na.rm = TRUE) + 1

subtract_cols <- function(x, y, fun_name) {
  expr <- glue("x <- x  - {fun_name}(y)") |>
    str2lang()
  eval(expr)
  x
}

subtract <- function(data, data2, subtract) {
  for (i in seq_along(subtract)) {
    for (j in seq_along(subtract[[i]])) {
      data[[subtract[[i]][j]]] <- data[[subtract[[i]][j]]] |>
        subtract_cols(
          data2[[subtract[[i]][j]]],
          names(subtract[i])
        )
    }
  }
  data
}

transform_cols <- function(x, fun_name) {
  expr <- glue("x <- x |> {fun_name}()") |> str2lang()
  eval(expr)
  x
}

transform <- function(data, transform) {
  for (i in seq_along(transform)) {
    data[] <- data[] |> purrr::map_at(transform[[i]], transform_cols, names(transform[i]))
  }
  data
}

get_rescaler_code <- function(x) {
  pattern <- names(rescaler_codes)

  pattern <- paste0("\\", pattern, collapse = "|")
  pattern <- paste0("(", pattern, ")")

  n <- nchar(x)
  x <- x |> substr(n, n)
  if (grepl(pattern, x, perl = TRUE)) {
    return(x)
  }
  character(0)
}

#' Get Rescaler Colnames
#'
#' @param x A character vector.
#' @return A character vector of the rescaler column names.
#' @export
#' @examples
#' get_rescaler_colnames(c("log(mean)*", "sqrt(cc)="))
get_rescaler_colnames <- function(x) {
  check_valid_rescalers(x)
  pattern <- names(rescaler_codes)

  pattern <- paste0("\\", pattern, collapse = "|")
  pattern <- paste0("^(\\w+\\(){0,1}(\\w+)\\){0,1}(", pattern, "){0,1}$")

  sub(pattern, "\\2", x, perl = TRUE)
}

get_rescaler_transform <- function(x) {
  transform <- sub("^(\\w+)(\\(.*)", "\\1", x, perl = TRUE)
  if (identical(transform, x)) {
    return(character(0))
  }
  transform
}

is_valid_rescaler <- function(x) {
  pattern <- names(rescaler_codes)

  pattern <- paste0("\\", pattern, collapse = "|")
  pattern <- paste0("^(\\w+\\(){0,1}\\w+\\){0,1}(", pattern, "){0,1}$")

  if (!grepl(pattern, x, perl = TRUE)) {
    return(FALSE)
  }
  TRUE
}

switch_list <- function(x) {
  y <- as.list(names(x))
  names(y) <- x
  y
}

aggregate_list <- function(x) {
  if (!length(x)) {
    return(x)
  }
  names <- unique(names(x))
  y <- list()
  for (name in names) {
    y[[name]] <- setNames(unlist(x[names(x) == name]), NULL)
  }
  y
}

rescale_fun_cols <- function(x, y, fun_name) {
  expr <- glue("x <- x |> {fun_name}(y)") |>
    str2lang()
  eval(expr)
  x
}

rescale_fun <- function(data, data2, fun_list) {
  for (i in seq_along(fun_list)) {
    for (j in seq_along(fun_list[[i]])) {
      data[[fun_list[[i]][j]]] <- data[[fun_list[[i]][j]]] |> rescale_fun_cols(
        data2[[fun_list[[i]][j]]],
        names(fun_list[i])
      )
    }
  }
  data
}
