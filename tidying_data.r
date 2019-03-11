## Cleaning data [in progress]

#----------------------------------------------------

## LIbraries

library(tidyverse)
library(dplyr) # if needed

## Formatting data frame
names(data) <- tolower(names(data)) # Change all variable names to lowercase
names(data) <- gsub("-", "_", names(data))   # replace "." with "_" in variable names (change based on variable names)

## Explore raw data

class() # class of data object

dim() # dimensions of data

names() # Column names

str() # Preview of data with helpful details

summary() # Summary of each column. Will produce different summaries based on class of variable.

glimpse() # better version of str() from dplyr package

head() # view first six rows of data
  head(var, 10) # can control how many rows are shown

tail() # view last six rows of data

print() # print entire data set to console - only use with small data sets

View() # see whole data set in separate tab

## Visualizing raw data
## -----------------------------------------------------------------------------

hist(data.frame$var) # view  histogram of single variable

plot() # view plot of two variables

ggplot(df, mapping = aes()) # basic plotting from ggplot2

## Cleaning data
## -----------------------------------------------------------------------------

# renaming elements of vectors
names(df)[names(df) == 'old.var.name'] <- 'new.var.name'

# Remove a case and assign to new data frame
newdf <- olddf[!(olddf$var=="case_string"),]

## Computing Variables
## -----------------------------------------------------------------------------

# Summing by row

df$vec <- rowSums(df[c("vec1", "vec2")], na.rm = FALSE)

# example:
data$bdi_s1 <- rowSums(data[c("bdi_ii_1", "bdi_ii_2", "bdi_ii_3",
                              "bdi_ii_4", "bdi_ii_5", "bdi_ii_6",
                              "bdi_ii_7", "bdi_ii_8", "bdi_ii_9",
                              "bdi_ii_10", "bdi_ii_11", "bdi_ii_12",
                              "bdi_ii_13", "bdi_ii_14", "bdi_ii_15",
                              "bdi_ii_16", "bdi_ii_17", "bdi_ii_18",
                              "bdi_ii_19", "bdi_ii_20", "bdi_ii_21")],
                       na.rm = FALSE)

# Row means 

df$vec <- rowMean(df[c("vec1", "vec2")], na.rm = FALSE)
