#' Rescale Transformed Data
#'
#' Rescales transformed columns in a data frame based on
#' the transformed columns in a second data frame.
#' The columns are rescaled by subtracting values and then dividing by values.
#'
#' The column names can include a single function for the transform as well as the following suffices: + (subtract mean), - (subtract min), < (subtract min and add 1), / (divide by sd) and * (subtract mean and divide by sd).
#'
#' @param data The data frame to rescale.
#' @param data2 A data frame to use for the rescaling.
#' @param colnames A character vector of column names to transform and/or rescale.
#' @return The data frame with transformed and rescaled columns.
#' @export
#' @seealso \code{\link{rescale}}
# rescale3(datasets::mtcars, c("log(mpg)*", "disp+", "gear-", "hp/"))
rescale3 <- function(data, data2 = data, colnames = character(0)) {
  check_data1(data); check_data1(data2);
  check_vector(colnames, "", min_length = 0)

  if (!length(colnames)) return(data)
  check_valid_rescalers(colnames)

  names <- vapply(colnames, get_rescaler_colname, "")
  transform <- lapply(colnames, get_rescaler_transform)
  code <- lapply(colnames, get_rescaler_code)

  if (anyDuplicated(names)) error("columns must appear only once in colnames")

  names(transform) <- names
  names(code) <- names

  transform <- transform[vapply(transform, function(x) length(x) > 0, TRUE)]
  code <- code[vapply(code, function(x) length(x) > 0, TRUE)]

  transform %<>%
    switch_list() %>%
    aggregate_list()

  code %<>%
    switch_list() %>%
    aggregate_list()

  data %<>% transform(transform)

  if (!length(code)) return(data)

  data2 %<>% transform(transform)

  names(code) <- rescaler_codes[names(code)]

  for (i in seq_along(code)) {
    data[] %<>% rescale_fun(data2, code[i])
  }
  data
}
