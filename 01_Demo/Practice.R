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

df <- mpg
head(df)
plt <- ggplot(df, aes(x = fct_infreq(class)))
plt + geom_bar()
#the fct_infreq argument makes it ordered , putting fct_rev before it gets opposite order 

mpg_vehicle_count <- df %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') %>% arrange(desc(Vehicle_Count))
mpg_vehicle_count
plt2 <- ggplot(mpg_vehicle_count, aes(x = fct_rev(fct_reorder(manufacturer, Vehicle_Count)), y = Vehicle_Count))
plt2 + geom_col() + xlab("HELLO") + ylab("ALSO HELLO") + theme(axis.text.x=element_text(angle=45, hjust=1))

mpg_mean_highway <- subset(df,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt3 <- ggplot(mpg_mean_highway, aes(x=cyl , y=Mean_Hwy))               
plt3 + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks=c(16:30))

plt4 <- ggplot(df, aes(x=displ,y=cty , color=class, shape = drv))
plt4 + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class!", shape = "Drive Type")

plt5 <- ggplot(df, aes(x = reorder(manufacturer , -hwy), y=(hwy)))
plt5 + geom_boxplot(lty = 1, fill = "white" , color = "blue" , outlier.colour = "red") + labs(x = "Manufacturer" , y="Highway Fuel Efficiency") + theme(axis.text.x=element_text(angle=45, hjust=1)) + geom_point()
#adding geom_point() overlays a scatter plot on top! 

both_mpgs <- df %>% gather(key="MPG_Type",value="Rating",c(cty,hwy))
plt6 <- ggplot(both_mpgs, aes(x = reorder(manufacturer, -Rating), y = Rating, color=MPG_Type))
plt6 + geom_boxplot() + facet_wrap(vars(MPG_Type)) + theme(axis.text.x=element_text(angle=45, hjust=1)) + labs(x = "Manufacturer")




                              