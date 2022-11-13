# We can construct a vector using the combine (c) function:
# Here is a vector containing three numeric values 3, 5 and 7:
numbers <- c(3, 5, 7)
numbers

#Here is a vector of logical values:
logical <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 
logical

#Here is a vector of character values:
fruits <- c("apple", "oranges", "banana")
fruits

# We can also change the value in a vector:
fruits[2] <- "strawberries"
fruits

# type and its length of a vector:
typeof(fruits)
length(fruits)

# Combine vectors using the combine function:
results <- c(1, 2, 3)
other_results <- c(4, 5, 6)
combined_results <- c(results, other_results)
combined_results

#Vectors can be added together in an element-wise operation:
total_add <- results + other_results
total_div <- results / other_results
total_mod <- results %% other_results

# Basic - Functions can be applied to each element of the vector:
total_rou <- round(total_div, 1)
names <- c("Simmons", "Race", "Healey", "LaBarr", "Villanes")
names <- sort(names, decreasing = TRUE)

# Constructing useful types of vectors:
##Replicate - replicates a value X number of times 
identity_vector <- rep(1,10)
identity_vector

##Sequence operator ":" From:To 
sequence_vector <- 1:10
sequence_vector

sequence_vector1 <- seq(1,10)
sequence_vector1

##Sequence function - allows sequencing by a value
sequence_by_two_vector <- seq(0,10, 2)
sequence_by_two_vector

##Sample function - take a random sample from a vector
random_vector <- sample(sequence_by_two_vector,3)
random_vector

##A common trick to randomly permute all elements in a vector is sample(vector_name)
permute <- sample(numbers)
permute

# A vector doesn’t have to be made with consistent elements, but it will force them to one type:
values <- c("IAA", 1, "2021", 5)
values
typeof(values)

# The elements of a vector can only be of one type. If we want elements of different types… we will need a list.