#' Get Plot data from activities table.
#'

fetch <- function(parameter, data)
{
  if(parameter == "minutes")
  {
    data <- data[["timestamp"]]
    data <- (data - data[1]) / 60
  }
  else if(parameter == "pace")
  {
    data <- data[["speed"]]
    data <- speed_to_pace(data)
  }
  else
    data <- data[[parameter]]
  return(data)
}
