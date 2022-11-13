# Combining Data - dplyr
head(df_auto)

## But we also have data on when a brand started:
Car_Make <- c("amc", "audi", "bmw", "buick", "chevrolet", "datsun", "dodge", "ford")
First_Year <- c(1954, 1910, 1916, 1903, 1911, 1931, 1900, 1903)

df_auto_start <- data.frame(Car_Make=Car_Make, 
                            First_Year=First_Year, 
                            stringsAsFactors = FALSE)
head(df_auto_start)

### Dplyr has different join types. 
### inner_join - only returns the data where both frames contain the join key(s), removes all non-matching rows
### left_join - maintains all of the data on base table (left/top), and joins matching data from the joining table. NAs created for joining table
### right_join - opposite of left. Maintains all of the data on the joining table and matches from the base table. NAs created for base table
### full_join - returns all data from both tables. NAs created for both tables.
### anti_join - returns all data that are not present in the data given inside the brackets

# Inner_join:
df_auto_hold <- df_auto %>%
  inner_join(df_auto_start, by="Car_Make")
View(df_auto_hold)
### Note, we've effectively filtered a lot of data because the inner_join only keeps matching records. 
dim(df_auto)
dim(df_auto_hold)
### Joins can pipe together with other functions just as we expect
df_auto_hold <- df_auto %>%
  inner_join(df_auto_start, by="Car_Make") %>%
  group_by(Car_Make, First_Year) %>%
  summarise(Average_MPG=mean(MPG))
View(df_auto_hold)
plot(df_auto_hold$First_Year, df_auto_hold$Average_MPG)

# Left_join:
df_auto_hold <- df_auto %>%
  left_join(df_auto_start, by="Car_Make")
# note, we've retained all of the records but it's placed "NA" in the column where it couldn't find a matching record
dim(df_auto) 
dim(df_auto_hold) 
is.na(df_auto_hold$First_Year)
View(df_auto_hold)  
df_auto_hold <- df_auto %>%
  left_join(df_auto_start, by="Car_Make") %>%
  group_by(Car_Make, First_Year) %>%
  summarise(Average_MPG=mean(MPG))
View(df_auto_hold)




# Cheat Sheet
## 1. https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
## 2. https://github.com/rstudio/cheatsheets/blob/main/strings.pdf
## 3. https://www.rstudio.com/resources/cheatsheets/



# Extra - sqldf
### There are package that allows you to manipulate data in a in-memory, or permanent database:
#install.packages("sqldf")
library(sqldf)
df_auto_hold <- sqldf("select * from df_auto where Car_Make='amc'")
head(df_auto_hold)