# dplyr - pipe operator
## We use pipe operator "%>%" to “passes along” the results of one function to the next
df_auto_hold <- df_auto %>% #note the pipe operator 
  rename(Miles_Per_Gallon=MPG) %>% #note the first argument is not required, because the pipe is passing it 
  mutate(HP_Per_Cylinder=Horsepower/Cylinders) %>%
  filter(HP_Per_Cylinder>20) %>%
  select(Car_Name, HP_Per_Cylinder)

head(df_auto_hold)

## stringr package
### The package stringr is a similar grammar language for manipulating strings. All the functions start with str_
### The str_split function will split the string into a vector of individual tokens:
head(df_auto)
library(stringr)
df_auto_hold <- df_auto %>% 
  mutate(Car_Make=str_split(Car_Name," "))
head(df_auto_hold)
### The str_split creates a list, which we can use to try to get the value:
df_auto_hold <- df_auto %>% 
  mutate(Car_Make=str_split(Car_Name," ")[[1]][1])
head(df_auto_hold)
### Note, this is treating the entire column, instead of by row. One way to address this is to rowise() by Car_Name, 
### then create the variable:
df_auto_hold <- df_auto %>% 
  rowwise() %>%
  mutate(Car_Make=str_split(Car_Name," ")[[1]][1])
head(df_auto_hold)
### An alternative to this is the group_by() function:
df_auto_hold <- df_auto %>%
  group_by(Car_Name) %>%
  mutate(Car_Make=str_split(Car_Name," ")[[1]][1])
head(df_auto_hold)
### With the structure built, we can just pipe on more functions to get additional variables:
df_auto <- df_auto %>% 
  rowwise() %>%
  mutate(Car_Make=str_split(Car_Name," ")[[1]][1]) %>% 
  mutate(Car_Model=paste(str_split(Car_Name," ")[[1]][-1], collapse=" ")) #everything but the first 
head(df_auto)

### Summarize the entire column by a group - summarize the entire column:
# Average MPG by Make and Model Year
df_auto %>% 
  group_by(Car_Make, Model_Year) %>%
  summarise(Average_MPG=mean(MPG)) %>%
  arrange(Model_Year) %>% 
  filter(Model_Year==70) %>%
  ungroup(Car_Make, Model_Year)
head(df_auto)

?ungroup
