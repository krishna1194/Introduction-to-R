# The loop constructs are for, while and repeat, with the additional clauses break and next.

# For loop: used for iterating over a sequence (they iterate a defined number of times):
sequence <- seq(0,50,5)
#Note this will iterate 11 times, the number of elements in "sequence"
for(i in 1:length(sequence)){
  print(paste("Now at iteration", i, ", value of sequence is", sequence[i]))
  Sys.sleep(0.50)
}
# By default, R will iterate over all the elements in a vector without needing to designate a number
for(value in sequence){
  print(paste("Value of sequence is", value))
  Sys.sleep(0.50)
}
# With the break statement, we can stop the loop before it has looped through all the items:
for(i in 1:length(sequence)){
  if(i>5) break
  print(paste("Now at iteration", i, ", value of sequence is", sequence[i]))
  Sys.sleep(0.50)
}
# With the next statement, we can skip an iteration without terminating the loop:
for(i in 1:length(sequence)){
  if((i %% 2)!=0) next
  print(paste("Now at iteration", i, ", value of sequence is", sequence[i]))
  Sys.sleep(0.50)
}

# While loops: used to loop until a specific condition is met:
#Syntax: while (test_expression) {statement}
# test_expression is evaluated and the body of the loop is entered if the result is TRUE. The statements inside the loop 
# are executed and the flow returns to evaluate the test_expression again. This is repeated each time until 
# test_expression evaluates to FALSE, in which case, the loop exits.
#While loops - iterate so long as the condition is true 
#With while loops, it's important to set your starting conditions
continue <- TRUE 
i <- 0
while(continue==TRUE){
  i = i + 1 
  print(paste("At iteration", i, "continue still set to", continue))
  if(i>=5){
    continue <- FALSE
    print(paste("Iteration", i, "reached. Continue set to", continue))
    print(paste("While loop terminated upon reaching iteration", i))
  } 
  Sys.sleep(0.50)
}

# Repeat loop: used to iterate over a block of code multiple number of times. 
# There is no condition check in repeat loop to exit the loop. We must ourselves put a condition explicitly inside the
# body of the loop and use the break statement to exit the loop. Failing to do so will result into an infinite loop.
# Syntax:  repeat {statement}
x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}

# Nest loops of the same type or different types - for example, for every value of i it will do a loop of n:
continue <- TRUE 
i <- 0

while(continue==TRUE){
  i = i + 1 
  print(i)
  if(i>=5) continue <- FALSE
  
  for(n in 1:3){
    print(paste("The value of i is", i, ",and the value of n is", n))
    Sys.sleep(0.25)
  }
  
}



