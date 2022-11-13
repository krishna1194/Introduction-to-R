# A function is a set of statements organized together to perform a specific task.
# An R function is created by using the keyword function.
# Syntax: function_name <- function(arg_1, arg_2, arg_n) { Function_Body }

numbers <- seq(1:10)

calculator <- function(data, type){
  if(type=="mean"){
    value <- mean(data)
  } else if (type=="sum"){
    value <- sum(data) 
  } else if (type=="min"){
    value <- min(data) 
  } else {
    value <- "function not in calculator"
  }
  return(value)
}

calculator(numbers, "mean")
calculator(numbers, "sum")
calculator(numbers, "min")
calculator(numbers, "max")

# To provide a default in the parameters, use the equal sign:
calculator <- function(data, type='mean'){
  if(type=="mean"){
    value <- mean(data)
  } else if (type=="sum"){
    value <- sum(data) 
  } else if (type=="min"){
    value <- min(data) 
  } else {
    value <- "function not in calculator"
  }
  return(value)
}

calculator(numbers)

# Return multiple values, we need store them in a vector or list and return that object:
univariate_summary <- function(data){
  ntot <- length(data)
  mean <- mean(data)
  std <- sd(data)
  percentiles  <- quantile(data, probs=c(0, 0.25, 0.50, 0.75, 1))
  
  l1 <- list(n_obs=ntot, mean=mean, std=std, percentiles=percentiles)
  return(l1)
}

results <- univariate_summary(numbers)
results$percentiles
results$std
results
