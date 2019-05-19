#' Get Plot data from activities table.
#'

fetch <- function(parameter, data)
{
  if(parameter == "pace")
  {
    data <- data[["speed"]]
    data <- speed_to_pace(data)
  }
  else
    data <- data[[parameter]]
  return(data)
}
