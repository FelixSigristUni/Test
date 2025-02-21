install.packages("httr")
install.packages("jsonlite")


library(httr)
library(jsonlite)
library(tidyverse)

# Beispiel: Abfrage einer Verbindung von Zürich nach Bern
url <- "https://transport.opendata.ch/v1/connections?from=Zürich&to=Bern"

# API-Request senden
response <- GET(url)

# Daten in R einlesen
data <- content(response, as = "text", encoding = "UTF-8") %>% fromJSON(flatten = TRUE)

# Daten anschauen
str(data)



# verspätungen ------------------------------------------------------------

url <- "https://transport.opendata.ch/v1/stationboard?station=Bern&limit=10"

response <- GET(url)
data <- content(response, as = "text", encoding = "UTF-8") %>% fromJSON(flatten = TRUE)

# Zeige die ersten paar Einträge
head(data$stationboard)

