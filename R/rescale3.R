#' Rescale Transformed Data
#'
#' Rescales transformed columns in a data frame based on
#' the transformed columns in a second data frame.
#' The columns are rescaled by subtracting values and then dividing by values.
#'
#' The column names can include a single function for the transform as well as the following suffices: + (subtract mean), - (subtract min), ^ (subtract min and add 1), / (divide by sd) and * (subtract mean and divide by sd).
#'
#' @param data The data frame to rescale.
#' @param data2 A data frame to use for the rescaling.
#' @param col_names A character vector of column names to transform and/or rescale.
#' @return The data frame with transformed and rescaled columns.
#' @export
#' @seealso \code{\link{rescale}}
# rescale3(datasets::mtcars, c("log(mpg)*", "disp+", "gear-", "hp/"))
rescale3 <- function(data, data2 = data, col_names = character(0)) {
  check_data1(data); check_data1(data2);
  check_vector(colnames, "", min_length = 0)

  .NotYetImplemented()

  if (!length(colnames)) return(data)
  # need to parse apart and then use rescale2
}
