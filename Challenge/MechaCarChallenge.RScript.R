library(dplyr)
mecha_df <- read.csv("MechaCar_mpg.csv")
head(mecha_df)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_df))
#p-value is 5.4^-11 and the r^2 is about 0.72

sus_df <- read.csv("Suspension_Coil.csv")
head(sus_df)

?summarize()

total_summary <- sus_df %>% summarise(Mean = mean(PSI), Median = median(PSI) , Variance = var(PSI), SD = sd(PSI))
total_summary

lot_summary <- sus_df %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI) , Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
lot_summary

#checking for normality: 
plt <- ggplot(sus_df, aes(x = PSI))
plt + geom_density()

lot_1 <- subset(sus_df, Manufacturing_Lot == "Lot1")
ggplot(lot_1, aes(x = PSI)) + geom_density()
lot_2 <- subset(sus_df, Manufacturing_Lot == "Lot2")
ggplot(lot_2, aes(x = PSI)) + geom_density()
lot_3 <- subset(sus_df, Manufacturing_Lot == "Lot3")
ggplot(lot_3, aes(x = PSI)) + geom_density()
#something weird about lot 1 and lot 3

shapiro.test(lot_1$PSI)
#less than 0.05
shapiro.test(lot_2$PSI)
#p-value is 0.33! aka normally distributed
shapiro.test(lot_3$PSI)
#p-value is 2.366*10^-6

#total:
t.test(sus_df$PSI, mu=1500)
#lot 1:
t.test(lot_1$PSI, mu=1500)
#lot 2:
t.test(lot_2$PSI, mu=1500)
#lot 3:
t.test(lot_3$PSI, mu=1500)
