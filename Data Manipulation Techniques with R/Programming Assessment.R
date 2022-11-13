library(lubridate)
library(tidyverse)

input_file <- read.csv("Traffic_stops.csv")
input_file <- input_file  %>%
  mutate(BirthYear = year(as.Date(input_file$driver_birthdate, format = "%m/%d/%Y")))%>%
  mutate(Cohort = case_when(BirthYear>=2000~"after-2000",
                            BirthYear<2000~"pre-2000"))
#1.
input_file %>%
  group_by(BirthYear) %>%
  summarise(frequency = n()) %>%
  arrange(desc(frequency))%>%
  head(5)

#2.
table(input_file$Cohort)

#3.
tapply(input_file$driver_age,input_file$violation, mean,na.rm = TRUE)

#4.
input_file %>% group_by(driver_gender,violation) %>% 
  summarise_each(funs(mean(driver_age, na.rm = TRUE)))


FDgtsixty <- filter(input_file,driver_gender == 'female' & driver_age >60)
FDgtsixty$weekday_of_stop <- wday(mdy(FDgtsixty$stop_date))
FDgtsixty_updated<-FDgtsixty[FDgtsixty$weekday_of_stop == 1,]

#5.
dim(FDgtsixty_updated)

#6.
FDgtsixty_updated %>%
  group_by(violation) %>%
  summarise(frequency = n()) %>%
  arrange(desc(frequency))%>%
  head(5)
