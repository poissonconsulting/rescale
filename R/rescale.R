#' Rescale Data
#'
#' Centers and scales columns in a data frame based on
#' the columns in a second data frame.
#' A column is centered by subtracting the mean
#' and scaled by dividing by the standard deviation.
#' Columns in \code{scale} are automatically added to \code{center} so they are standardised.
#'
#' @param data The data frame to center and scale.
#' @param data2 A data frame to use for the centering and scaling.
#' @param center A character vector of the columns to center.
#' @param scale A character vector of the columns to scale (after centering).
#'
#' @return The data frame with rescaled columns.
#' @export
#' @seealso \code{\link[base]{scale}} and \code{\link{rescale2}}
#' @examples
#' rescale(datasets::mtcars, scale = "mpg")
rescale <- function(data, data2 = data, center = character(0), scale = character(0)) {
  check_data1(data); check_data1(data2);
  check_vector(center, "", min_length = 0)
  check_vector(scale, "", min_length = 0)
  check_cols(data, center); check_cols(data, scale);
  check_cols(data2, center); check_cols(data2, scale);

  scale %<>% unique()
  center %<>% c(scale) %>% unique() # scaled variables must be centred first.

  data[center] %<>% center(data2[center])
  data[scale] %<>% scale(data2[scale])
  data
}
