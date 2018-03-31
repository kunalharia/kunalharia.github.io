# An addition
5 + 5 # 10
# A subtraction
5 - 5 # 0
# A multiplication
3 * 5 # 15
# A division
(5 + 5) / 2 # 5
# Exponentiation
2^5 # 32
# Modulo
28%%6 # 4

# Assign the value 42
x <- 42
x
y = 42
y

# c()
# combine
# place the vector elements separated by a comma between the parenthese
numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE,FALSE, TRUE)

# names()
# give a name to the elements of a vector

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Assign days as names of poker_vector
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")


# sum two vectors in R => it takes the element-wise sum
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)
total_vector <- A_vector+B_vector
total_vector

# Vector selection
poker_midweek <- poker_vector[c(2,3,4)]
poker_midweek
poker_midweek <- poker_vector[2:4]
poker_midweek
poker_start <- poker_vector[c("Monday","Tuesday","Wednesday")]
poker_start

# Selection by comparison

# (logical) comparison operators known to R are:
# < for less than
# > for greater than
# <= for less than or equal to
# >= for greater than or equal to
# == for equal to each other
# != not equal to each other

# comparison operators on vectors
c(4, 5, 6) > 5

# Which days did you make money on poker?
selection_vector <- poker_vector>0
selection_vector
poker_winning_days <- poker_vector[selection_vector]
poker_winning_days

# matrix is a collection 
# of elements of the same data type (numeric, character, or logical) 
# arranged into a fixed number of rows and columns
matrix(1:9, byrow = TRUE, nrow = 3)

# rownames(my_matrix) <- row_names_vector
# colnames(my_matrix) <- col_names_vector
# rowSums(matrix) = totals for each row of a matrix
# cbind() = merges matrices and/or vectors together by column
# rbind()

# selecting
# my_matrix[,1] selects all elements of the first column.
# my_matrix[1,] selects all elements of the first row.

# element-wise arithmetic with matrices
# 2 * my_matrix multiplies each element of my_matrix by two.
2 * matrix(1:9, byrow = TRUE, nrow = 3)
# e.g. my_matrix1 * my_matrix2 
# creates a matrix where each element 
# is the product of the corresponding elements in my_matrix1 and my_matrix2

# NB: standard matrix multiplication =>  %*%

# factor = statistical data type used to store categorical variables
# NB: categorical variable can belong to a limited number of categories

sex_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_sex_vector <- factor(sex_vector)
# 'factor levels' = "Male" and "Female"
factor_sex_vector

# two types of categorical variables: 
# nominal categorical variable (without an implied order)
# ordinal categorical variable

# Animals
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector

# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

# change the names of these levels (for clarity)

survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
factor_survey_vector
levels(factor_survey_vector)
# note the order => specify the levels of the factor
levels(factor_survey_vector) <- c("Female", "Male")
factor_survey_vector

# quick overview of the contents of a variable
summary(survey_vector)
summary(factor_survey_vector)

# data frame
# variables = columns
# observations = rows
# data sets that contain different data types (instead of only one)

# develop a clear understanding of its structure and main elements
# show only a small part of the entire data set
head(mtcars)
str(mtcars)

# every column has the same length, 
# vectors you pass should also have the same length

# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
# The type of planet (Terrestrial or Gas Giant).
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
# The planet's diameter relative to the diameter of the Earth.
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
# The planet's rotation across the sun relative to that of the Earth.
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
# If the planet has rings or not (TRUE or FALSE).
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

# 8 observations and 5 variables?
str(planets_df)

# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]

# select the first three elements of the type column
planets_df[1:3,2] # need to know / lookup the col number
planets_df[1:3,"type"]

# Select first 5 values of diameter column
planets_df$diameter[1:5]

# select all elements of the variable diameter
planets_df[,3]
planets_df[,"diameter"]
planets_df$diameter
rings_vector <- planets_df$rings
rings_vector
# use rings_vector to select the data for the four planets with rings
# select all columns for planets with rings
planets_df[rings_vector,]
subset(planets_df, subset = rings)

# Select planets with diameter < 1
planets_df[planets_df$diameter < 1,]
subset(planets_df, diameter < 1)

# sorting

a <- c(100, 10, 1000)
order(a) # ranked position of each element
a[order(a)]
sort(a)

positions <-  order(planets_df$diameter)
planets_df[positions,]

# Vectors (one dimensional array): 
# can hold numeric, character or logical values. 
# The elements in a vector all have the same data type.

# Matrices (two dimensional array): 
# can hold numeric, character or logical values. 
# The elements in a matrix all have the same data type.

# Data frames (two-dimensional objects): 
# can hold numeric, character or logical values. 
# Within a column all elements have the same data type, 
# but different columns can be of different data type.

# list = variety of objects
# list()
# arguments to the list function are the list components
# components can be matrices, vectors, other lists, etc

my_vector <- 1:10 
my_matrix <- matrix(1:9, ncol = 3)
my_df <- mtcars[1:10,]
# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)
            # you want to avoid not knowing 
            # or remembering 
            # what the components of your list stand for
            # names(my_list) <- c("name1", "name2")
my_list

# to "grab" the first component of list
# shining_list[[1]]
# shining_list[["reviews"]]
# shining_list$reviews
# shining_list[[2]][1]

# add to a list
# ext_list <- c(my_list, my_name = my_val)
