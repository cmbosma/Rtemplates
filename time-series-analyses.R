## Time-series analyses

## RESOURCES
## ------------------------------------------------------------


browseURL("https://www.neonscience.org/dc-convert-date-time-POSIX-r")

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

## Sampling Frequency ------------------------------------------

# First time observation
first(df)

# Last time observations
end(df)

# calculates a vector of time indices, with one element for each time index on which the series was observed.
time(df)

# Fixed time interval between observations
deltat(df)

## Missing values -----------------------------------------------

# ex. Calcuating mean with NAs removed 
mean(df, na.rm = TRUE) 

# imputing values using mean
df[X:X] <- mean(df, na.rm = TRUE)

## Time Series Objects -----------------------------------------

# Create a time-series object 
ts(data_vec)

# Adjust start and frequency 
ts(data_vec, start = , frequency = )

# Check whether a given object is a time-series object
is.ts(data_vec)

# number of observations per unit time.
frequency(df)

# returns the position in the cycle of each observation
cycle(df)

