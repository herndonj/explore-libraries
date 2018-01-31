#' Which libraries does R search for packages?
#base R libraries are here
.Library
library(fs)
path_real(.Library) #show me the true path to the directory
#first reponse is where R looks first and where packages are installed
.libPaths()
# try .libPaths(), .Library


#' Installed packages

## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
## remember to use View() or similar to inspect
library(tidyverse)
my_packages <- installed.packages()
my_packages.df <- as.data.frame(my_packages)
my_packages.tb <- as_tibble(my_packages)
## how many packages?
220

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
##   * what proportion need compilation?
##   * how break down re: version of R they were built on
table(my_packages.df$LibPath) #29 preinstalled, 191 installed by me
table(my_packages.df$Priority) # What is the priority? (14 base and 16 recommended)
table(my_packages.df$NeedsCompilation)
my_packages.tb %>%  count(NeedsCompilation) %>% mutate(prop = n/sum(n))
table(my_packages.df$Version) # fairly broad range, but 3.4.1 is where most are found

## for tidyverts, here are some useful patterns
# data %>% count(var)
# data %>% count(var1, var2)
# data %>% count(var) %>% mutate(prop = n / sum(n))

#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
installed.packages(fields="Version")
