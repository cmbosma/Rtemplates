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

## Trend Spotting -----------------------------------------------

# sample transformations
  # Log transformation can linearalize a rapid growth tend
log()
  # Diff function can remove linear trends by creating a change series
diff()
  # Seasonal difference transformation - can remove periods of trends
diff(..., s = )
diff(..., lag = ) # can use lag argument 

## Estimating White Noise ---------------------------------------

# Estimating
arima(model, order = c(0, 0 ,0))
# can also estimate mean and variance parameters
mean(); var()

# Simulating
arima.sim(model = list(order = c(0, 0, 0)), n = <n-observations>)

## Random Walk modeling -----------------------------------------

# simulating a random walk model
arima.sim(model = list(order = c (0, 1, 0)), n = 100)

# Generate RW model with drift. Providing a mean value creates the drift
rw_drift <- arima.sim(model = list(order = c(0, 1, 0)), n = 100, mean = 1)

## Autocorrelation ----------------------------------------------

# Lag 1 autocorrelation - e.g., one day before
acf(vec, lag.max = 1, plot = FALSE)

# Can evaluate time lag for more than one
acf(vec, lag.max = 3, plot = TRUE) # evals lag for 1:3 and plots them

## Autoregressive Modeling --------------------------------------

# Simulate an AR model with 0.5 slope
x <- arima.sim(model = list(ar = 0.5), n = 100)

## Autoregressive Modeling (AR) Estimation and Forecasting ------

# Fitting and AR model
x <- arima(vec, order = c(1, 0, 0))

# Make a prediction using a 1-step forecast
predict(vec) # default is 1-step

# Multiple steps
predict(vec, n.ahead = 10)

## Simple Moving Average Model ------------------------------------------

# Simulating a moving average model 
x <- arima.sim(model = list(ma = theta), n = 100)
# Slope = 0.5
x <- arima.sim(model = list(ma = 0.5), n = 100)

## Forecasting
# First-order MA model 
x <- arima(vec, order = c(0, 0, 1))
print(x) # get summary

# Forecast 
predict(x)$pred




