#1. Make a vector, "V1", of 100 elements starting from 10 and incremented by 10. What is the total value (sum) of "V1"?
V1 <- seq(from = 10,to = ,by = 10,length.out=100)
sum(V1)

#2. Make a vector, "V2", of 100 elements of the value 25. What is the total value (sum) of "V2"?
V2 <- rep(25,100)
sum(V2)

#3. Make a vector, "V3", that is "V1" divided by "V2". What is the max value of "V3"?
V3 <- V1/V2
V3
max(V3)

#4.  Create data frame, "df1", comprised of "V1","V2", and "V3". Name the columns "Vector_1", "Vector_2", and "Vector_3" 
#    respectively. Paste your code in the text box below.
df1 <- data.frame(Vector_1=V1,Vector_2=V2,Vector_3=V3)
df1

#5. How many rows are in "df1"?
nrow(df1)

#6. What is the index of the max observation in "df1" column "Vector_3"?
which.max(df1$Vector_3)

#7. Create a new column in "df1", "Vector_4", that is the result of adding "Vector_1" and "Vector_3" together.
#   What is the maximum value in "Vector_4"?
df1$Vector_4 <- df1$Vector_1 + df1$Vector_3
max(df1$Vector_4)

#8. Move the column "Vector_4" to the first column of "df1" Paste your code in the text box below.
df1 <- df1[,c(4,1:3)]
head(df1)

#9. What value is in row 81, column 1 of "df1"?
df1[81,1]

#10. Reassign the minimum value in row 86 to 1. What is the mean of "Vector_2"?
mean(df1$Vector_2)
df1[86, which.min(df1[86,])] <- 1
mean(df1$Vector_2)

#11. Create a new column in "df1", "Row_Mean", that is the average of the values in columns. 
#    What is the value of "Row_Mean" for row 45?
df1$Row_Mean <- rowMeans(df1)
df1$Row_Mean[45]

#12. Create a list, "l1", from "df1". Paste your code in the text bow below.
l1 <- as.list(df1)

#13. What is the mean of the combined elements from "l1" components "Vector 1" and "Vector 2"?
l_combine <- c(l1$Vector_1,l1$Vector_2)
mean(l_combine)

