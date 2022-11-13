# Variable Assignment
## Creating a variable
my_variable <- 10
my_variable

## A variable can be operated on 
my_variable + 1

## And passed to a function
sqrt(my_variable + 1)

## To reassign a variable, just reassign in
my_variable <- 3000

## You can also operate on and reassign a variable to itself 
my_variable <- my_variable + 1

result <- sqrt(9)

fruit_1 <- "apple"
fruit_2 <- "bananaa"
fruit_3 <- "cantaloupee"

# Finding Variables
## To know all the variables currently available in the workspace we use the ls() function: print(ls())
print(ls())

## List the variables starting with the pattern "var".
print(ls(pattern = "var"))

# Deleting Variables
## Variables can be deleted by using the rm() function.
my_variablee <- 5
rm(my_variablee)

## All the variables can be deleted by using the rm() and ls() function together:
rm(list = ls())