# lapply(X, FUN, ...)
# takes a vector or list X
# applies the function FUN to each of its members

# If "FUN" requires additional arguments, 
# you pass them after you've specified "X" and "FUN (...)"
# output = list
#          same length as X, 
#          where each element = result of 
#                               applying FUN 
#                               on the corresponding element of X.

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)


# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
  x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)

names
years


# defining functions to use them only once = overkill

# lapply and anonymous functions

# Named function
triple <- function(x) { 3 * x }

# Anonymous function with same implementation
function(x) { 3 * x }

# Use anonymous function inside lapply()
lapply(list(1,2,3), function(x) { 3 * x })

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(k) {k[1]})

# Transform: use anonymous function inside lapply
years <- lapply(split_low, function(k) {k[2]})

names
years

# lapply with additional arguments

multiply <- function(x, factor) {
  x * factor
}
lapply(list(1,2,3), multiply, factor = 3)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low,select_el,1)
years <- lapply(split_low,select_el,2)

names
years



# sapply(X, FUN, ...)
# simplifies the list that lapply() would return 
# by turning it into a vector

temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2), 
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

# self-written function
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)

# what if the function 
# you're applying over a list or a vector
# returns a vector of length greater than 1? 
# function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)

# sapply can't simplify, now what?

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)
freezing_s
# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)
freezing_l
# Are freezing_s and freezing_l identical?
# freezing_s == freezing_l
identical(freezing_s,freezing_l)

# sapply with functions that return NULL

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp, print_info)

# Apply print_info() over temp using lapply()
lapply(temp, print_info)

identical(sapply(temp, print_info),lapply(temp, print_info))
# 'vector-version' of a list of NULL's 
# would simply be a NULL, 
# which is no longer a vector 
# with the same length as the input.


# vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)

# FUN.VALUE argument expects a template 
# for the return argument of FUN
# USE.NAMES => generate a named array (if possible)

# i.e. restrict the output of the function
# i.e. more robust version of sapply()

# Definition of basics()
# takes a vector, and returns a named vector of length 3
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, numeric(3))

# structure of the output of FUN
# does not correspond to the template you specify in FUN.VALUE
# vapply() will throw an error 
#                        misalignment between expected and actual output

basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# error, because FUN(X[[1]]) result is length 4
vapply(temp, basics, numeric(3)) # => values must be length 3

# fixed
vapply(temp, basics, numeric(4))


# add robustness

# Convert from sapply to vapply() expression
sapply(temp, max)
vapply(temp, max, numeric(1))

# Convert from sapply to vapply() expression
sapply(temp, function(x, y) { mean(x) > y }, y = 5)
vapply(temp, function(x, y) { mean(x) > y }, y = 5, logical(1))
