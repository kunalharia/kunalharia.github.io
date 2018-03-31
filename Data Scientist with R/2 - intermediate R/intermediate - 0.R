# comparison

# equality

# following statements all evaluate to TRUE
3 == (2 + 1)
"intermediate" != "r"
TRUE != FALSE
"Rchitect" != "rchitect" # R is case sensitive

# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6 * 14 != 17 - 101

# Comparison of character strings
"useR" == "user"

# Compare a logical with a numeric
TRUE == 1

# less than and greater than operators

# evaluate to FALSE
(1 + 2) > 4
"dog" < "Cats" # greater than relationship based on alphabetical order
TRUE <= FALSE

# Comparison of numerics
-6 * 5 +2 >= -10 +1

# Comparison of character strings
"raining" <= "raining dogs"

# Comparison of logicals
TRUE > FALSE # TRUE corresponds to 1 in R, and FALSE coerces to 0 behind the scenes

# Compare vectors

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook

linkedin > facebook

# Compare matrices

views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

# How often does facebook equal or exceed linkedin times two?
sum(facebook >= linkedin *2)

# logical operators

# evaluate to TRUE:

TRUE & TRUE
FALSE | TRUE
5 <= 5 & 2 < 3
3 < 4 | 7 < 6

# to check if x is between 3 and 7
# 3 < x < 7 will NOT work
# 3 < x & x < 7

last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last < 5 | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <= 20

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12 # at least means greater than or equal to

# When is views between 11 (exclusive) and 14 (inclusive)?
views > 11 & views <= 14

# conditonal statements

# if (condition) {
#   expr
# }

medium <- "LinkedIn" 
# information about the social website
num_views <- 14 
# actual number of views that particular medium
# had on the last day of your recordings

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

# Write the if statement for num_views
if (num_views > 15) {
  print("You're popular!")
}


# if (condition) {
#   expr1
# } else {   # same line as closing bracket of "if"
#   expr2
# }

if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}


if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}

# if (condition1) {
#   expr1
# } else if (condition2) { # "else if" on same line 
                           # as closing bracket of previous part
#   expr2
# } else if (condition3) {
#   expr3
# } else {
#   expr4
# }

if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}


if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}


# while (condition) { # condition should become FALSE 
                      # at some point 
                      # during the execution
#   expr
# }


# driver's assistant could
# give you different messages based on your speed 
# or provide you with a current speed at a given moment

# Initialize the speed variable
speed <- 64

# Code the while loop
while ( speed > 30 ) {
  
  print("Slow down!")
  
  speed <- speed - 7
  
}

speed

# Initialize the speed variable
speed <- 64

while (speed > 30) {
  print(paste("Your speed is",speed))
  if (speed > 48) { 
    print(paste("Slow down big time!"))
    speed <- speed - 11
  } else { print(paste("Slow down!"))
    speed <- speed - 6
  }
}

speed

# the break statement is a control statement

speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80 ) {
    print(paste("Your speed is", speed,"> 80; thus break"))
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}


# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(3*i)
  if ( (3*i) %% 8 == 0 ) {
    break # if the triple of i is divisible by 8
  }
  i <- i + 1
}



# Loop over a vector

primes <- c(2, 3, 5, 7, 11, 13)

# loop version 1
for (p in primes) {
  print(p)
}

# loop version 2
for (i in 1:length(primes)) {
  print(primes[i])
}

# Loop over a list

primes_list <- list(2, 3, 5, 7, 11, 13)

# loop version 1
for (p in primes_list) {
  print(p)
}

# loop version 2
for (i in 1:length(primes_list)) {
  print(primes_list[[i]]) 
                    # need double square brackets - [[ ]] 
                    # - to select the list elements 
}


# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (l in nyc) {
  print(l)
}

# Loop version 2
for (i in 1:length(nyc)) {
  print(nyc[[i]])
}


# create matrix: ttt

#      [,1] [,2] [,3]
# [1,] "O"  NA   "X" 
# [2,] NA   "O"  "O" 
# [3,] "X"  NA   "X"

row_1 <- c("O",  NA,   "X")
row_2 <- c(NA,   "O",  "O")
row_3 <- c("X",  NA,   "X")
ttt <- rbind(row_1, row_2, row_3)

# Loop over a matrix

for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row ", i, " and column ", j, " the board contains", ttt[i,j]))
  }
}


# use the if and else statements inside the for loop.

linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
  if (li > 10 ) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  print(li)
}

# The break statement 
# abandons the active loop: 
# the remaining code in the loop is skipped 
# and the loop is not iterated over anymore.

# The next statement 
# skips the remainder of the code in the loop, 
# but continues the iteration.

for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
  
  # Add if statement with next
  if (li < 5) {
    print("This is too embarrassing!")
    next
  }
}

# count the number of r's that come before the first u in rquote?

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == "r") {
    rcount <- rcount + 1
  }
  if (char == "u") {
    break
  }
  
}

# Print out rcount
rcount
  
