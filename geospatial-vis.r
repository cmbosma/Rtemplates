## Geo Spacial Visualizations
## Notes based on Datacamp's Geo Visualization R Course 

## GOOGLE API KEY
## ---------------------------------------------------------

# Need to get Google API key first

browseURL("https://developers.google.com/maps/documentation/embed/get-api-key")

register_google(key = "<key_hash>")

## PACKAGES
## ---------------------------------------------------------

library(tidyverse)
library(ggmap)

## 
## ---------------------------------------------------------

## ggmap

# Set location (can do within get_map) 
loc <- c(lon = <longitude>, lat = <latitude>)

# get_map() location can be an object with a longitude and latitude pair. 
map <- get_map(location, zoom = , scale = )

# Check map
ggmap(map)

# Basic plot of coordinates layered over map
ggmap(map) + 
  geom_point(aes(longitude_vec, latitude_vec), data = df)
