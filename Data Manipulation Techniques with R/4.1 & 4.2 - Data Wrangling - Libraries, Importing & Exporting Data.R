# Libraries
## To install
#install.packages(c("data.table","dplyr","stringr"))
## To load
library(data.table)
library(dplyr)
library(stringr)

# Importing & Exporting Data
## Working directory:
### Check where WD is?(function returns an absolute filepath representing the current working directory of the R process
    #or NULL if the working directory is not available:)
getwd()
### To set WD: set(" Path ")
### To import data, we can use the read. function
?read.csv
df_auto <- read.csv("Auto_MPG.csv", stringsAsFactors = FALSE)
View(df_auto)
### We can check the data set:
class(df_auto)
View(df_auto)
dim(df_auto)
nrow(df_auto)
summary(df_auto)

### Horsepower is character?
typeof(df_auto$Horsepower)
df_auto$Horsepower
summary(df_auto$Horsepower)
### NAs as question marks (a character), so everything became a character. We can fix this by reassigning as numeric:
df_auto$Horsepower <- as.numeric(df_auto$Horsepower)
summary(df_auto)
df_auto$Horsepower
summary(df_auto$Horsepower)

### fix a column name you can use the colnames() function:
colnames(df_auto)
colnames(df_auto)[8] <- "Origin"
colnames(df_auto)

### Export data using write.csv. row.names = FALSE => will not include a row number
write.csv(df_auto, file="Auto_MPG_Clean.csv", row.names = FALSE)
