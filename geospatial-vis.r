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
## Note
  # Can specify different types of google maps, not just terrain map

# Set location (can do within get_map) 
location <- c(lon = <longitude>, lat = <latitude>)

# get_map() location can be an object with a longitude and latitude pair. 
# Check arguements. Can change map type. 
# Basic
map <- get_map(location, zoom = , scale = )
# With useful arguements
map <- get_map(location, zoom = , scale = , maptype = , source = )

# Check map
ggmap(map, zoom = )

# Basic plot of coordinates layered over map
ggmap(map) + 
  geom_point(aes(longitude_vec, latitude_vec), data = df)

# Specify default data aesthetics 
# Can use ggmap background with ggplot2 specifications
# Use baselayer arguement 
ggmap(map, base_layer = ggplot(df, aes(lon, lat)) + 
   geom_point()
      
## Can plot using faceting
ggmap(map, base_layer = ggplot(df, aes(lon, lat)) + 
   geom_point(aes(color = var) + 
   facet_wrap(~ var)
              
              
              
                               

