## Data Visualization [in progress]

## Open Useful Websites or Documentation -----------------------
browseURL("http://www.statmethods.net/") # Quick-R website - great reference for data analysis in R
browseURL("http://cran.r-project.org/web/packages/available_packages_by_name.html") # Available CRAN Packages by Name
browseURL("http://cran.r-project.org/web/views/") # List of packages by category
browseURL("https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml") # Google's R Style Guide
browseURL("https://cran.r-project.org/web/packages/jtools/vignettes/interactions.html") # documentation for jtools package
browseURL("https://gotellilab.github.io/GotelliLabMeetingHacks/NickGotelli/ggplotPatchwork.html") # documentation for patchwork package

## Load Packages
## -----------------------
if (!require(ggplot2)) {install.packages("ggplot2"); require(ggplot2)} # ggplot2: Data visualization package - useful for specialized visualization
if (!require(lattice)) {install.packages("lattice"); require(lattice)} # lattice: package for visualizing multivariate data/analyses
if (!require(ggvis)) {install.packages("ggvis"); require(ggvis)} 
if (!require(colorspace)) {install.packages("colorspace"); require(colorspace)} # package with GUI to choose palettes
library(jtools) # for plotting interactions
library(patchwork) # package for printing multple plots 
library(ggpubr) # use if patchwork is not compatible with current version of R


## Load Data ----------------------------

## Creating a Custom Palette -------------
colorspace::choose_palette()

## Base Graphics -----------------------

## ggplot2 -----------------------

## Plotting Interactions Using jtools

interaction_plot()

## Multiple Plots




