#' Rechnet m/s in s/km um.
#'
#' @param speed numeric. Geschwindigkeit in [m/s].

speed_to_pace <- function(speed)
{
  pace <- 1000 / (speed * 60)
  # min <- floor(pace)
  # sec <- round((pace - min) * 60)
  #
  # return (paste0(min, ":", sec, " min/km"))
  return(pace)
}
