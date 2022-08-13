library(dplyr)
library(plotly)

test <- read.csv("C:/Users/Manuel/Nextcloud/Garmin/Activity/C8BI5257.csv", fileEncoding="UTF-8-BOM")
names(test)

check_emptorNA <- function(x, which = FALSE){
  if (which) return(which(!(!nzchar(x) | is.na(x))))

  return(!all(!nzchar(x) | is.na(x)))
}

assign("record", filter(test, Message == "record"))
record <- select(record, where(check_emptorNA))

coords <- filter(record, Type == "Data", Local.Number == 13) %>%
  select(Value.3, Value.2, Value.5, Value.1) %>%
  mutate(across(everything(), as.numeric)) %>%
  rename(long = Value.3, lat = Value.2, altitude = Value.5, time = Value.1)


plot(coords$long, coords$lat, pch=20, type = "l")
fig <- plot_ly(coords, x = ~long, y = ~lat, z = ~altitude, type = 'scatter3d', mode = 'lines')
fig


nsmc <- 2147483648
scperm <- 107.173

toRadians <- function(smc){
  return((smc * pi) / nsmc)
}

cosineCorrection <- function(lats){
  center <- head(lats, -1) + diff(lats)/2
  radians <- toRadians(center)
  return(cos(radians))
}

distance <- function(data){
  x <- diff(data$long) * cosineCorrection(data$lat)
  y <- diff(data$lat)
  z <- diff(data$altitude)

  h <- sqrt(x^2 + y^2) / scperm
  d <- sqrt(h^2 + z^2)

  return(d)
}
