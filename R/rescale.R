
rescale <- function(data, data2 = data, center = character(0), scale = character(0)) {
  check_data1(data)
  check_data1(data2)
  check_vector(center, "", min_length = 0)
  check_vector(scale, "", min_length = 0)

  scale %<>% unique()
  center %<>% c(scale) %>% unique()

  if(!length(center))
    return(data)


}
