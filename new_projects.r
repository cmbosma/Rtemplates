## [Insert Title]

## Open Affiliated Websites or Documentation
## -----------------------
browseURL("http://www.statmethods.net/") # Quick-R website - great reference for data analysis in R
browseURL("http://cran.r-project.org/web/packages/available_packages_by_name.html") # Available CRAN Packages by Name
browseURL("https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml") # Google's R Style Guide
browseURL("http://www.ats.ucla.edu/stat/mult_pkg/whatstat/") # Flow chart for choosing the the correct analyses
browseURL("http://psych.colorado.edu/~mcclella/psych3101h/statfinder/start.html") # Flow chart for choosing type of analysis to run
browseURL("http://cran.r-project.org/web/views/") # List of packages by category

## Load Packages
## -----------------------
if (!require(packagename)) {install.packages("packagename"); require(packagename)} #Template
if (!require(psych)) {install.packages("psych"); require(psych)} # Basic upgrades to the base R functions tailored to psychology

##Load Data (from .csv file)
## -----------------------
data <- read.csv("[insert directory]", header=TRUE)
  names(data) <- tolower(names(data)) ##Change all variable names to lowercase
  names(data) <- gsub("_", ".", names(data))   ## replace "_" with "."
  names(data) #Checking changes to variable names
    head(data, 10); tail(data, 10) # Print fist and last six items of data set 

## Formatting Data - Basic (if needed)
## -----------------------
class()

# Factors
is.factor()
as.factor()


# Characters
is.character()
as.character()

## Look at the Data
## -----------------------
ls() # Look at what is in your workspace
str() # Shows type of data (class and other parameters)
summary()
describe()
names()
table() # Useful for looking at frequencies of categorical variables (can use sapply(Var, sum) as well)

## Plotting variables
par()              # view current settings
opar <- par()      # make a copy of current settings

attach(data)

plot()
boxplot()
hist()

par(opar)          # restore original settings

detach(data)

## Descriptive Statisitics
## -----------------------
sapply(, mean)
sapply(, sd)

## Data Analyses
## -----------------------
