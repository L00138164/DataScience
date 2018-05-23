
#To read the data set and show the head and structure
crime_data <- read.xlsx(file = "D:/Data Science/CA/Crime_Donegal.xlsx", 1, header = TRUE)
colnames(crime_data) <- c("Offence Type", "Location", "crime_2003", "crime_2004", " crime_2005 ", " crime_2006 ", " crime_2007 ", " crime_2008 ",
                        " crime_2009 "," crime_2010 "," crime_2011 ","crime_2012","crime_2013", "crime_2014","crime_2015","crime_2016")
head(crime_data)
str(crime_data)

#To write the data 
write.xlsx(crime_data, file = "C:/Users/raghunath/Source/Repos/DataScience/CA3_Prediction/crime_data.xlsx")

#To predict a model
linearMod <- lm(2016 ~ 2015, data = crime_data)
print(linearMod)
summary(linearMod)

#To get the test and training data
no_of_records <- sample(1:nrow(crime_data), 0.8 * nrow(crime_data))
training_data <- crime_data[no_of_records,]
testing_data <- crime_data[-no_of_records,]
nrow(training_data)
nrow(testing_data)
head(training_data)

#For model prediction
lr_model <- lm(crime_2016 ~ ., data = training_data)
summary(lr_model)
pred_value <- predict(lr_model, newdata = testing_data)
head(pred_value)
head(testing_data$crime_2016)

lm(2016 ~ 2015, data = training_data)
actual_pred <- data.frame(cbind(actuals = testing_data$2016, predicted = pred_value))
head(actual_pred)

#To get the r-squared value
SSE <- sum((testing_data$crime_2016 - pred_value) ^ 2)
SST <- sum((testing_data$crime_2016 - mean(testing_data$crime_2016)) ^ 2)

r_value <- 1 - SSE / SST
r_value

