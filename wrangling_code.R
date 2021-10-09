library(tidyverse)

#Load CSV file. Because Gapmidner file type is suitable for tibble format, use "read_csv" instead of "read.csv"
health_spending <- read_csv("totalspendinginusd.csv") 
child_mortality <- read_csv("child_mortality_0_5_year_olds_dying_per_1000_born.csv")

#The original file is wider type file, so make it longer type by collapsing columns from 2nd to 17th into two new columns.
#The original columns' names are moved to new "year" column, and the original values are moved to new "health_spending" column.
health_spend_long <- pivot_longer(health_spending, cols = 2:17, names_to ="year", values_to = "health_spending")

#Extract specific columns("country" column and columns from 197 to 217) from child_mortality data into new "child_mortality" data.
child_mortality <- select(child_mortality,country, 197:212)

#make wider data to longer data as I did above
child_mortality_long <- pivot_longer(child_mortality, cols = 2:17, names_to ="year", values_to = "mortality")

#Combine two tables retaining all values and rows by matching values with rows they corresponds to in "country" and "year" columns.
data <- full_join(child_mortality_long, health_spend_long, by=c("country","year"))

#Extract rows with the values in the country column corresponding specified values(Angola, United Kingdom, etc.)
data2 <- filter(data, country %in% c("Angola","United Kingdom","Sierra Leone","Japan", "Switzerland","Canada", "United States","Malaysia","China","Vietnam" ))
data_sub1 <- filter(data, country %in% c("Angola","Sierra Leone","Malaysia","China","Vietnam" ))
data_sub2 <- filter(data, country %in% c("United Kingdom","Japan", "Switzerland","Canada", "United States","Malaysia","China","Vietnam" ))
