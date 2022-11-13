# An array is created using the array() function, and the dim parameter to specify the dimensions:
# 1 dimension - 1 row (vector)
sequence_array_1_dim <- array(1:10, dim=10)
sequence_array_1_dim
# 2 dimensions - 2 rows, 5 columns 
sequence_array_2_dim <- array(1:10, dim= c(2,5))
sequence_array_2_dim
# 3 dimensions - 2 rows, 5 columns, 2 tables
sequence_array_3_dim <- array(1:20, dim = c(2,5,2))
sequence_array_3_dim
# 4 dimensions - 2 rows, 5 columns, 2 tables, 2 sets 
sequence_array_4_dim <- array(1:40, dim = c(2,5,2,2))
sequence_array_4_dim

# Similar to vectors, functions can be applied to arrays:
dim(sequence_array_2_dim)
length(sequence_array_2_dim)
sum(sequence_array_2_dim)
max(sequence_array_2_dim)

dim(sequence_array_4_dim)
length(sequence_array_4_dim)
sum(sequence_array_4_dim)
max(sequence_array_4_dim)