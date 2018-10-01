## [Insert Title]

## Open Useful Websites or Documentation
## -----------------------
browseURL("http://www.statmethods.net/") # Quick-R website - great reference for data analysis in R
browseURL("http://cran.r-project.org/web/packages/available_packages_by_name.html") # Available CRAN Packages by Name
browseURL("http://cran.r-project.org/web/views/") # List of packages by category
browseURL("http://www.ats.ucla.edu/stat/mult_pkg/whatstat/") # Flow chart for choosing the the correct analyses
browseURL("http://psych.colorado.edu/~mcclella/psych3101h/statfinder/start.html") # Flow chart for choosing type of analysis to run
browseURL("http://tidyverse.org") # Tidyverse package website
browseURL("http://style.tidyverse.org") # The tidyverse style guide 


## PACKAGES
## -----------------------
if (!require(packagename)) {install.packages("packagename"); require(packagename)} # Template
if (!require(psych)) {install.packages("psych"); require(psych)} # Basic upgrades to the base R functions tailored to psychology
if (!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)} # Packages by Hadley Wickham. Includes dyplr, tidyr, and ggplot2
if (!require(tidyverse)) {install.packages("haven"); require(haven)} # Package for importing data sets, including excel and SPSS
if (!require(lintr)) {install.packages("lintr"); require(lintr)} # Package for checking style of code
if (!require(outliers)) {install.packages("outliers"); require(outliers)} # Outlier detection
if (!require(p.adjust)) {install.packages("p.adjust"); require(p.adjust)} # For correcting for multiple comparisons
if (!require(robustHD)) {install.packages("robustHD"); require(robustHD)} # Package for winsorizing and critical values



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


## SUBSETTING COLUMNS OF INTEREST

df <- data.frame(data[vec1, vec2, vec3,...])

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

# Centering

scale(df$vec, center = TRUE, scale = FALSE)
df$vec - mean(df$vec) # manually

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

# if univariate, continuous variable

outlier_values <- boxplot.stats(df$vec)$out
boxplot(df$vec, main = "variable name", boxwex = 0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)
outlier_ids_upper <- subset(df, select = c(id, vec),  vec >= x) # change argument accordingly
outlier_ids_upper
outlier_ids_lower <- subset(df, select = c(id, vec),  vec <= x) # change argument accordingly
outlier_ids_lower

# Converting to z-score
scale(df$vec, center = TRUE, scale = TRUE)
df$vec - mean(df$vec)/sd(df$vec) # manually 


# With dplyr
dplyr::filter(df[c("id", "vec")], vec < x | vec > x) # replace x with cutoff

# Winsorizing

df[which(df$id == id_number), c("vec")] == new_value
df[row_number, column_number] = new_value
df <- df %>% mutate(vec = replace(vec, vec/"id" <= x, new value)) # using dplyr


## DESCRIPTIVE STATISTICS
## -----------------------

# Depending on type of data, use lapply(), or vapply() for more control

sapply(, mean)
sapply(, sd)
sapply(, range)

## DATA ANALYSIS
## -----------------------
