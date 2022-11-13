# A logical is a binary representation of True and False:
a <- TRUE
b <- FALSE
typeof(b)

# Logicals are used for evaluating comparisons, such as: equality
# note the double equals == operator is a logical comparison, opposed to a single equal = being an assignment 
2==2
typeof(2==2)
'cat' == 'dog'
'cat' == 'cat'
#Not equal operator 
2!=2 
# greater than/less than
2>2
2>=2
2<1
2<=1
# Null Values 
V1 <- 1
V1[10] <- 10
V1
is.na(V1)
!is.na(V1)
V1[!is.na(V1)]
# Contained within set 
V1
1 %in% V1
10 %in% V1
2 %in% V1
c(1,2) %in% V1
V1 <= 1
# If we want not in, then use the not ! operator around the entire statement 
!(1 %in% V1)
# Note, logicals can be used with other data types as well
a <- c(1,2,3,4,5) 
a
a <= 1
b <- c(1,2,7,9,5)
a == b
a != b
A <- matrix(1:10,2,5)
A
B <- matrix(seq(1,20,2),2,5)
B
A == B
A != B
identical(a,b)
identical(A,B)
all.equal(A,B)
?all.equal
