## Methods of importing and exporting data in R

#----------------------------------------------------

## Packages

if (!require(readr)) {install.packages("readr"); require(readr)} # package for importing data with additional options and control
if (!require(data.table)) {install.packages("data.table"); require(data.table)} # package for fread() function
if (!require(haven)) {install.packages("haven"); require(haven)} # package for fread() function
if (!require(readxl)) {install.packages("readxl"); require(readxl)} # package for importing excel files


## Importing 
## ---------------------------------------------------------------------------------

## Importing .csv using base

setwd("[insert directory]")
data <- read.csv("dataframe.csv") # import without arguments
  data <- read.csv("dataframe.csv", na.strings = "999") # import .csv with coded missing variables 
    data <- read.csv("dataframe.csv", na.strings = c("999", "888") # use combine fuction for multiple coded missing variables

data <- read.csv2("datafram.csv", dec = ",") # Includes useful arguement to allow for importing European datasets with ',' as decimal
  

## Importing .csv using readr package

# Notes. 
# This package allows you to designate the type of variable upon import (see arguments)
# The data is imported as a tibble                    
  

data <- file.path("[insert directory]")
data <- read_csv("dataframe.csv")
data <- read_csv(file.choose()) # Opens finder for you to choose the file

## Importing .csv using fread() function from the data.table package

# Notes: 
# The fread() function does a good job guessing the format of your data
# the data is imported as a data.table and data frame
                     
data <- fread("filename.csv")
data <- data.table::fread("filename.csv") 
                     
# Can specify which columns and rows
fread("path/to/file.txt", drop = 2:4)
fread("path/to/file.txt", select = c(1, 5))
fread("path/to/file.txt", drop = c("b", "c", "d"))
fread("path/to/file.txt", select = c("a", "e"))

## Importing .sav files (SPSS) using haven

data <- read_sav("filename.sav")        
data <- haven::read_sav("filename.sav")
                     
## Importing excel using readxl package
# Notes: Accepts both .xls and .xlsx files
                     
excel_sheets() # lists sheets                     
read_excel() # imports data. 
                     
data <- read_excel("path/to/file.xlsm")  #  Imports first sheet by default. 
data <- read_excel("path/to/file.xlsm", sheet = 2) # imports second sheet                 
data <- read_excel("path/to/file.xlsm", sheet = "name_of_sheet") # imports based on name of sheet                 

                     
## Exporting 
## ---------------------------------------------------------------------------------
## Exporting .csv using base

setwd("[insert directory") # Set working directory to project folder
  getwd() # checking working directory

write.csv(data, file = "DatasetName.csv", row.names = FALSE, na = "") 
