## Missing data 
## Colin M. Bosma

## Resources
browseURL("https://uvastatlab.github.io/2019/05/01/getting-started-with-multiple-imputation-in-r/")
browseURL("https://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/")

## Packages
library(VIM) # aggr() function for checking proportion and patterns of missing data
library(mice) # multiple imputation
library(tidyverse) # for dyplr


## Check proportion and pattern of missing data ---------------------------------

# simple
VIM::agger(df)

# Pretty 
mice_plot <- VIM::aggr(df, col = c("navyblue", "lightblue"),
                       numbers = TRUE, sortVars = TRUE,
                       labels = names(df), gap = 3,
                       ylab = c("Missing Data", "Pattern"))
                       

## Just remove all cases w/ NAs ------------------------------------------------

df %>% 
  filter(!(is.na())
  
## Mean/Median imputation ------------------------------------------------------

# Calculate mean or median
lapply(df[c("var", "var2", "var3", "var4")], mean)

df <- df %>% 
  dplyr::mutate(var = replace_na(var, <mean value)
  
## Multiple Imputation using `mice` -------------------------------------------

# Select only the variables you will be modeling

df2 <- %>%
  dplyr::select(-id)
  
mi_df <- mice(df2, m = 5, method = "pmm", maxit = 50, seed = 500)
summary(im_df)

# Double-check imputed values
mi_df$imp$var



