#' Check Valid Rescalers
#'
#' @param x A character vector to test for valid rescalers.
#' @param x_name A string of the object name.
#' @return An informative error if the check failed otherwise the original object.
#' @export
check_valid_rescalers <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name %<>% deparse()
  valid <- vapply(x, is_valid_rescaler, TRUE)
  if (any(!valid)) error(x_name, " includes invalid rescalers")
  return(x)
}

check_uniquely_named_list <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name %<>% deparse()

  if (!is_nlist(x))
    error(x_name, " must be a named list")
  chk_unique(names(x), x_name = x_name)
  x
}
