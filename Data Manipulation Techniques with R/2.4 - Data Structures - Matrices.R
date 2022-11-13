# A matrix is created using the matrix() function:
## A matrix is a 2-dimensional (row x column) array 
A <- matrix(1:25, 5, 5)
A
B <- matrix(1:25, 5, 5, byrow=TRUE) #if you want to fill down the row instead of across the columns
B
C <- matrix(1:5, 1, 5)
C
D <- matrix(1:5, 5, 1)
D

## Matrices are convenient because we can do linear algebra with them:
# Element-wise operators 
A + B
A - B
A * B
A / B
# Matrix Multiplication
C %*% D
# Transpose 
C
t(C)

## Name the matrix columns and and rows:
colnames(A) <- c("Column_1", "Column_2", "Column_3", "Column_4", "Column_5")
A
colnames(A)[4] <- "Changed_It"
A
rownames(A)  <- c("Row_1", "Row_2", "Row_3", "Row_4", "Row_5")
A

## Some helpful functions for matrices:
colSums(A)
rowSums(A)
sum(A)
dim(A)
length(A)

## Extract information from a matrix using similar index notation (row, column):
A[2,1] # Single element 
A[,1] # All rows in the first column
A[,c(1,2)] # All rows for columns 1 and 2
A[1,] # All columns in the first row 
A[c(1,2),] # All columns for rows 1 and 2
A["Row_1","Column_2"]
