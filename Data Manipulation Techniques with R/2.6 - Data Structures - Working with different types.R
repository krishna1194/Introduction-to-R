# Can examine the class of each object using the class function:

total_add
class(total_add)

names
class(names)

l2
class(l2)

sequence_array_1_dim
class(sequence_array_1_dim)

A
class(A)

dt1
class(dt1)

dt1$First_Name
class(dt1$First_Name)

# Can also do some conversions between them using the “as” functions:
new_array <- as.array(total_add)
class(new_array)
new_array

old_vector <- as.vector(new_array) 
class(old_vector)

dfA <- as.data.frame(A)
class(dfA)
dfA

