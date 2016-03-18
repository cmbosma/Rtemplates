## Data Visualization [in progress]

## Open Useful Websites or Documentation
## -----------------------
browseURL("http://www.statmethods.net/") # Quick-R website - great reference for data analysis in R
browseURL("http://cran.r-project.org/web/packages/available_packages_by_name.html") # Available CRAN Packages by Name
browseURL("http://cran.r-project.org/web/views/") # List of packages by category
browseURL("https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml") # Google's R Style Guide
# [insert more useful URLs for data visualization in R]

## Load Packages
## -----------------------
if (!require(ggplot2)) {install.packages("ggplot2"); require(ggplot2)} # ggplot2: Data visualization package - useful for specialized visualization
if (!require(lattice)) {install.packages("lattice"); require(lattice)} # lattice: package for visualizing multivariate data/analyses
if (!require(ggvis)) {install.packages("ggvis"); require(ggvis)} # ggvis:

## Load Data
## -----------------------
library(mtcars)
str(mtcars)

## Base Graphics
## -----------------------

## ggplot2
## -----------------------
