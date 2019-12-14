## Background calculations for app.R

## import libraries

library(gt)
library(sf)
library(rgdal)
library(vembedr)
library(janitor)
library(markdown)
library(tidyverse)



## create a dafaframe out of race shapefile data

x <- readOGR(dsn=".",layer="Census_MCD_Ancestry_Ethnicity_IN")
x.df <- as(x, "data.frame") %>% 
  clean_names() %>% 
  drop_na()



## merge lat long data wih industry data and write it to a csv

industries  <- read_csv("Project/industries.csv") %>%
  clean_names() %>% 
  drop_na()

lat_lng  <- read_csv("Project/lat_lng.csv") %>%
  clean_names() %>% 
  drop_na()

# merge the lat lng data with industry to get a merged csv

industry_merged_with_lat_lng <- merge(industries, lat_lng, by="cnty_name", all.x=TRUE, all.y=TRUE)

write_csv(industry_merged_with_lat_lng, "Project/industry_geographic.csv")



## read in industry data and make a new shapefile with top industry per county

top_industry_in_each_county <- industries %>% 
  group_by(cnty_name) %>% 
  arrange(desc(count)) %>% 
  filter(row_number() == 1) %>% 
  rename(top_industry = naics_code) %>% 
  select(cnty_name, top_industry)

write_csv(top_industry_in_each_county, "Project/top_industries.csv")



## add a column to race data that is top industry

x.df <- merge(x.df, top_industry_in_each_county, by = "cnty_name", all.x=TRUE, all.y=TRUE) %>% 
  drop_na()



## write this df to a csv

write_csv(x.df, "Project/cleaned_race_shapefile.csv")
  