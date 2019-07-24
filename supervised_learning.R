## Helpful code for supervised learning projects

## Libraries
library(sigr) # useful for printing test statistics
library(broom) # useful for examining linear models



## Regression models
##------------------------------------------------------------------------------------------

# Examining the model
broom::glance(model)

# Print test statistics
sigr::wrapFTest(model)
