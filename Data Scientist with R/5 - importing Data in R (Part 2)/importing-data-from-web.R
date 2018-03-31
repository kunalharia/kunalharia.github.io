# Load the readr package
# library(readr)

# Import the csv file: pools
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"
pools <- read_csv(url_csv)
# utils functions = read.csv()

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/potatoes.txt"
potatoes <- read_tsv(url_delim)
# utils functions = read.delim()

# Print pools and potatoes
pools
potatoes

##############################################
# cat("\014") # clear screen before next section
##############################################


# https URL to the swimming_pools csv file.
url_csv <- "https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"

# Import the file using read.csv(): pools1
pools1 <- read.csv(url_csv)

# Load the readr package
library(readr)

# Import the file using read_csv(): pools2
pools2 <- read_csv(url_csv)

# Print the structure of pools1 and pools2
str(pools1)
str(pools2)

##############################################
# cat("\014") # clear screen before next section
##############################################

# downloading files

# Load the readxl and gdata package
library(readxl) # -- CAN NOT handle .xls files that are on the internet
library(gdata) # -- CAN handle .xls files that are on the internet

# Specification of url: url_xls
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/latitude.xls"

# Import the .xls file with gdata: excel_gdata
excel_gdata <- read.xls(url_xls)

# Download file behind URL, name it local_latitude.xls
download.file(url = url_xls, destfile = "local_latitude.xls")

# Import the local .xls file with readxl: excel_readxl
excel_readxl <- read_excel("local_latitude.xls")

##############################################
# cat("\014") # clear screen before next section
##############################################

# https URL to the wine RData file.
url_rdata <- "https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/wine.RData"

# Download the wine file to your working directory
download.file(url = url_rdata, destfile = "wine_local.RData") # in your working directory

# Load the wine data into your workspace using load()
load("wine_local.RData")

# Print out the summary of the wine data
summary(wine)

##############################################
# cat("\014") # clear screen before next section
##############################################

read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv")
# possible

download.file("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/latitude.xlsx", "lat.xlsx")
# possible

read_tsv("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/potatoes.txt")
# possible

load("https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/wine.RData")
# NOT possible
# You can't directly use a URL string inside load() to load remote RData files. 
# You should use url() or download the file first using download.file().

##############################################
# cat("\014") # clear screen before next section
##############################################

# Load the httr package
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp <- GET(url) # result is a response object
# easy access to:
# - status code
# - content-type 
# - actual content

# Print resp
resp

# Get the raw content of resp: raw_content
raw_content <- content(resp, as = "raw")
# as a raw object, 
# as a character vector, 
# or an R object, such as a list

# Print the head of raw_content
head(raw_content)

# The raw content of the response doesn't make a lot of sense, does it? 
# Luckily, the content() function by default, 
# if you don't specify the as argument, 
# figures out what type of data you're dealing with and parses it for you.

##############################################
# cat("\014") # clear screen before next section
##############################################

# Get the url
url <- "http://www.omdbapi.com/?apikey=ff21610b&t=Annie+Hall&y=&plot=short&r=json"
resp <- GET(url)

# Print resp
resp

# Print content of resp as text
content(resp, as = "text")

# Print content of resp
resp

content(resp)

# R figures out automatically that you're dealing with a JSON, 
# and converts the JSON to a named R list.
str(resp)


##############################################
# cat("\014") # clear screen before next section
##############################################

# Non HTTP...#################################

# Load the jsonlite package
library(jsonlite)

# wine_json is a JSON
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'

# Convert wine_json into a list: wine
wine <- fromJSON(wine_json)

# Print structure of wine
str(wine)

##############################################
# cat("\014") # clear screen before next section
##############################################

library(jsonlite)

# Quandl API, where you can fetch all sorts of financial and economical data.
# Definition of quandl_url
quandl_url <- "https://www.quandl.com/api/v3/datasets/WIKI/FB/data.json?auth_token=i83asDsiWUUyfoypkgMz"

# Import Quandl data: quandl_data
quandl_data <- fromJSON(quandl_url)

# Print structure of quandl_data
str(quandl_data)

##############################################
# cat("\014") # clear screen before next section
##############################################

# OMDb API

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)


# Print out the Title element of both lists
sw3$Title
sw4$Title

# Is the release year of sw4 later than sw3?
sw4$Year > sw3$Year

##############################################
# cat("\014") # clear screen before next section
##############################################

# JSON is built on two structures: objects and arrays. 

# jsonlite is already loaded




# Challenge 1
# Change the assignment of json1 
# such that the R vector after conversion contains the numbers 1 up to 6, 
# in ascending order
json1 <- '[1, 2, 4, 6]'
json1 <- '[1, 2, 3, 4, 5, 6]'
fromJSON(json1)

# Challenge 2
# converted to a named list with two elements: 
# a, containing the numbers 1, 2 and 3 
# and b, containing the numbers 4, 5 and 6
json2 <- '{"a": [1, 2, 3]}'
json2 <- '{"a": [1, 2, 3], "b": [4, 5, 6]}'
fromJSON(json2)


# Challenge 1
# Remove characters from json1 to build a 2 by 2 matrix containing only 1, 2, 3 and 4
json1 <- '[[1, 2], [3, 4], [5, 6]]'
json1 <- '[[1, 2], [3, 4]]'
fromJSON(json1)

# Challenge 2
# Add characters to json2 such that
# data frame in which the json is converted 
# contains an additional observation in the last row. 
# For this observations, a equals 5 and b equals 6
json2 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}]'
json2 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}, {"a": 5, "b": 6}]'
fromJSON(json2)

##############################################
# cat("\014") # clear screen before next section
##############################################

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/water.csv"

# Import the .csv file located at url_csv
water <- read.csv(url_csv, stringsAsFactors = FALSE)

# Convert the data file according to the requirements
water_json <- toJSON(water)

# Print out water_json
water_json # not easy to read

##############################################
# cat("\014") # clear screen before next section
##############################################


# # Mini - minified format JSON - toJSON() returns
# {"a":1,"b":2,"c":{"x":5,"y":6}}
# 
# # Pretty - pretty format with indentation, whitespace and new lines JSON
# {
#   "a": 1,
#   "b": 2,
#   "c": {
#     "x": 5,
#     "y": 6
#   }
# }


# Convert mtcars to a pretty JSON: pretty_json
pretty_json <- toJSON(mtcars, pretty = TRUE)

# Print pretty_json
pretty_json

# Minify pretty_json: mini_json
mini_json <- minify(pretty_json)

# Print mini_json
mini_json