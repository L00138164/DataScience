
# Create a data frame and reading the data
my_data <- read.csv("D:/Data Science/Diabetes-md.csv", header = TRUE)
my_data

# Structure and class of the data frame
str(my_data)
class(my_data)

#Configure the names of attributes
colnames(my_data) <- c("Patient name", "NI address", "Type", "Age", "Health status")
my_data

#Refactor the attribute Type
Type_Fac <- factor(my_data$Type, order = TRUE, levels = c("Type 1", "Type 2"))
Type_Fac
my_data$Type <- Type_Fac

#Refactor the attribute Health status
Status_Fac <- factor(my_data$Health, order = TRUE, levels = c("Poor", "Improved", "Excellent"))
Status_Fac
my_data$Healthstatus <- Status_Fac

# Structure and class of the data frame
str(my_data)
class(my_data)

#Copy names attribute to a new data frame
patient_names <- my_data[,c(1)]
patient_names

#Display 10 patient names
head(patient_names, 10)

#Assigning missing values as NA and taking the count
my_data[my_data == ''] <- NA
my_data

#Count of missing values
sum(is.na(my_data))

#Remove the missing values
my_data_new <- na.omit(my_data)
my_data_new

#Count the no: of records before and after the removal of missing values
nrow(my_data)
nrow(my_data_new)
