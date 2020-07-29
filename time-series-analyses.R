## Time-series analyses


## Create a time index
as.POSIXct(df$`UTC time`, format = '%Y-%m-%d %H:%M:%S')

## Explore the data --------------------------------------------

# number of observations
length()

# plot() when used with time series data, will plot data over time
plot()

## Sampling Frequency ------------------------------------------

