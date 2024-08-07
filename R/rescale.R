#' Rescale Data
#'
#' Centers and scales columns in a data frame based on the columns in a second
#' data frame. A column is centered by subtracting the mean and scaled by
#' dividing by the standard deviation. Columns in \code{scale} are automatically
#' added to \code{center} so they are standardised.
#'
#' @param data The data frame to center and scale.
#' @param data2 A data frame to use for the centering and scaling.
#' @param center A character vector of the columns to center.
#' @param scale A character vector of the columns to scale (after centering).
#'
#' @return The data frame with rescaled columns.
#' @export
#' @seealso \code{\link[base]{scale}}, \code{\link{rescale_f}} and \code{\link{rescale_c}}
#' @examples
#' rescale(datasets::mtcars, scale = "mpg")
rescale <- function(data,
                    data2 = data,
                    center = character(0),
                    scale = character(0)) {
  chk::chk_data(data)
  chk::chk_data(data2)
  chk::chk_vector(center, "")
  chk::chk_vector(scale, "")
  chk::check_names(data, center)
  chk::check_names(data, scale)
  chk::check_names(data2, center)
  chk::check_names(data2, scale)

  scale <- scale |> unique()
  center <- center |> c(scale) |> unique() # scaled variables must be centred first.

  data[center] <- data[center] |> center(data2[center])
  data[scale] <- data[scale] |> scale(data2[scale])
  data
}
