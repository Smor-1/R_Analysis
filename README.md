# R_Analysis

## Linear Regression to Predict MPG

![Image](Challenge/Multiple_linreg.png) 

There are two variables that provide a non-random amount of variance to mpg values in this dataset:
1. The vehicle length (p = 2.6*10^-12)
2. The ground clearance (p = 5.21*10^-8)
Note that the vehicle weight is approaching statistical significance, however does not reach less than 0.05 for a p-value. 
Also note that the intercept is statistically significant which means that other factors not included in this analysis are contributing to non-random variance in mpg. 

The slope of this linear model is not considered to be zero. This is because the null hypothesis of linear regression testing is that the slope of the linear model is 0. As our p-value in this model is low enough to reject the null hypothesis, (p = 5.35*10^-11) we can state that the slope is not 0 thereby accepting our alternative hypothesis. 

This linear model does predict the mpg of MechaCar prototypes effectively as our R-Squared value is 0.72. With that in mind however, the lack of significant variables here might be evidence of an overfit model. Additionally, our adjusted R-Squared value, which controls for the number of predictors in the model is lower and decreases when a predictor improves the model by less than expected. 



