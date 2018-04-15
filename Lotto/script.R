#Load the csv files
temp <- read.csv("D:/Data Science/Lab/Lotto/1999.csv")
str(temp)
head(temp)

#Examine all the files in the folder
csv_file_list <- list.files(path = "D:/Data Science/Lab/Lotto", pattern = "*.csv")

my_data <- combine_results(csv_file_list)
my_data
str(my_data)

#Function to insert the list of files
combine_results <- function(file_list)
{
    lotto_data <- NULL
    for (csv_file in file_list)
    {

        lotto_record <- read.csv(header = TRUE, paste("D:/Data Science/Lab/Lotto/", csv_file, sep = ""), stringsAsFactors = FALSE)
        data_of_interest <- lotto_data[2:9]
        lotto_data <- rbind(lotto_data, data_of_interest)
    }
    return(lotto_data)
}




