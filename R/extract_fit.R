#' Extract all the relevant data for analysis from a fit-object.
#'

extract_fit <- function(fit)
{
  data <- fit$record
  data$time_created <- fit$file_id$time_created
  data$sport <- fit$sport$sport

}
