
## MIXED-EFFECT LINEAR MODELING TEMPLATE USING lme4 and nlme
#-----------------------------------------------------------------------------------------

if (!require(lme4)) {install.packages("lme4"); require(lme4)}  # package for multilevel modeling and general linear modeling
if (!require(nlme)) {install.packages("nlme"); require(nlme)}  # package for multilevel modeling - use for final fit of model
if (!require(lattice)) {install.packages("lattice"); require(lattice)} # package for visualizing multivariate data/analyses
if (!require(sjPlot)) {install.packages("sjPlot"); require(sjPlot)}  # creates mixed-effects model tables
if (!require(xtable)) {install.packages("xtable"); require(xtable)}  # creates GLM tables
if (!require(reshape2)) {install.packages("reshape2")}; require(reshape2) # format dataframe into long format
if (!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)} # Loads Hadley's tidyverse packages
if (!require(bootstrap)) {install.packages("bootstrap"); require(bootstrap)} # for bootstrapping coeffiencents  and other parameters


## Websites and documentation

browseURL("http://www.statmethods.net/advgraphs/trellis.html")
browseURL("http://cran.r-project.org/web/packages/lattice/lattice.pdf")
browseURL("https://strengejacke.wordpress.com/2015/06/05/beautiful-table-outputs-summarizing-mixed-effects-models-rstats/")
browseURL("http://glmm.wikidon.com/faq") # Good website for steps in mixed-effects modeling
browseURL("http://r4ds.had.co.nz") # R for Data Science online version by Hadley

## Load Data (from .csv file)
## -----------------------
data <- read.csv("[insert directory]", header=TRUE)
  names(data) <- tolower(names(data)) ##Change all variable names to lowercase
  names(data) <- gsub("-", "_", names(data))   ## replace "." with "_" in variable names (change based on variable names)
  names(data) # Checking changes to variable names
  head(data, 10); tail(data, 10) # Print first and last six items of data set

# Create new dataframe from larger dataframe with variables of interest
newdf <- data[,c("vec", "vec")]

# Using data.frame function
newdf <- data.frame(data$vec)
names(newdf) <- c("var.name")

## Restructuring data into long format using `reshape2` package -----------------------

# ! Note incorporate pivot_longer() function 

?reshape2 # Open reshape2 documentation
data <- melt(dataframe,
             measure.vars = C(""),
             value.name = "",
             id.vars = c("")
             variable.name = "")

## Restructuring data into long format using `tidyr` package -----------------------


## Look at the data using `lattice` package
# See documentation above for other `lattice` options

?lattice # Open lattice documentation
xyplot(x, data, ...)

## Model Templates using nlme.
# Note: Depending on the data, you may want to build the models using the `glm()` function from the lme4 package and the 'update' function

## -----------------------

# Random intercept
model_ri <- lme(DV~IV, random=~1|SAMPLE, data=YOURDATA, method="ML")
#NOTES:
#1. Syntax that needs to be changed in accordance to your data is in caps
#2. Sample is the variable you use to identify each sample, such as participant IDs. It is the variable where you want your random intercepts to be based on.
#3. If you happen to have any missing data you are not aware of, use (na.actions=na.exlude) or use imputation 
#4. This is likely the model format you will be using.
#5. SAMPLE is typically the id, allowing for the random intercept at the individual level 

# Building models using lme4 package (easier for building nested models)
model <- glm(DV~IV + (1|ID),data=data, na.action=na.exclude) # random intercept

# random slope
model_rs <- lme(DV~IV, random=~IV|SAMPLE, data=YOURDATA, method="ML")
#NOTES:
#1. To create a random slope model, you replace the "1" with a nested IV such as Time.

# random intercept with covariates
model_ri <- lme(DV~IV, + IV2 + IV3, random=~1|SAMPLE, data=YOURDATA, method="ML")

# Updating model
newmodel <- update(previous.model.name, .~. + additional.variable)


## Comparing Models -----------------------
aov(model_1, model_2)

# Use REML instead of ML depending on characteristics of data 
# Use `lme()` function from nlme package to get output with p-values - good as a final model

summary(model)
intervals(model)

## Check for sphericity

## Correcting for when sphericity is violated


## Testing for random effect - use bootstrap approach -----------------------

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


## Making Tables using `sjPlot` package
# Note: output cannot be rendered into anything other than html - good as a reference, but not inserting into a manuscript or poster
## -----------------------
table <- sjt.lmer()
