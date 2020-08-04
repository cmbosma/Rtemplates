## Time-Series Visualization



## RESOURCES
## ------------------------------------------------------------
# R charts with links to resources
browseURL("https://www.r-graph-gallery.com/time-series.html")

# Data vis considerations
browseURL("https://www.data-to-viz.com/caveats.html")


## PACKAGES
## ------------------------------------------------------------
library(tidyverse)
library(lubridate)
library(timetk) # newer package for visualizing time-series data
library(TraMineR

## Convert UTC time to datetime index variable  ---------------
lubridate::as.Date(df$`UTC time`)
# If date time varialb e variable is character type
as.POSIXct(df$`UTC time`, format = '%Y-%m-%d %H:%M:%S')
# Note
  # Time-series data needs to have a time index for many base R functions to work

## Base R Approach 
## ------------------------------------------------------------

## Univariate -------------------------------------------------
# Make more complex time-series plots (supports base R arguements)
ts.plot()

## Multivariate -----------------------------------------------

# Take a look using cor matrix of scatter plots
pairs(data.table, 
      lower.panel = NULL, 
      main = "main title")

# More comprehensive approach to visualizing cor matrices
corrplot()
# example
corrplot(data.table, 
         method = "number",
         type = "upper")
         
## Heatmap -----------
# Notes: 
  # heatmap is useful when you have many more than 2 variables
  # Make sure to subset data into a correlation matrix

corrplot(cor_mat, method = "color", type = "upper", order = "vec")
        
## ggplot2 approach 
## ------------------------------------------------------------


        
## Heatmap approach--------------------------------------------
        
# Some resources on coding a heatmap for time series data
browseURL("https://www.r-graph-gallery.com/283-the-hourly-heatmap.html")
        
## Time TK Approach 
## ------------------------------------------------------------

# Post on using `timetk` package
browseURL("https://www.r-bloggers.com/just-released-timetk-2-0-0-visualize-time-series-data-in-1-line-of-code/")


## Sequence Plotting Approach (for Digital Phenotype Data?)
## ------------------------------------------------------------

## Using the TraMineR package
browseURL("http://traminer.unige.ch/doc/seqplot.html") # website
browseURL("https://cran.r-project.org/web/packages/TraMineR/vignettes/TraMineR-state-sequence.pdf") # Article 
browseURL("http://mephisto.unige.ch/pub/TraMineR/doc/TraMineR-Users-Guide.pdf") # User Guide to the package        

