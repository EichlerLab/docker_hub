#! /bin/env R

#install.packages("devtools")
#library(devtools)
#devtools::install_github("daewoooo/SVbyEye", branch="master")

install.packages("remotes", lib="/usr/local/lib/R/site-library")
library(remotes)
remotes::install_github("daewoooo/SVbyEye", lib="/usr/local/lib/R/site-library")

