## Methods of importing and exporting data in R

#----------------------------------------------------

## Packages

if (!require(readr)) {install.packages("readr"); require(readr)} # package for importing data with additional options and control


## Importing .csv using base

setwd("[insert directory]")
data <- read.csv("dataframe.csv") # import without arguments
  data <- read.csv("dataframe.csv", na.strings = "999") # import .csv with coded missing variables 
    data <- read.csv("dataframe.csv", na.strings = c("999", "888") # use combine fuction for multiple coded missing variables

data <- read.csv2("datafram.csv", dec = ",") # Includes useful arguement to allow for importing European datasets with ',' as decimal
  

## Importing .csv using readr package

# Note. This package allows you to designate the type of variable upon import (see arguments)

data <- file.path("[insert directory]")
data <- read_csv("dataframe.csv")
data <- read_csv(file.choose()) # Opens finder for you to choose the file

## Exporting .csv using base

setwd("[insert directory") # Set working directory to project folder
  getwd() # checking working directory

write.csv(data, file = "DatasetName.csv", row.names = FALSE, na = "") 
