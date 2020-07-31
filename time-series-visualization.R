## Time-Series Visualization


## PACKAGES
## ------------------------------------------------------------
library(lubridate)

## Convert UTC time to datetime index variable  ---------------
lubridate::as.Date(df$`UTC time`)
# If date time varialb e variable is character type
as.POSIXct(df$`UTC time`, format = '%Y-%m-%d %H:%M:%S')
# Note
  # Time-series data needs to have a time index for many base R functions to work

## Explore the data --------------------------------------------

# number of observations
length()

# plot() when used with time series data, will plot data over time
plot()

# Make more complex time-series plots (supports base R arguements)
ts.plot()
