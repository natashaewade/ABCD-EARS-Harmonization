# Needs the following R packages to be installed:
# - dplyr
# - stringr
# - readr
library(dplyr)
library(stringr)
library(readr)
#   ____________________________________________________________________________
#   setup                                                                   ####

# load functions (file has to be in the working directory)
source("ears-and-ios-categ-functions.R")

setwd("C:/Users/natas/Dropbox/Manuscripts/EARS Methods/JanoschHarmonization/")

# read in `nt_y_ears` table (csv file has to be in the working directory)
data <- readr::read_csv("nt_y_ears.csv")


#   ____________________________________________________________________________
#   examples                                                                ####

# Setting options:
# outcome = c("min", "key", "ses"),
# day     = c("all", "wkd", "wke"),
# score   = c("sum", "avg"),
# return  = c("all", "selected", "new")

# using standard settings:
# - aggregation type: sum of minutes for all days
# - return: new columns appended to complete data frame
data<-data |> 
  combine_app_categ()

#To put in data.frame, assign to an object
data_modified<-data |> 
  combine_app_categ()


# using the settings:
# - aggregation type: average of screentime minutes ##Tasha struggling to do 8/16
# - return: new columns appended to complete data frame
test<-data |> 
  combine_app_categ(
    outcome = "min",
    day     = "all",
    score   = "avg",
    return  = "all"
  )

# using the settings:
# - aggregation type: sum of keystrokes for weekend days
# - return: new columns appended to selected columns for aggregation type
mod<-data |> 
  combine_app_categ(
    outcome = "key",
    day     = "wke",
    return  = "selected"
  )

# using the settings:
# - aggregation type: average sessions for weekdays
# - return: only new columns
data |> 
  combine_app_categ(
    outcome = "ses",
    score   = "avg",
    day     = "wkd",
    return  = "new"
  )



