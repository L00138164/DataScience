#Function to combine all NI Criem data files.
combined_data <- function(folderpath,file_list) {
    NI_data <- NULL
    for (csv_file in file_list) {
        Read_Data <- read.csv(paste(folderpath, csv_file, sep = ""), header = TRUE, stringsAsFactors = FALSE)
        NI_data <- rbind(NI_data, Read_Data)
      
    }
    return(NI_data)
}

csv_file_list <- list.files(path = "D:/Data Science/Lab/NI Crime Data/", pattern = "*.csv", recursive = TRUE)
csv_file_list

# Call the function and return the result to a data frame
All_NI_data <- combined_data("D:/Data Science/Lab/NI Crime Data/", csv_file_list)
# show the contents and structure of All_NI_data
str(All_NI_data)
nrow(All_NI_data)
All_NI_data

#Show the no: of rows and 6 records in AllNICrimeData
head(All_NI_data)
nrow(All_NI_data)

find_a_postcode <- function(location) {

    post_code <- NULL
    post_code <- CleanNIPostcodeData[CleanNIPostcodeData$Primary.Thorfare %in% c(location),] #filter(CleanNIPostcodeData, greplCleanNIPostcodeData$Primary.Thorfare == "Strabane")
    return (post_code)
}

match_postcode <- function() {
    index <- match(trimws(toupper(AllNI_Crimedata$Location)), trimws(toupper(CleanNIPostcodeData$Primary.Thorfare)))
    CleanNIPostcodeData[na.omit(index),]
}
find_a_postcode_test1 <- function(location) {
    index <- match(trimws(toupper(location)), trimws(toupper(MatchingPostCodes$Primary.Thorfare)))
    return(unique(MatchingPostCodes$Postcode))
}

addpostcodes <- function(AllNI_Crimedata, output) {

    location <- AllNI_Crimedata[5]
    postcode <- find_a_postcode_test1(location)
    postcode
   # location
    #cat(paste(postcode, location, sep = ","), file = output, append = T, fill = T)
    #print(paste(postcode, location, sep = ","))
}

#Modify the dataset
All_NI_data[All_NI_data == ' '] <- NA
missing_data <- is.na(All_NI_data)

#Remove attributes 
exclude_list <- !names(All_NI_data) %in% c("Crime.ID", "Reported.by", "LSOA.code", "LSOA.name", "Last.outcome.category", "Context")
AllNI_Crimedata <- All_NI_data[(exclude_list)]
AllNI_Crimedata

#Show the no: of rows and 6 records in AllNICrimeData
nrow(AllNI_Crimedata)
str(AllNI_Crimedata)
head(AllNI_Crimedata)

#Factorise crime attribute
Crime_Type_Factor <- as.factor(AllNI_Crimedata$Crime.type)
AllNI_Crimedata$Crime.type <- Crime_Type_Factor
str(AllNI_Crimedata)

#Save the contents of All_NI_data to a csv file called "AllNICrimeData.csv"
AllNI_Crimedata <- write.csv(AllNI_Crimedata, file = "C:/Users/raghunath/Source/Repos/DataScience/Lab3_Amalgamation/Data/AllNICrimeData.csv", quote = FALSE, na = "", row.names = FALSE)

#To modify 'Location' attribute
AllNI_Crimedata$Location <- gsub("On or near", "", AllNI_Crimedata$Location, ignore.case = T)

# Call the function and return the result to a data frame
CleanNIPostcodeData <- combined_data("D:/Data Science/Lab/", "CleanNIPostcodeData.csv")
head(CleanNIPostcodeData)

#write the CleanNIPostcodeData to project folder
CleanNIPostcodeData <- write.csv(CleanNIPostcodeData, file = "C:/Users/raghunath/Source/Repos/DataScience/Lab3_Amalgamation/Data/CleanNIPostcodeData.csv", quote = FALSE, na = "", row.names = FALSE)
str(CleanNIPostcodeData)

#Show data that contains Town Strabane and postcode BT82
Strabane_data <- subset(AllNI_Crimedata, grepl('Strabane', Town) & grepl('BT82', postcode))
Strabane_data


#find_a_postcode('STATION ROAD')
MatchingPostCodes <- match_postcode()
apply(head(AllNI_Crimedata,500),1,addpostcodes,output="outputfile")


head(Strabane_data)

