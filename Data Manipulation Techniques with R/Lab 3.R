#1. Set the seed to 1. Paste the correct code statement in the box below.
set.seed(1)

#2 & 3.
# Create a variable "pop_truth" that is 100,000 samples from an exponential distribution with rate 2. 
#       What function is used to draw a random sample from an exponential distribution?
# What is the mean of "pop_truth", rounded to two decimals?
pop_truth <- rexp(100000, 2)  # There is also: pexp, dexp, qexp
round(mean(pop_truth),2)

#4. Create a variable "sample_pop" that is a random sample of 5,000 values from "pop_truth". Before running your code, 
# set the seed to 1 again. Note, the seed needs to be set each time you call a function with a random component. 
set.seed(1)
sample_pop <- sample(pop_truth,5000)
sample_pop

#5. Create function, "sample_stats" that calculates and returns the mean and standard deviation from a provided vector.
sample_stats <- function(data){
    value <- mean(data)
    value1 <- sd(data)
    V_combine <- c(value,value1)
  return(V_combine)
}

#6. Use the function to determine the mean and sd from "sample pop". What is the returned mean, rounded to two decimals?
round(sample_stats(sample_pop),2)

#7. Create a for loop from 1 to 10,000 (note, use a smaller value when developing) that does the following:
# 7.1 - If the first iteration, create a new data frame named "df_results" with three columns - "mean", "stdev", 
# and "iteration"
# 7.2 - Draws a new 500 observation sample from "pop_truth" to "sample_pop"
# 7.3 - Uses the "sample_stats" function created previously to calculate and return the mean and standard deviation of 
# "sample_pop" to a new variable named "metrics"
# 7.4 - Adds a third element to "metrics" that is the current value of the iterator
# 7.5 - Appends "metrics" to the data frame "df_results"
# 7.6 - Prints the message, "Currently on iteration" and the current value of the iterator

for(i in 1:10000){
  if(i==1) {
    df_results<-data.frame(matrix(ncol = 3, nrow = 0))
    x <- c("mean", "stdev", "iteration")
    colnames(df_results) <- x
  }
  else{
  sample_pop <- sample(pop_truth,500)
  metrics <- sample_stats(sample_pop)
  metrics <- append(metrics,i)
  df_results <- rbind(df_results,metrics)
  print(paste("Currently on iteration",i))
  colnames(df_results) <- x
  }
}
df_results


#8. What is the average of "df_results$mean", rounded to two decimals? 
round(mean(df_results$mean),2)

#9. Compute the 5th and 95th percentiles of "df_results$mean". What is the 5th percentile, rounded to two decimals?
round(quantile(df_results$mean,probs = c(0.05, 0.95)),2)

#10. Use the hist() function to create a histogram of "df_results$mean" and "pop_truth". 
#    What type of distribution does "df_results$mean" appear to be?
hist(df_results$mean)
hist(pop_truth)
