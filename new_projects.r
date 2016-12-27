## [Insert Title]

## Open Useful Websites or Documentation
## -----------------------
browseURL("http://www.statmethods.net/") # Quick-R website - great reference for data analysis in R
browseURL("http://cran.r-project.org/web/packages/available_packages_by_name.html") # Available CRAN Packages by Name
browseURL("https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml") # Google's R Style Guide
browseURL("http://www.ats.ucla.edu/stat/mult_pkg/whatstat/") # Flow chart for choosing the the correct analyses
browseURL("http://psych.colorado.edu/~mcclella/psych3101h/statfinder/start.html") # Flow chart for choosing type of analysis to run
browseURL("http://cran.r-project.org/web/views/") # List of packages by category


## PACKAGES
## -----------------------
if (!require(packagename)) {install.packages("packagename"); require(packagename)} # Template
if (!require(readr)) {install.packages("readr"); require(readr)} # package for importing data with additional options and control
if (!require(psych)) {install.packages("psych"); require(psych)} # Basic upgrades to the base R functions tailored to psychology
if (!require(ggplot2)) {install.packages("ggplot2"); require(ggplot2)} # Data visualization package - useful for specialized visualization
if (!require(dpylr)) {install.packages("dpylr"); require(dpylr)} # Data manipulation package
if (!require(tidyr)) {install.packages("tidyr"); require(tidyr)} # Data cleaning package
if (!require(outliers)) {install.packages("outliers"); require(outliers)} # Outlier detection


## IMPORT DATA (from flat .csv file)
# Note: use function read.csv2 for european data sets (with commas as decimals). Use read.table() to set parameters to read other flat data formats
# use fread() function to import data and easily drop/select variables ex: data <- fread("data.csv", select = c(), drop = c())
## -----------------------
data <- file.path("[insert directory]") # setting file path to import data
data <- read_csv("[data.csv]") # load data using readr package - can use arguments to convert data types through import
  names(data) <- tolower(names(data)) ##Change all variable names to lowercase
  names(data) <- gsub("-", "_", names(data))   ## replace "." with "_" in variable names (change based on variable names)
  names(data) #Checking changes to variable names
    head(data, 10); tail(data, 10) # Print fist and last six items of data set
    str(data) # check to see which variables may need to be converted to a different class
    View(data)

## FORMATTING DATA - Basic (if needed)
## -----------------------
class()
str() # Shows type of data (class and other parameters)

# Factors
factor()

# Characters
is.character()
as.character()

# Numeric
is.numeric()
as.numeric()


## LOOK AT THE DATA 
## -----------------------
ls() # Look at what is in your workspace
summary()
describe()
table() # Useful for looking at frequencies of categorical variables (can use sapply(Var, sum) as well)

## PLOTTING DATA AND OUTLIER DETECTION 
## ------------------------

# Using ggplot2

xvar_mean <- mean(xvar) # Save mean to vector

# Histogram

ggplot(data = data, aes(x = xvar_rand_norm)) +
  geom_histogram() +
  geom_vline(xintercept = xvar_mean, color = "dark red") +
  annotate("text", label = paste("Mean: ", round(xvar_mean,digits = 2)), x = xvar_mean, y = 30, color = "white", size = 5)


# Using base graphics
par()              # view current settings
opar <- par()      # make a copy of current settings

attach(data)

plot()
boxplot()
hist()

par(opar)          # restore original settings

detach(data)

# Outlier detection 

describe()
boxplot()
scale(vec, center = TRUE, scale = TRUE) # calculate z-scores for each value in vector
outlier() # using 'outlier' package

## DESCRIPTIVE STATISTICS
## -----------------------

# Depending on type of data, use lapply(), or vapply() for more control

sapply(, mean)
sapply(, sd)
sapply(, range)

## DATA ANALYSIS
## -----------------------
