## Cleaning data [in progress]

#----------------------------------------------------

## LIbraries

library(tidyverse)
library(dplyr) # if needed

## Explore data

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

## Tidying data
## -----------------------------------------------------------------------------

# Tidying variables and observations
gather(data, key, values, -vars) # change to long format
spread(data, key, value) # change to wide format 
separate() # separate values from one column into two
unite() # join values in two columns into one

# Cleaning format of variable names
names(data)
names(data) <- tolower(names(data)) # Change all variable names to lowercase
names(data) <- gsub(".", "_", names(data))   # replace "." with "_" in variable names (change based on variable names)

# renaming elements of vectors
names(df)[names(df) == 'old.var.name'] <- 'new.var.name'

# Remove a case and assign to new data frame
newdf <- olddf[!(olddf$var=="case_string"),]

# Revalueing/coding variables using 'plyr' package
df$var <- revalue(df$var, c("Male" = "1", "Female" = "2")
df$var <- mapvalues(df$var, from = c("M", "F"), to = c("1", "2"))

# If changing numbers, consider just using arithmetic 
df[, c("var1","var2)] - 1 # shift numbers down by one

# Reverse coding 
# Note: subtract columns from highest level + 1 (e.g., likert scale 1-4; subtract from 5)
# example
inlabdata[,c("camsr_2", "camsr_6", "camsr_7")] <- 5-inlabdata[,c("camsr_2", "camsr_6", "camsr_7")]


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

# Row SDs/Variance


library(matrixStats)

data <- data %>% 
  mutate(vas_neg_sd = rowSds(as.matrix(data[, c("VAS_neg_1_t1", "VAS_neg_2_t1", "VAS_neg_1_t2", "VAS_neg_2_t2",
                                                "VAS_neg_1_t3", "VAS_neg_2_t3", "VAS_neg_1_t4", "VAS_neg_2_t4",
                                                "VAS_neg_1_t5", "VAS_neg_2_t5", "VAS_neg_1_t6", "VAS_neg_2_t6",
                                                "VAS_neg_1_t7", "VAS_neg_2_t7", "VAS_neg_1_t8", "VAS_neg_2_t8",
                                                "VAS_neg_1_t9", "VAS_neg_2_t9", "VAS_neg_1_t10", "VAS_neg_2_t10", 
                                                "VAS_neg_1_t11", "VAS_neg_2_t11", "VAS_neg_1_t12", "VAS_neg_2_t12",
                                                "VAS_neg_1_t13", "VAS_neg_2_t13", "VAS_neg_1_t14", "VAS_neg_2_t14",
                                                "VAS_neg_1_t15", "VAS_neg_2_t15", "VAS_neg_1_t16", "VAS_neg_2_t16",
                                                "VAS_neg_1_t17", "VAS_neg_2_t17")]), na.rm = TRUE))

# Using Tidyverse (doesn't always work)

sad_vas_sd <- data %>%
  rowwise() %>%
  mutate(sad_vas_sd = sd(c(vas_1_1_1, vas_2_1_1, vas_3_1_1)), na.rm = TRUE) %>%
  select(sad_vas_sd) %>%
  glimpse()

