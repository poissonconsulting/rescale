#' Rescale Transformed Data
#'
#' Rescales transformed columns in a data frame based on
#' the transformed columns in a second data frame.
#' The columns are rescaled by subtracting values and then dividing by values.
#'
#' @param data The data frame to rescale.
#' @param data2 A data frame to use for the rescaling.
#' @param transform A named list where the name(s) indicate the function(s) to use for the transformations and the elements indicate the columns to transform.
#' @param subtract A named list where the name(s) indicate the function(s) to use when determining the value to subtract and the elements indicate the columns.
#' @param divide_by A named list where the name(s) indicate the function(s) to use when determining the value to divide by and the elements indicate the columns.
#' @return The data frame with transformed and rescaled columns.
#' @export
#' @seealso \code{\link{rescale}}
#' @examples
#' rescale2(datasets::mtcars,
#'   transform = list(log = "mpg"),
#'   subtract = list(mean = c("mpg", "disp"), min = "gear"),
#'   divide_by = list(sd = c("mpg", "hp")))
rescale2 <- function(data, data2 = data, transform = list(),
                     subtract = list(), divide_by = list()) {

  check_data1(data); check_data1(data2);
  check_uniquely_named_list(transform)
  check_uniquely_named_list(subtract)
  check_uniquely_named_list(divide_by)

  transform_cols <- unlist(transform, recursive = FALSE)
  subtract_cols <- unlist(subtract, recursive = FALSE)
  divide_by_cols <- unlist(divide_by, recursive = FALSE)

  if (anyDuplicated(transform_cols)) error("elements in transform must be unique")
  if (anyDuplicated(subtract_cols)) error("elements in subtract must be unique")
  if (anyDuplicated(divide_by_cols)) error("elements in divide_by must be unique")

  check_cols(data, transform_cols)
  check_cols(data, subtract_cols)
  check_cols(data, divide_by_cols)

  check_cols(data2, transform_cols)
  check_cols(data2, subtract_cols)
  check_cols(data2, divide_by_cols)

  data %<>% transform(transform)
  data2 %<>% transform(transform)

  data %<>% subtract(data2, subtract)
  data2 %<>% subtract(data2, subtract)

  data %<>% divide_by(data2, divide_by)
  data
}
