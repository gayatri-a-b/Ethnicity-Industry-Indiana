## Produces the map


## Import necessary libraries

library(sf)
library(ggplot2)
library(janitor)
library(tidyverse)


## Process input files
# http://www.stats.indiana.edu/maptools/GeographyTools.asp

# read shapefile

shape <- st_read("Project/tl_2010_18_tabblock10.shp")

races  <- read_csv("Project/all_races.csv") %>%
  clean_names()

industries  <- read_csv("Project/industries.csv") %>%
  clean_names()

lat_lng  <- read_csv("Project/lat_lng.csv") %>%
  clean_names()


total <- merge(industries,lat_lng,by="county")

area <- c("Hospitals")

sub_points <- total %>% 
  filter(naics_code %in% area)

# transform tibble to sf data
locations <- st_as_sf(sub_points, coords = c("lat", "lng"), crs = 4326)

# transform tibble to sf data
oc_locations <- st_as_sf(shape, coords = c("lat", "lng"), crs = 4326)


oc_locations %>% 
  ggplot()
