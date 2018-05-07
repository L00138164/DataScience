#To Read the crime data and get the structure and no: of records and top 6 records of the data
my_data <- read.csv("D:/Data Science/CA/Crime_old.csv",header = TRUE)
str(my_data)
head(my_data)
nrow(my_data)

#To put the columns needed into a dataframe
Crime_Data <- my_data[c(2:5, 11, 15:23)]
str(Crime_Data)
head(Crime_Data)

#To assign suitable column names to the data
colnames(Crime_Data) <- c("Offence Id", "Date Reported", "Date Occured", "Time Occured", "Location", "No: of Victims", "Shift of the victim", "Day Occured","Loc Type","Crime Type","Neighbourhood","NPU","X-Co-ordinate","Y-Co-ordinate")
str(Crime_Data)
head(Crime_Data)

#To assign NA for missing data
Crime_Data[Crime_Data == ''] <- NA
missing_data <- is.na(Crime_Data)
head(Crime_Data, 100)

#To write the data into the folder
write.csv(Crime_Data, file = "C:/Users/raghunath/Source/Repos/DataScience/CA2_Data Analysis/Crime_Data.csv", row.names = FALSE)

#To do power analysis of the dataframe and plot it
library(pwr)
power_changes <- pwr.2p.test(h = 0.75, sig.level = .01, power = 0.95)
power_changes
plot(power_changes)

#To make random sample
sample_Crime_data <- Crime_Data[c(8,10)]
str(sample_Crime_data)
sample_data <- sample(sample_Crime_data, 64, replace = TRUE)
head(sample_Crime_data)

#Reading the data and writing it
library(xlsx)
H0_data <- read.xlsx(file = "D:/Data Science/CA/H0.xlsx", 1, header = TRUE)
H1_data <- read.xlsx(file = "D:/Data Science/CA/H1.xlsx", 1, header = TRUE)

write.xlsx(H0_data, file = "C:/Users/raghunath/Source/Repos/DataScience/CA2_Data Analysis/H0.xlsx")
write.xlsx(H1_data, file = "C:/Users/raghunath/Source/Repos/DataScience/CA2_Data Analysis/H1.xlsx")

#Testing the hypothesis
t.test(H0_data,H1_data)