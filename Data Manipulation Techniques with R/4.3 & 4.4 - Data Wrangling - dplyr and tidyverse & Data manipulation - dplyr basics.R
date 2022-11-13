# dplyr and tidyverse
## “tidyverse” is a collection of packages that encompases all of these https://www.tidyverse.org/

# Data manipulation - dplyr basics

df_auto <- read.csv("Auto_MPG.csv", stringsAsFactors = FALSE)
View(df_auto)

## Select: select columns by name or helper function (choose which variables you want to look at ):
library(dplyr)
select(df_auto, MPG, Cylinders)
colnames(df_auto)
select(df_auto, -Orgin)
select(df_auto, contains("Model"))
## The base R equivalents are:
df_auto$MPG
df_auto[,c('MPG','Cylinders')]
df_auto[,-c('Orgin')]
df_auto[,grepl("Model", names(df_auto))] 
?grepl

## Slice: Select rows by position (choose which rows of data you want):
df_auto$row_number <- 1:nrow(df_auto) #adding a new variable called row_number to help us see the index 
View(df_auto)
slice(df_auto,1:5)
slice(df_auto, 150,) #gives the data on row 150
slice(df_auto, 150:n()) #all the rows between 150 and the end
slice(df_auto, -1:-5) #removes rows between values, equivalent to slice(df_auto, 6:n())
df_auto <- select(df_auto, -row_number) #remove the row_number column
## The base R equivalents are:
df_auto[1:5,]
df_auto[150:nrow(df_auto),]
df_auto[-c(1:5),]

## Rename: Rename the columns of a data frame
colnames(df_auto)
df_auto <- rename(df_auto, Miles_Per_Gallon=MPG) #rename MPG to Miles_Per_Gallon
colnames(df_auto)
df_auto <- rename(df_auto, MPG=Miles_Per_Gallon) #rename back Miles_Per_Gallon to MPG
colnames(df_auto)
## The base R equivalents are:
colnames(df_auto)[1] <- 'Miles_Per_Gallon'
colnames(df_auto)
colnames(df_auto)[1] <- 'MPG'
colnames(df_auto)

## Filter: Extract rows that meet logical criteria (filter the data frame by one, or multiple, conditions)
filter(df_auto, MPG>20)
filter(df_auto, (MPG>20 & Acceleration>20))
filter(df_auto, MPG==max(MPG))
filter(df_auto, MPG==min(MPG))
## The base R equivalents are:
df_auto[df_auto$MPG>20,]
df_auto[(df_auto$MPG>20 & df_auto$Acceleration>20),]
df_auto[which.max(df_auto$MPG),]
df_auto[which.min(df_auto$MPG),]

## Sample: Randomly select a sample of n size or a proportion
sample_n(df_auto, 5)
sample_frac(df_auto, 0.05)
## The base R equivalents are:
df_auto[sample(1:nrow(df_auto),5),]
df_auto[sample(1:nrow(df_auto),ceiling(0.05*nrow(df_auto))),]

## Mutate: Compute and append one or more new columns (create a new variable - returns the data frame)
df_auto$Horsepower <- as.numeric(df_auto$Horsepower)
mutate(df_auto, HP_Per_Cylinder=Horsepower/Cylinders)
mutate(df_auto, Avg_HP_Per_Cylinder = mean(Horsepower/Cylinders, na.rm=TRUE))
## The base R equivalents are:
df_auto$HP_Per_Cylinder <- df_auto$Horsepower / df_auto$Cylinders
df_auto$Avg_HP_Per_Cylinder <- mean(df_auto$Horsepower / df_auto$Cylinders, na.rm = TRUE)
### the na.rm=TRUE argument. Some arithmatic functions sum, avg, count, etc. will NA the entire column if they  
### encounter a single NA within that column/vector. Setting na.rm=TRUE will tell the interpreter to “remove” the NA  
### and carry forth with the calculation.

## Summarise: Summarise data into single row of values 
## (aggregates the data into a single result. think avg, mean, min, max, etc.)
summarise(df_auto, 
          Avg_HP_Per_Cylinder=mean(Horsepower/Cylinders, na.rm = TRUE), 
          Min_HP_Per_Cylinder=min(Horsepower/Cylinders, na.rm=TRUE)
)
## The base R equivalents are:
data.frame(
  Avg_HP_Per_Cylinder = mean(df_auto$Horsepower/df_auto$Cylinders, na.rm = TRUE),
  Min_HP_Per_Cylinder = min(df_auto$Horsepower/df_auto$Cylinders, na.rm=TRUE)
)
