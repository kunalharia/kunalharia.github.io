# Consult the documentation on the mean() function
# redirected to www.rdocumentation.org
help(mean)
?mean
# Inspect the arguments of the mean() function
args(mean)

# use a function: mean()

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(x=linkedin) # match argument by name
avg_fb <- mean(facebook) # match arguments by position

# Inspect avg_li and avg_fb
avg_li
avg_fb


# Usage of 'Default S3 method' 
# mean(x, trim = 0, na.rm = FALSE, ...)
                                 # ... = ellipsis

# Calculate the mean of the sum
avg_sum <- mean((linkedin + facebook))

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean((linkedin + facebook), trim = 0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed


# na.rm = whether or not to remove missing values

linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)

# Functions inside functions

# Mean Absolute Deviation
mean(abs(linkedin-facebook), na.rm=TRUE)


# Write your own function
# 
# my_fun <- function(arg1, arg2) {
#   body
# }

# assignment operator (<-) 
# as if you were assigning a vector to a variable 
# Creating a function in R
# = 
# assignment of a function object to a variable

# Create a function pow_two()
pow_two <- function(x) {
  x^2
}

pow_two(12) # Use the function

# Create a function sum_abs()
sum_abs <- function(x,y) {
  abs(x)+abs(y)
}

sum_abs(-2,3) # Use the function

# function does not require an input

throw_die <- function() {
  number <- sample(1:6, size = 1)
  number
}

throw_die()

hello <- function() {
  print("Hi there!")
  TRUE
}

hello()


# define default argument values in your own R functions

pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if (print_info == TRUE) {
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

pow_two(2)
pow_two(2,print_info = FALSE)


# Function scoping

pow_two <- function(x) {
  y <- x ^ 2
  return(y)
}

pow_two(4)

y 
# y was defined inside the pow_two() function 
# it is not accessible outside of that function
# Error: object 'y' not found

# R passes arguments by value.
# R function cannot change the variable that you input to that function

triple <- function(x) {
  x <- 3*x # argument x gets overwritten with its value times three
  x        # new x is returned
}
a <- 5
triple(a)
a

# If R were to pass "a" to triple() "by reference"
# the override of the x inside the function
# would ripple through to the variable a, outside the function




# write a function that can interpret a single value of this vector

interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    num_views
  } else {
    print("Try to be more visible!")
    0
  }
}

# without NAs
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])


# interpret all the data from your daily profile views inside a vector
# Define the interpret_all() function
#   views: vector with data to interpret
#   return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum = TRUE) {
  count <- 0
  
  for (v in views) {
    count <- count + interpret(v)
                     # interpret(v) 
                     # returns v for popular days, and 0 otherwise
                     # & 
                     # interpret(v) 
                     # will also do some printouts
  }
  
  if (return_sum) {
    count
  } else {
    NULL
  }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)