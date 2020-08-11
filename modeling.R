## Modeling

## PACKAGES 
## -----------------------------------------------------------
# Tidy models website
browseURL("https://www.tidymodels.org/")

## PACKAGES 
## -----------------------------------------------------------
library(tidyverse)
library(performance)


## Check fo multico-linearity --------------------------------

# Good article on multico-linearity
browseURL("https://www.r-bloggers.com/what-to-do-when-predictors-co-vary/")

# Check using the performance package
performance::check_collinearity(model_fit_object)
