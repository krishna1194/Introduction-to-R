#1. Load the Auto_MPG.csv into a data frame named "df_auto". How many columns are in "df_auto"?
library(data.table)
library(dplyr)
library(stringr)
getwd()
setwd("C:/Users/krish/Downloads")
df_auto <- read.csv("Auto_MPG.csv")
ncol(df_auto)
dim(df_auto)

#2. Convert "Horsepower" to numeric. How many NAs are in "df_auto" after converting "Horsepower"?
head(df_auto)
str(df_auto$Horsepower)
df_auto$Horsepower <- as.numeric(df_auto$Horsepower)
str(df_auto$Horsepower)
sum(is.na(df_auto$Horsepowe))

#3. Using dplyr, add to "df_auto":
# 3.1 Variable named "Car_Make" that is the first word from "Car_Name"
# 3.2 Variable named "Car_Model" that is the remaining words (not first) from "Car_Name"
# How many observations of "Car_Make" "ford" are there?
df_auto <- df_auto %>% 
  rowwise() %>%
  mutate(Car_Make = str_split(Car_Name," ")[[1]][1]) %>%
  mutate(Car_Model = paste(str_split(Car_Name," ")[[1]][-1],collapse=" "))
head(df_auto)
dim(df_auto %>% filter(Car_Make == "ford"))

#4. Using dplyr, how many cars are there for model year 73?
dim(df_auto %>% filter(Model_Year == 73))

#5. Using dplyr, what "Car_Make" "ford" car has the highest "Weight_per_Horsepower" (Weight/Horsepower) ratio? Ignore NAs.
df_auto %>% 
  filter(Car_Make=='ford') %>%
  mutate(Weight_per_Horsepower = Weight/Horsepower )%>% 
  arrange(desc(Weight_per_Horsepower))


#6. Using dplyr and stringr, update "df_auto" so all values of "Car_Make" that contain "chev" say "chevrolet".
#   How many observations have "Car_Make" "chevrolet"?
df_auto <- df_auto %>%
  mutate(Car_Make = replace(Car_Make, str_detect(Car_Make, "chev"), "chevrolet"))
dim(df_auto %>% filter(Car_Make == "chevrolet"))


#7. What is the average MPG for "chevrolet" cars?
df_auto %>% 
  group_by(Car_Make) %>%
  summarise(Avg_MPG=mean(MPG,na.rm = TRUE)) %>%
  filter(Car_Make == 'chevrolet')

#8. Below is a data frame, "df_auto_start", that contains the first production year for some of the auto makes.
#     Car_Make <- c("amc", "audi", "bmw", "buick", "chevrolet", "datsun", "dodge", "ford")
#     First_Year <- c(1954, 1910, 1916, 1903, 1911, 1931, 1900, 1903)
#     df_auto_start <- data.frame(Car_Make=Car_Make, First_Year=First_Year, stringsAsFactors = FALSE)
#     Using dplyr joins, how many cars exist in the data set where "First_Year" is null?
Car_Make <- c("amc", "audi", "bmw", "buick", "chevrolet", "datsun", "dodge", "ford")
First_Year <- c(1954, 1910, 1916, 1903, 1911, 1931, 1900, 1903)
df_auto_start <- data.frame(Car_Make=Car_Make, First_Year=First_Year, stringsAsFactors = FALSE)
head(df_auto_start)

df_ <- df_auto %>%
  left_join(df_auto_start, by="Car_Make")
head(df_)

sum(is.na(df_$First_Year))
dim(df_[is.na(df_$First_Year), ])

