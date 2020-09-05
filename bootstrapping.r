## Bootstrapping
## Colin Bosma

## PACKAGES ---------------------------------------------
library(boot)
library(infer)

## Resources --------------------------------

# using boot package
browseURL("https://www.statmethods.net/advstats/bootstrapping.html")

# infer package
browseURL("https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_lubridate.pdf")

## infer package approach --------------------

# To see examples for bootstrapping other stats
vignette("observed_stat_examples")

# 95% CIs for simple linear regression. 

# Generating the null distribution
boot <- df %>%
   specify(dv ~ iv) %>% 
   generate(reps = 2000, type = "bootstrap") %>%
   calculate(stat = "slope")

# Use null distribution to find a CI
percentile_ci <- get_ci(boot)

# Visualizing the observed statistic alongside the null distribution
visualize(boot) +
  shade_confidence_interval(endpoints = percentile_ci)

# Print
percentile_ci

## Boot package approach -------------------

# Bootstrap 95% CI for regression coefficients
library(boot)
# function to obtain regression weights
bs <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample
  fit <- lm(formula, data=d)
  return(coef(fit))
}
# bootstrapping with 1000 replications
# Note: replace data and variables
results <- boot(data=mtcars, statistic=bs,
                R=1000, formula=mpg~wt+disp)

# view results
results
plot(results, index=1) # intercept
plot(results, index=2) # wt
plot(results, index=3) # disp

# get 95% confidence intervals
boot.ci(results, type="bca", index=1) # intercept
boot.ci(results, type="bca", index=2) # wt
boot.ci(results, type="bca", index=3) # disp
