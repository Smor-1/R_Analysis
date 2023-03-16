library(dplyr)
mecha_df <- read.csv("MechaCar_mpg.csv")
head(mecha_df)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_df))
#p-value is 5.4^-11 and the r^2 is about 0.72