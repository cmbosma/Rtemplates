## Geo Spacial Visualizations
## Notes based on Datacamp's Geo Visualization R Course 

## PACKAGES
## ---------------------------------------------------------

# Packages needed
packages <- c("tidyverse",
             "ggmap", # allows geo spatial data to be layered onto ggplot
             )

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Load packages into workspace
invisible(lapply(packages, library, character.only = TRUE))

## 
## ---------------------------------------------------------

## ggmap
# get_map() location can be an object with a longitude and latitude pair
get_map(location, zoom = , scale = )
