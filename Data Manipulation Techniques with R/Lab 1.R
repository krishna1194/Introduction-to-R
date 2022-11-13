#1 What does the log() function do?

#2 Is the default calculation natural log or base 10?

#3 What are the arguments for the log() function?

#4 What is the log of 1.4, base 8.3?

#5 Assign the result of question 4 to the variable "result"

#6 Assign the variable "result" to "result" rounded to thousandths What is the value?
# To the thousands means digits = 4

#7 What is the value of "result" mod 0.05?

#8 Assign the value 5 to the variable "value"

#9 What is "value" divided by "result"?

#10 What is the ceiling of "value" divided by "result", divided by the floor of "value" divided by "result"? 
#Follow the order of operations:
#ceiling of value divided by result
#divided by
#floor of value divided by result

# Answers: 
#1 help(log)  - computes logarithms
#2 natural log
#3 x - a numeric or complex vector, base - the base with respect to which logartihms are computed
#4 log(1.4, 8.3) = 0.1589941
#5 result <- log(1.4,8.3)
#6 result <- round(result,4) = 0.159
#7 result %% 0.05 = 0.009
#8 value <- 5
#9 value / result = 31.44654
#10 ceiling(value/result)/floor(value/result) = 1.032258
