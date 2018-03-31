# Mathematical utilities

# abs(): Calculate the absolute value.
# sum(): Calculate the sum of all the values in a data structure.
# mean(): Calculate the arithmetic mean.
# round(): Round the values to 0 decimal places by default. Try out ?round in the console for variations of round() and ways to change the number of digits to round to.

# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))

# find an error

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

# Error: 'trim' must be numeric of length one
mean(abs(vec1), abs(vec2))

# wrong answer
mean(sum(abs(vec1), abs(vec2)))

# fixed
mean(c(abs(vec1), abs(vec2)))

# Data Utilities

# seq(): Generate sequences, arguments: from, to, by
# rep(): Replicate elements of vectors and lists.
# sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
# rev(): Reverse the elements in a data structures for which reversal is defined.
# str(): Display the structure of any R object.
# append(): Merge vectors or lists.
# is.*(): Check for the class of an R object.
# as.*(): Convert an R object from one class to another.
# unlist(): Flatten (possibly embedded) lists to produce a vector.

linkedin <- list(16, 9, 13, 5, 2, 17, 14)
linkedin

facebook <- list(17, 7, 5, 16, 8, 13, 14)
facebook

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
li_vec

li_vec2 <- as.vector(linkedin)
li_vec2

fb_vec <- unlist(facebook)
fb_vec

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)
social_vec

# Sort social_vec
sort(social_vec, decreasing = TRUE)

# seq(rep(1, 7, by = 2), times = 7)
# Error: 'from' must be of length 1

#    seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
#    length.out = NULL, along.with = NULL, .)
#    from, to = starting and (maximal) end values of the sequence
#    Of length 1 unless just from is supplied as an unnamed argument.

# fixed error
rep(seq(1, 7, by = 2), times = 7)


# Create first sequence: seq1
# sequence that ranges from 1 to 500 in increments of 3
seq1 <- seq(1,500,3)

# Create second sequence: seq2
# ranges from 1200 to 900 in increments of -7
seq2 <- seq(1200,900,-7)

# Calculate total sum of the sequences
# # using the sum() function twice and adding the two results
sum(seq1) + sum(seq2)
# # by first concatenating the sequences and then using the sum() function once.
sum(c(seq1,seq2))


# regular expressions can be used to see whether 
# a pattern = "reg exp"
# exists inside 
# the x argument
# a character string 
# or a vector of character strings

# vector
emails <- c("john.doe@ivyleague.edu", "education@world.gov", 
            "dalai.lama@peace.org", "invalid.edu", 
            "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# grepl() 
# to match for "edu"
# returns TRUE when a pattern is found
# in the corresponding character string.
grepl("edu", emails)

# grep()
# to match for "edu"
# returns a vector of indices 
# of the character strings 
# that contains the pattern
hits <- grep("edu", emails)
hits

# select from the emails vector 
# only the emails that contain "edu".
# i.e. Subset emails using hits
emails[hits]


# caret, ^, or, dollar sign, $ 
# to match the content located in
# the start and end of a string, respectively

# make the pattern more robust

# email must contain: "@"
# ".*" matches any character (.) zero or more times (*)
# "." & "*" = metacharacters
# match any character between "@" and ".edu"
# "\\.edu$" => match ".edu" 
# "\\" => escapes the dot
#         tells R that you want to use "." as an actual character

# grepl()
# to match for .edu addresses more robustly
#      @*\\.edu - wrong
grepl("@.*\\.edu$", emails)

# grep()
# to match for .edu addresses more robustly
hits <- grep("@.*\\.edu$", emails)
# vector of indices
hits

# Subset emails vector using hits
emails[hits]

# sub()
# replacement argument
# marketing stunt: 
# owners of the .edu email addresses 
# offered a new email address on the datacamp.edu domain?
sub("@.*\\.edu$","@datacamp.edu", emails)
# sub(pattern, replacement, x,
# sub() only replaces the first match
# gsub() replaces all matches
# here only be one match per character string



# Time and Date

# dates are represented by Date objects
# # number of days since the 1st of January in 1970
# times are represented by POSIXct objects
# # number of seconds since the 1st of January in 1970

## DATE

# current date
today <- Sys.Date()
today

# See what today looks like under the hood
unclass(today)

# current time
now <- Sys.time()
now

# See what now looks like under the hood
unclass(now)

# 13 January, 1982

# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)

as.Date("1982-01-13") # default formats "%Y-%m-%d" or "%Y/%m/%d"
as.Date("Jan-13-82", format = "%b-%d-%y")
as.Date("13 January, 1982", format = "%d %B, %Y")

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates
# character string has to obey 
#                     a format
#                     defined using a set of symbols
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
# select the weekday
format(date1, "%A")
# select the day of the month
format(date2, "%d")
# select the abbreviated month and the 4-digit year, separated by a space
format(date3, "%b %Y") 
# J4J
format(Sys.Date(), format = "Today is a %A!")

## TIME

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# as.POSIXct() 
# to convert from a character string to a POSIXct object
# default format = %Y-%m-%d %H:%M:%S
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2, format = "%Y-%m-%d %T")

# format() 
# to convert from a POSIXct object to a character string
# string containing only the minutes
format(time1,"%M")
# extract the hours and minutes as "hours:minutes AM/PM"
format(time2,"%I:%M %p")


# strptime
# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator

# Calculations with Dates
today <- Sys.Date()
today
today + 1
today - 1
as.Date("2018-02-22") - as.Date("2018-01-01")

day1 <- as.Date("2018-03-08")
day2 <- as.Date("2018-03-10")
day3 <- as.Date("2018-03-15")
day4 <- as.Date("2018-03-21")
day5 <- as.Date("2018-03-26")

# number of days that passed between 
# last and the first day you ate pizza
# i.e. Difference between last and first pizza day
day5 - day1

pizza <- c(day1, day2, day3, day4, day5)

# to control your eating habits, 
# you decided to write down 
# dates of the last five days that you ate pizza.

# calculate the differences between consecutive pizza days
day_diff <- diff(pizza)
day_diff

# average period between two consecutive pizza days
mean(day_diff)

# Calculations with Times

now <- Sys.time()
now + 3600          # add an hour
now - 3600 * 24     # subtract a day

birth <- as.POSIXct("1879-03-14 14:37:23")
death <- as.POSIXct("1955-04-18 03:47:12")
einstein <- death - birth
einstein

time1 <- as.POSIXct("2018-03-12 10:18:04 UTC")
time2 <- as.POSIXct("2018-03-17 09:14:18 UTC")
time3 <- as.POSIXct("2018-03-17 12:21:51 UTC")
time4 <- as.POSIXct("2018-03-17 12:37:24 UTC")
time5 <- as.POSIXct("2018-03-19 21:37:55 UTC")
login <- c(time1, time2, time3, time4, time5)

time1 <- as.POSIXct("2018-03-12 10:56:29 UTC")
time2 <- as.POSIXct("2018-03-17 09:14:52 UTC")
time3 <- as.POSIXct("2018-03-17 12:35:48 UTC")
time4 <- as.POSIXct("2018-03-17 13:17:22 UTC")
time5 <- as.POSIXct("2018-03-19 22:08:47 UTC")
logout <- c(time1, time2, time3, time4, time5)

login
logout

# Calculate the difference between login and logout
# i.e. time the user was online in each independent session
time_online <- logout-login

# Inspect the variable time_online
str(time_online)
time_online

# total time that the user was online
sum(time_online)

# average time the user was online
mean(time_online)