#Read the .csv file data
my_data <- read.csv("D:/Data Science/Lab/NIPostcodes.csv", header = TRUE)
colnames(my_data) <- c("Organisation Name", "Sub-building Name", "Building Name", "Number", "Primary Thorfare", "Alt Thorfare", "Secondary Thorfare", "Locality","Townland", "Town", "County", "Postcode", "x-coordinates", "y-coordinates", "Primary Key")
my_data

#Structure and first ten rows of the dataframe
str(my_data)
head(my_data, 10)
nrow(my_data)

#To get the number and mean of missing data
my_data[my_data == ''] <- NA
missing_data <- is.na(my_data)
missing_data
sum(missing_data)
mean(missing_data)

#County attribute changed to factor
attach(my_data)
County_Fac <- factor(County, order = TRUE, levels <- c("Antrim", "Armagh", "Down", "Fermanagh", "Londonderry", "Tyrone"))
County <- County_Fac
str(my_data)

#Primary key identifier is moved to the start
my_data_new <- my_data[, c(15,1:14)]
my_data_new
str(my_data_new)

#Create a subset of the dataframe
Limavady_data <- subset(my_data_new, grepl('LIMAVADY', Locality) & grepl('LIMAVADY', Townland) & grepl('LIMAVADY', Town), select = c(1:15))
Limavady_data
nrow(Limavady_data)

#To write Limavady dataset in csv
write.csv(Limavady_data,"D:/Data Science/Lab/Limavady_data.csv",row.names = FALSE)

#Align data
install.packages("knitr")
library(knitr)
my_data <- kable(my_data)
my_data <- rapply(my_data, as.character, classes = "factor", how = "replace")
head(my_data, 10)

#To write the cleaned NIPostcode data
write.csv(my_data_new, "D:/Data Science/Lab/CleanNIPostcodeData.csv", row.names = FALSE)

str(my_data_new)
nrow(my_data_new)