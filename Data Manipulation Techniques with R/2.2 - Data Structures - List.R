# Lists are objects which contain elements of different types like − numbers, strings, vectors and another list inside it.
# A list can also contain a matrix or a function as its elements. A list is created using list() function.

# Here are 3 vectors of different types
v1 <- c("apple", "banana")
v2 <- c("dog", "cat", "bunny", "pig", "cow", "horse")
v3 <- seq(0,10,by=2)
v1;v2;v3
# Here are 3 vectors of different types
l1 <- list(v1, v2, v3)
l1
class(l1)
typeof(l1)

# List elements can be accessed via index. Each of the components of a list is accessed via the double bracket [[x]]:
##First element in the list
l1[[1]]
##First element in the first element (vector) of the list
l1[[1]][1]

# List elements can be named:
names(l1) <- c("Fruit", "Animals", "Even_Numbers")
# Or they can be named upon creating the list:
l1 <- list(Fruit=v1, Animals=v2, Even_Numbers=v3)
names(l1)

# The elements in a list can be retrieved by name:
l1$Fruit
l1$Fruit[1]
l1$Even_Numbers
max(l1$Even_Numbers)

# List inside a List:
l2 <- list(Odd_Numbers=seq(1,10,by=2), list1=l1)
l2
## First Vector
l2$Odd_Numbers
l2[[1]]
## l1 within L2
l2$list1
l2[[2]]
l2$list1$Fruit
l2[[2]][1]
l2$list1$Fruit[1]
l2[[2]][[1]][1]
l2[[2]][[1]][3] <- "blueberry"   # Adding a new data on existing sub-list
l2$list1$Fruit
l2

# To Combine lists:
l4 <- list(More_Fruit=c("melon", "orange"))
l4
l1 <- c(l1,l4)
l1

# To update part of a list, we can just operate on and update it accordingly:
l1$Fruit <- c(l1$Fruit, l4$More_Fruit)
l1$Fruit
l1
