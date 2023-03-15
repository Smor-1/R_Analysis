x <- 3
y <- 2
x <- 5
# changes it to 5

numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
numlist[0:5]
#not like python/JS, indexing starts at 1 rather than 0
numlist[3]


csv_df <- read.csv('demo.csv',check.names=F,stringsAsFactors = F)
csv_df %>% select(Name)

#gives back third row
csv_df[3,]

#to get year column
csv_df["Year"]

#also year col
csv_df$Year

library(jsonlite)

json_df <- fromJSON(txt = "demo.json")
filtered_df <- json_df[json_df$price > 10000,]

#can also use subset() to filter

filter_table2 <- subset(json_df, price > 10000 & drive == "4wd" & "clean" %in% title_status) 


#or use sample to randomly sample our data to reduce bias 
sample(csv_df, 4)


#inside tidyverse is ggplot2, tidyr and dplyr among others
library(tidyverse)

#add cols to OG df:
csv_df <- csv_df %>% mutate(Mileage_per_Year=Total_Miles/(2023-Year),IsActive=TRUE) 
csv_df

json_df %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep')

myDF <- read.csv("demo2.csv")
long_table <- gather(myDF,key="Metric",value="Score",buying_price:popularity)

#converts back to original
wide_table <- long_table %>% spread(key="Metric",value="Score")





