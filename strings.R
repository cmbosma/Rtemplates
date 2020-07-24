## Working With Strings


# addins
regexplain() # generates UI for creating and testing regular expressions. Has a dictionary of regular expressions. 

# Libraries
library(stringr) # look at cheatsheet for full use 
  browseURL("https://github.com/rstudio/cheatsheets/blob/master/strings.pdf")
library(rebus) # Package for an alternative way to implementing regular expressions

# Paste

paste() # sep default " " 
paste0() # sep default ""

# Stringr

str_c() # sep default ""
str_view() # shows in html the pattern you generated


## Regular expressions

# Alternation
  # matchat pattern a or b

# Character classes 
str_view(, pattern = char_class("Aa")) # looks for both upper and lowercase 
         
# Repetition 
  # patterns: optional, zero or more, one or more, between n and m times
    # regex: ?, *, +, {n}{m}
    # rebus: optional(), zero_or_more(), one_or_more(), repeated()

