# importing-data-in-r-part-2
# https://rpubs.com/potentialwjy/ImportDataIntoR05

# importing-data-from-databases

##############################################
# cat("\014") # clear screen before next section
##############################################

# import data from a SQL database

# Load the DBI package
# install.packages("RMySQL")
library(DBI)

# dbConnect() call to connect to the MySQL database
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

# you need different packages depending on the database you want to connect to

# dbConnect() = Connect to a DBMS going through the appropriate authorization procedure. 

# RMySQL::MySQL() = DBIdriver object = specifies how connections are made 
                                      # and how data is mapped 
                                      # between R and the database

# dbConnect() here produces an object of class MySQLConnection

##############################################
# cat("\014") # clear screen before next section
##############################################

con
# <MySQLConnection:0,2>

dbListTables(con) # outputs a character vector with the table names.

# Build a vector of table names: tables
tables <- dbListTables(con) 

# Display structure of tables
str(tables)

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import the users table from tweater: users
users <- dbReadTable(con, "users")

# Print users
users

##############################################
# cat("\014") # clear screen before next section
##############################################

# Get table names
table_names <- dbListTables(con)
# containing the names of all the tables in the database.

# Import all tables
tables <- lapply(table_names, dbReadTable, conn = con)

# Print out tables
tables

##############################################
# cat("\014") # clear screen before next section
##############################################

# see that the tweats table, for example, contains a column user_id. 

# issue with Rstudio?
# tables$tweats does not work
# so
# tables[[2]] = tables$tweats
tables[[2]]
colnames(tables[[2]])

# ids in the column refer to the users that have posted the tweat. 
# comments contain both a user_id and a tweat_id column. 
# i.e. which user posted a comment on which tweat.

# Q: 
# who posted the tweat on which somebody commented "awesome! thanks!" (comment 1012)?

tweat_id_required <- tables[[1]][,2][tables[[1]][,4] == "awesome! thanks!"]
tweat_id_required
tweat_id_required <- tables[[1]][,"tweat_id"][tables[[1]][,4] == "awesome! thanks!"]
tweat_id_required

user_id_required <- tables[[2]][,"user_id"][tables[[2]][,"id"] == tweat_id_required]
user_id_required

user_name <- tables[[3]][,"name"][tables[[3]][,"id"] == user_id_required]
user_name

# A:
# user with user_id 5, so Oliver.

##############################################
# cat("\014") # clear screen before next section
##############################################

con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "company", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

##############################################
# cat("\014") # clear screen before next section
##############################################

# Selective Importing

# SQL Queries from inside R: example 1

# import entire table
# then subset in R

employees <- dbReadTable(con, "employees")

subset(employees,
       subset = started_at > "2012-09-01",
       select = name)

# alternatively,

# send SQL to db
# SQL run on db
# only results imported
# i.e. more efficient

dbGetQuery(con, "SELECT name FROM employees
                    WHERE started_at > \"2012-09-01\"")

# virtual function from the DBI package
# but is actually implemented by the RMySQL package

##############################################
# cat("\014") # clear screen before next section
##############################################

# SQL Queries from inside R: example 2

products <- dbReadTable(con, "products")

subset(products, subset = contract == 1)

dbGetQuery(con, "SELECT * FROM products
                                 WHERE contract = 1")

##############################################
# cat("\014") # clear screen before next section
##############################################

con <- dbConnect(RMySQL::MySQL(),
                 dbname = "tweater",
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                 port = 3306,
                 user = "student",
                 password = "datacamp")

# Import tweat_id column of comments where user_id is 1: elisabeth
elisabeth <- dbGetQuery(con, "SELECT tweat_id FROM comments
                                 WHERE user_id = 1")

# Print elisabeth
elisabeth

##############################################
# cat("\014") # clear screen before next section
##############################################

# Import post column of tweats where date is higher than '2015-09-21': latest
latest <- dbGetQuery(con, "SELECT post FROM tweats
                                 WHERE date > \"2015-09-21\"")

# Print latest
latest

##############################################
# cat("\014") # clear screen before next section
##############################################

# Create an R data frame, specific, 
# that selects the message column 
# from the comments table 
# where the tweat_id is 77 
# and the user_id is greater than 4.
specific <- dbGetQuery(con, "SELECT message FROM comments
                                 WHERE tweat_id = 77 AND user_id > 4")

# Print specific
specific

##############################################
# cat("\014") # clear screen before next section
##############################################

# Create a data frame, short, 
# that selects the id and name columns 
# from the users table 
# where the number of characters in the name is strictly less than 5.
short <- dbGetQuery(con, "SELECT id, name FROM users
                                 WHERE CHAR_lENGTH(name) < 5")

# Print short
short

##############################################
# cat("\014") # clear screen before next section
##############################################

question <- dbGetQuery(con, "SELECT post, message
                             FROM tweats INNER JOIN comments on tweats.id = tweat_id
                             WHERE tweat_id = 77")

# answer
question

##############################################
# cat("\014") # clear screen before next section
##############################################

# DBI Internals

# dbGetQuery()
# Behind the scenes, the following steps are performed:
# Sending the specified query with dbSendQuery();
# Fetching the result of executing the query on the database with dbFetch();
# Clearing the result with dbClearResult().

# Send query to the database
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")

dbGetInfo(res) 

    # $statement
    # [1] "SELECT * FROM comments WHERE user_id > 4"
    # 
    # $isSelect
    # [1] 1
    # 
    # $rowsAffected
    # [1] -1
    # 
    # $rowCount
    # [1] 0
    # 
    # $completed
    # [1] 0
    # 
    # $fieldDescription
    # $fieldDescription[[1]]
    # NULL


# Use dbFetch() twice
dbFetch(res, n = 2) # import only two records of the query result
dbFetch(res) # import all remaining queries (don't specify n).

# Clear res
dbClearResult(res)

##############################################
# cat("\014") # clear screen before next section
##############################################

# Create the data frame  long_tweats
# selects the post and date columns
# from the observations in tweats 
# where the character length of the post variable exceeds 40.
long_tweats <- dbGetQuery(con, "SELECT post, date FROM tweats
                                 WHERE CHAR_lENGTH(post) > 40")

  
  
# Print long_tweats
print(long_tweats)

# Disconnect from the database
dbDisconnect(con)