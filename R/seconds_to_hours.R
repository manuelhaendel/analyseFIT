#' Convert Seconds to H:M:S.
#'
#' @param seconds

seconds_to_hours <- function(seconds)
{
  hours <- floor(seconds / 3600)
  minutes <- floor((seconds - (hours * 3600)) / 60)
  seconds <- seconds - (hours * 3600 + minutes * 60)
  if(hours == 0) return(paste0(minutes, ":", sprintf("%02d", seconds)))

  return(paste(hours, sprintf("%02d", minutes), sprintf("%02d", seconds), sep = ":"))
}
