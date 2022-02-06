#### Preamble ####
# Purpose: Load data and normalize
# Author: Ray Wen
# Data: 6-Feb-2022
# Contact: ray.wen@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - Download the libraries needed


# Set seed for reproducibility
set.seed(1234)

install.packages("tidyverse")
install.packages("opendatatoronto")
install.packages("dplyr")
install.packages("ggcorrplot")
install.packages("kableExtra")
install.packages("gridExtra")

library(tidyverse)
library(opendatatoronto)
library(dplyr)
library(ggcorrplot)
library(kableExtra)
library(gridExtra)
# Load data from opendatatoronto

package <- show_package("498d16dd-31cf-4d68-8ba5-a9df131accc6") %>% list_package_resources()
package[1, ]

col_desc <- get_resource(package[1, ])[[1]]
table08 <- get_resource(package[1, ])[["RawDataRef-Period2008"]]
table11 <- get_resource(package[1, ])[["RawDataRef_2011"]]
head(table11)

# Delete unwanted variables
table11 <- table11 %>% select(-c("Neighbourhood Id", "Mid-Century Highrise Households", "Mid-Century Highrise Population"))

# normalize home prices and mid-century highrise population

table11$`Home Prices` <- (table11$`Home Prices` - mean(table11$`Home Prices`)) / sd(table11$`Home Prices`)

table11$`Social Housing Units` <- (table11$`Social Housing Units` - mean(table11$`Social Housing Units`)) / sd(table11$`Social Housing Units`)

table11$`Percent Mid-Century Highrise Population` <- (table11$`Percent Mid-Century Highrise Population` - mean(table11$`Percent Mid-Century Highrise Population`)) / sd(table11$`Percent Mid-Century Highrise Population`)

table11$`Rent Bank Applicants` <- (table11$`Rent Bank Applicants` - mean(table11$`Rent Bank Applicants`)) / sd(table11$`Rent Bank Applicants`)

table11$`Social Housing Waiting List` <- (table11$`Social Housing Waiting List` - mean(table11$`Social Housing Waiting List`)) / sd(table11$`Social Housing Waiting List`)



         