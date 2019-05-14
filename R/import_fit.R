#' Funktion, die FIT-Dateien importiert.
#'
#' @param device character. Auswahl zwischen Garmin und Lezyne Gerät. Damit wird
#'   das Quellen- und das Speicherverzeichnis bestimmt.
#' @param from character. Pfad zum Quellenverzeichnis. Muss angegeben werden,
#'   wenn das default-Verzeichnis der Geräte nicht mit dem tatsächlichen
#'   Quellenverzeichnis übereinstimmt. Zum Beispiel wenn das Gerät aktuell nicht
#'   als das default-Laufwerk ('E:/') angezeigt wird oder wenn Aktivitäten von
#'   einem anderen Gerät importiert werden sollen. Kann nur in Kombination mit dem
#'   Argument 'to' übergeben werden.
#' @param to character. Pfad zum Speicherverzeichnis. Siehe 'from'.


import_fit <- function(device = "garmin", from = NULL, to = NULL)
{
  if(is.null(c(from, to)))
  {
    if(tolower(device) == "garmin")
    {
      from <- "E:/GARMIN/ACTIVITY"
      to <- "C:/Users/Manuel/Nextcloud/Garmin/Activity"
    }

    if(tolower(device) == "lezyne")
    {
      from <- "E:/Lezyne/Activities"
      to <- "C:/Users/Manuel/Nextcloud/Lezyne/Activities"
    }
  }

  else
  {
    if(any(!is.null(from), !is.null(to)))
      stop("Argumente 'from' und 'to' müssen entweder beide übergeben werden oder keines!")
  }

  files <- list.files(path = from, pattern = "fit$", full.names = TRUE)
  copied_files <- sum(file.copy(from = files, to = to, overwrite = FALSE, copy.date = TRUE))

  return(ifelse(copied_files != 1, paste0(copied_files, " Aktivitäten wurden importiert."), "1 Aktivität wurde importiert."))
}
