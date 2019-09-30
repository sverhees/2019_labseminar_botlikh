
# Load packages

library(lingtypology)
library(tidyverse)


# Location of Botlikh 

map.feature("Botlikh",
            color = "mediumvioletred",
            width = 8,
            zoom.level = 7,
            tile = c("Esri.WorldTopoMap")) # general language location


# Load dataframe with coordinates and languages for villages around Botlikh

hood <- read_tsv("~/Git/2019_labseminar_botlikh/mapdata/botlikhhood.csv")

# Map of the Botlikh neighborhood

map.feature(hood$lang,
            latitude = hood$lat,
            longitude = hood$lon,
            features = hood$lang,
            color = "magma",
            title = "Language",
            width = 8,
            zoom.level = 12) # neighborhood close-up


# Create dataframe with some important toponyms in and around Botlikh

shaitane <- data.frame("lat" = c("42.6605719", "42.6690729", "42.663768", "42.655494"), 
                       "lon" = c("46.2146662", "46.201258", "46.223061", "46.1977715"),
                       "lang" = c("Botlikh"),
                       "place" = c("Shait'ane", "Mikrorayon", "Old village", "Shogaɬi hani"))

# Convert character vectors with coordinates to numeric

shaitane$lat <- as.numeric(as.character(shaitane$lat))
shaitane$lon <- as.numeric(as.character(shaitane$lon))

shaitane$place <- factor(shaitane$place, levels = c("Old village", "Mikrorayon", "Shait'ane", "Shogaɬi hani"))

# Map with neighborhood and Botlikh toponyms

map.feature(hood$lang,
            latitude = hood$lat,
            longitude = hood$lon,
            features = hood$lang,
            color = "magma",
            title = "Language",
            legend.position = "bottomright",
            width = 8,
            zoom.level = 11) %>%
  map.feature(shaitane$lang,
            latitude = shaitane$lat,
            longitude = shaitane$lon,
            features = shaitane$place,
            shape = c("❖", "◇", "◆", "⟡"),
            zoom.level = 13,
            pipe.data = .)

  