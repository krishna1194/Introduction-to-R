# Data Frames are data displayed in a format as a table. A data frame is essentially a 2 dimensional matrix (row x column) 
# You can think of it like an excel table or relational database table. Data Frames can have different types of data 
# inside it, and we use the data.frame() function to create a data frame:

## Create a data frame called dt1 from a set of vectors:
dt1 <- data.frame (
  names =  c("Simmons", "Race", "Healey", "LaBarr", "Villanes"),
  class = c("Time Series", "Linear Algebra", "Visualization", "Finance", "Programming"),
  female = c(1,1,0,0,1))
## To view the data frame on a new tab
View(dt1)
## Head of df on the console table
head(dt1)
## Change the column names:
colnames(dt1)
colnames(dt1) <- c("Last_Name", "Class_Taught", "Female?")
colnames(dt1)
colnames(dt1)[2] <- "Classes_Taught_"
colnames(dt1)
## Reference a column name:
dt1$Last_Name
dt1$Classes_Taught

## Dataframe Indexes:
dt1
### Retrieve a row
dt1[1,]
#### leaving the row or column blank means "everything"
dt1[2:5,]
#### the negative operator "-" means "everything but"
dt1[-1,]

### Retrieve a column
dt1[,1]
dt1[,-3]
dt1[,c(1:2)]
dt1[,"Last_Name"]
dt1[,c("Last_Name","Female?")]

### Retrieve an element
dt1[5,2]

### Reassign an element 
dt1[5,2] <- "R Programming"
dt1[5,]

###Find elements that meet a condition
dt1$`Female?`==1
dt1$Last_Name=='Race'

### Filter by an value 
dt1[dt1$`Female?`==1,]
dt1[dt1$Last_Name=='Race',]

### Add a new row - rbind (row-bind) function. The cbind function is its column version.
dt1 <- rbind(dt1, c("Larsen", "Teaching Assistant", 0))
dt1
### Add a new column
dt1$First_Name <- c("Susan", "Shaina", "Christopher", "Aric", "Andrea", "Nicholas")
dt1

### Change the order of columns 
dt1 <- dt1[,c(4,1:3)]
dt1

### Make columns based off other columns
dt1$First_Name_Length <- nchar(dt1$First_Name)
dt1
dt1$Last_Name_Length <- nchar(dt1$Last_Name)
dt1
dt1$Total_Name_Length <- dt1$First_Name_Length + dt1$Last_Name_Length + 1
dt1
dt1$Full_Name <- paste(dt1$First_Name, dt1$Last_Name, sep=" ")
dt1 

# Remove some intermediate step columns
dt1 <- dt1[,-c(5,6)]
dt1
