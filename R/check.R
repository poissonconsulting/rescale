check_uniquely_named_list <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name <- deparse(x_name)

  if (!is_nlist(x))
    error(x_name, " must be a named list")
  check_unique(names(x), x_name = x_name)
  x
}
