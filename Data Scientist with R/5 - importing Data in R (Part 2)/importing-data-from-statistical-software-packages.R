# import data from three software packages: SAS, STATA and SPSS.
#
# SAS: read_sas()
# STATA: read_dta() (or read_stata(), which are identical)
# SPSS: read_sav() or read_por(), depending on the file type.
url = "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/sales.sas7bdat"

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import sales.sas7bdat: sales
sales <- read_sas(url)

# Display the structure of sales
str(sales)

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import the data from the URL: sugar
# data on yearly import and export numbers of sugar, both in USD and in weight. 
url = "http://assets.datacamp.com/production/course_1478/datasets/trade.dta"
sugar <- read_dta(url)

# Structure of sugar
# The Date column has class labelled.
str(sugar)

# Convert values in Date column to dates
sugar$Date <- as.Date(as_factor(sugar$Date))

# Structure of sugar again
str(sugar)

# corr = +ve
plot(sugar$Import, sugar$Weight_I)
# more sugar is traded, the higher the weight that's traded

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import SPSS data with haven
library(haven)

# read_sav() - for .sav files 
# read_por() - for .por files

# data on four of the Big Five personality traits for 434 persons 
# (Source: University of Bath). 
# http://staff.bath.ac.uk/pssiw/stats2/page16/page16.html
# http://staff.bath.ac.uk/pssiw/stats2/personality.sav
# Big Five is a psychological concept including, originally, 
# five dimensions of personality to classify human personality. 
# SPSS dataset is called person.sav
# http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/person.sav

# Import person.sav: traits
url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/person.sav"
traits <- read_sav(url)

# Summarize traits
summary(traits) # shows how many NAs are contained in each variable

# Print out a subset
# individuals that scored high on Extroversion and on Agreeableness, 
# i.e. scoring higher than 40 on each of these two categories
subset(traits, Extroversion > 40 & Agreeableness > 40)

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import SPSS data from the URL: work
work <- read_sav("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/employee.sav")
# information on employees and their demographic and economic attributes
# QRiE: http://cehd.gmu.edu/book/dimitrov/spss

# Display summary of work$GENDER
summary(work$GENDER)


# Convert work$GENDER to a factor
# factor = class to denote categorical variables in R
work$GENDER <- as_factor(work$GENDER)

# Display summary of work$GENDER again
summary(work$GENDER)

##############################################
# cat("\014") # clear screen before next section
##############################################

library(foreign)

# http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/florida.dta
# Source: Florida Department of State)
# http://results.elections.myflorida.com/
# US presidential elections in the year 2000
# total numbers of votes for each of the four candidates
# total number of votes per election area in the state of Florida

# Import florida.dta and name the resulting data frame florida
"florida.dta" <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/florida.dta"
# florida <- read.dta("florida.dta")
florida.dta <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/florida.dta"
florida <- read.dta(florida.dta)

# Check tail() of florida
tail(florida)

typeof(florida)

##############################################
# cat("\014") # clear screen before next section
##############################################

# socio-economic measures and access to education for different individuals
# http://datatopics.worldbank.org/Gender/topic/education
setwd("D:/DATA/Hunt/CV/Data Science/datacamp/Data Scientist with R/5 - importing Data in R (Part 2)")
dir.create("worldbank")

# with the following (i.e. without mode = "wb")
# 
# download.file(url = "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/edequality.dta",
#               destfile = "worldbank/edequality.dta")
#               
# read.dta(path)
# returned the following error:
# Error in read.dta(path) : a binary read error occurred
# probably due to translated newlines
# mode "wb" = binary

download.file(url = "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/edequality.dta",
              destfile = "worldbank/edequality.dta",
              mode = "wb")

# Specify the file path using file.path(): path
path <- file.path("worldbank","edequality.dta")

# Create and print structure of edu_equal_1
edu_equal_1 <- read.dta(path)
str(edu_equal_1)

# Create and print structure of edu_equal_2
edu_equal_2 <- read.dta(path, convert.factors = FALSE)
str(edu_equal_2)

# Create and print structure of edu_equal_3
edu_equal_3 <- read.dta(path, convert.underscore = TRUE)
str(edu_equal_3)


# can see
# age is an integer
# literate is a factor, with the levels "yes" and "no". 
str(edu_equal_1)

# how many observations (e.g. how many people) have an age higher than 40
# and are literate?
nrow(subset(edu_equal_1, age > 40 & literate == "yes"))

# how many observations/individuals 
# from Bulgaria 
# have an income above 1000?
nrow(subset(edu_equal_1, income > 1000 & ethnicity_head == "Bulgaria"))  
  
##############################################
# cat("\014") # clear screen before next section
##############################################

# socio-economic variables from different countries
# Source: Quantative Data Analysis in Education
# http://cw.routledge.com/textbooks/9780415372985/resources/datasets.asp
# http://cw.routledge.com/textbooks/9780415372985/sav/international.sav
list.files()
download.file(
  "http://cw.routledge.com/textbooks/9780415372985/sav/international.sav", 
  destfile = "international.sav")
list.files()
download.file(
  url = "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/international.sav",
  destfile = "international.sav")
list.files()

# Import international.sav as a data frame: demo
demo <- read.spss("international.sav", to.data.frame = TRUE)

# Create boxplot of gdp variable of demo
boxplot(demo$gdp)

##############################################
# cat("\014") # clear screen before next section
##############################################

# Pearson's Correlation
# 
# measurement to evaluate the linear dependency between two variables, say X and Y.
# It can range from -1 to 1; 
# if it's close to 1
# it means that there is a strong positive association between the variables. 
# If X is high, also Y tends to be high.
# If it's close to -1, there is a strong negative association: 
# If X is high, Y tends to be low. 
# When the Pearson correlation between two variables is 0, 
# these variables are possibly independent: 
# there is no association between X and Y.
# 
# What is the correlation coefficient 
# for the two numerical variables 
# gdp and f_illit (female illiteracy rate)?
cor(demo$gdp, demo$f_illit)
# That indicates a negative association among GDP and female illiteracy

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import international.sav as demo_1
demo_1 <- read.spss("international.sav", to.data.frame = TRUE)

# Print out the head of demo_1
head(demo_1)

# Import international.sav as demo_2
# variables with value labels are NOT converted to R factors
demo_2 <- read.spss("international.sav", to.data.frame = TRUE, use.value.labels = FALSE)

# Print out the head of demo_2
head(demo_2)