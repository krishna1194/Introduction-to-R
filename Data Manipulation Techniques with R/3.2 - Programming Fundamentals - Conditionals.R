# Conditionals include if, else, ifelse.
#Syntax: if (test_expression) {statement}
#Syntax: if (test_expression) {statement} else {statement2}
#Syntax: ifelse(test_expression, yes, no)

# If the test_expression is TRUE, the statement gets executed. But if it is FALSE, nothing happens.
x <- 5
if(x > 0){
  print("Positive number")
}
# If we execute ONLY ONE Single statement after the condition:
x <- 5
if(x > 0) print("Positive number")

#If-Else
x <- -5
if(x > 0){
  print("Non-negative number")
} else {
  print("Negative number")
}

#Or operator "|"
#And operator "&"
mean_values <- 3.1
std_dev_values <- 1.95
if (mean_values>=0 & std_dev_values>=1) {
  print(paste("The mean", mean_values, "is above 0, and the standard deviation", std_dev_values, "is above 1"))
}

std_dev_vector <- c(1.2,0.8,0.3,2.4)
ifelse(std_dev_vector>=1, "above one", "below one")


