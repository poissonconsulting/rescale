#' Rescale Data
#'
#' Centers and scales columns in a data frame based on
#' the columns in a second data frame.
#' A column is centered by subtracting the mean and scaled (after centering)
#' by dividing by the standard deviation.
#' Columns in \code{scale} do not also need to be listed in \code{center}.
#'
#' @param data The data.frame to center and scale.
#' @param data2 A data.frame to use for the centering and scaling.
#' @param center A character vector of the columns to center.
#' @param scale A character vector of the columns to scale (after centering).
#'
#' @return The centered and scaled data.frame.
#' @export
#' @seealso \code{\link[base]{scale}}
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

  if (!length(center) && !length(scale)) return(data)

  data[center] %<>% center(data2[center])
  data[scale] %<>% scale(data2[scale])
  data
}
