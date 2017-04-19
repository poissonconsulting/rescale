#' Rescale Transformed Data
#'
#' Rescales transformed columns in a data frame based on
#' the transformed columns in a second data frame.
#' The columns are rescaled by subtracting values and then dividing by values.
#'
#' @param data The data.frame to rescale.
#' @param data2 A data.frame to use for the rescaling.
#' @param transform A named list where the name(s) indicate the function(s) to use for the transformations and the elements indicate the columns to transform.
#' @param subtract A named list where the name(s) indicate the function(s) to use when determining the values to subtract and the elements indicate the columns.
#' @param divide_by A named list where the name(s) indicate the function(s) to use when determining the values to divide by and the elements indicate the columns.
#' @return The transformed and rescaled data.frame.
#' @export
#' @seealso \code{\link[base]{scale}}
#' @examples
#' rescale2(datasets::mtcars,
#'   transform = list(log = "mpg"),
#'   subtract = list(mean = c("mpg", "disp"), min = "gear"),
#'   divide_by = list(sd = c("mpg", "hp")))
rescale2 <- function(data, data2 = data, transform = list(),
                     subtract = list(), divide_by = list()) {
  check_data1(data); check_data1(data2);
  # need error
  # need names list
  # need elements in data
  # need elements only once
  # need names unique... not necessarily
  # need functions single vector and return scalar
  # except transform single vector and vector of same length
  data
}
