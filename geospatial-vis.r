## Geo Spacial Visualizations
## Notes based on Datacamp's Geo Visualization R Course 

## PACKAGES
## ---------------------------------------------------------

# Packages needed
packages <- c("tidyverse",
             )

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Load packages into workspace
invisible(lapply(packages, library, character.only = TRUE))

