x <- 2
y <- 5
x
y
class(x)
is.numeric(x)
c(10, 150, 30, 40, 55.6)
q <- c(3, 3, 3)
p <- c(3, 5, 6, 8)
q + p

install.packages("swirl")
library(swirl)
install_course_zip("D:/swirl_courses-master.zip", multi = TRUE, which_course = "R Programming")
swirl()

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
z <- 2 * x + y + 1
z

z <- c(1:3, NA)
result <- is.na(z)
result

vec1 <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Hurling", "Basketball", "Tennis", "Cricket", "Lacrosse")
vec2 <- c("Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
vec2 <- vec1 + vec2
vec2

vec2_factor <- as.factor(vec2)
vec2_factor

library(swirl)
swirl

x <- c(34, 56, 55, 87, NA, 4, 77, NA, 21, NA, 39)
length(is.na(x))

sum(is.na(x))

count(is.na(x))

? count

is.na(x)
y <- is.na(x)
y
a <- c()

date_col <- c("2018-15-10", "2018-11-01", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
colnames <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

my_data <- data.frame(date_col, country_col,gender_col, age_col, q1_col, q2_col, q3_col,q4_col,q5_col )
colnames(my_data) <- colnames
my_data
head(my_data)
str(my_data)

my_data$Age[my_data$Age == 99] <- NA
my_data

my_data$AgeCat[my_data$Age >= 45] <- "Elder"
my_data$AgeCat[my_data$Age >= 26 & my_data$Age <= 44] <- "Middle Aged"
my_data$AgeCat[my_data$Age <= 25] <- "Young"
my_data$AgeCat[is.na(my_data$Age)] <- "Elder"

my_data

AgeCat <- factor(my_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
AgeCat
my_data$AgeCat <- AgeCat

summary_col <- my_data$Q1 + my_data$Q2 + my_data$Q3 + my_data$Q4 + my_data$Q5
my_data <- data.frame(my_data, summary_col)

my_data

date_format <- "%b %d %Y"
today <- Sys.Date()
output_date <- format(today, format = date_format)
output_date

#Display the difference between the dates
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2018-01-22")
days <- enddate - startdate
days

today <- Sys.Date()
today
birth_date <- as.Date("1986-04-02")
diff_dates <- difftime(today, birth_date, units =  "weeks")
diff_dates

#Sorting data by age
my_data
new_data <- my_data[order(my_data$Age), ]
new_data

#using attach command to bypass need for '$' sign
attach(my_data)
str(my_data$Age)
str(my_data$Gender)
new_data <- my_data[order(Gender, Age),] #ascending
new_data

new_data <- my_data[order(decreasing = TRUE, Gender, Age),] #descending order
new_data

#Working with missing values
my_data
new_data <- na.omit(my_data)
new_data

#get the complete.cases for data
my_data
complete_data <- complete.cases(my_data)
complete_data

#sum and mean of missing rows
sum(complete_data)
mean(complete_data)

#complete.cases for missing rows and columns
complete_data <- my_data[complete.cases(my_data),]
complete_data

#List rows with missing values
missing_data <- my_data[!complete.cases(my_data),]
missing_data

missing_data <- complete.cases(missing_data)
missing_data
sum(missing_data)
mean(missing_data)

complete.cases(my_data$Age)

#Selecting data between 2 ranges
my_data$Date <- as.Date(my_data$Date, "%Y-%m-%d")
startdate <- as.Date("2018-01-01")
enddate <- as.Date("2018-01-31")
new_data <- my_data[which(my_data$Date >= startdate & my_data$Date <= enddate),]
new_data

#Using subset function
attach(my_data)
new_data <- subset(my_data, Age >= 35 | Age < 24, select = c(Q1, Q2, Q3, Q4))
new_data

attach(my_data)
new_data <- subset(my_data, Gender == "M" &  Age > 25, select = c(Gender,Q4))
new_data

library(swirl)

#Function to add 2 no:s and display the results
add_two_numbers <- function(no1, no2)
{
    result <- no1 + no2
    return(result)
}


k <- add_two_numbers(4,8)
k

library(swirl)
swirl()

my_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:4, 2), d = 2)
my_list
lapply(my_list, sum)
sapply(my_list,sum)

simple_function <- function(first_list, second_list)
{
    result <- NROW(first_list) + NROW(second_list)
    return(result)

}

mapply(simple_function, first_list, second_list)

first_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:4, 2), d = 2)
second_list <- list(a = matrix(1:9, 3), b = 1:7, c = matrix(1:4, 2), d = 2)

swirl::install_course()
library(swirl)

url <- 'https://www.imdb.com/search/title?release_date=2017-01-01,2017-12-31&count=250'

# Reading the HTML code from the website
web_page <- read_html(url)

# Quick look at the contents of web_page
head(web_page)

str(web_page)

# Using HTML tag to scrape the rankings section - IMDB site is 
# examined for this information first
rank_data_html <- html_nodes(web_page, '#main > div > div > div.lister-list > div:nth-child(n) > div.lister-item-content > h3 > span.lister-item-index.unbold.text-primary')
head(rank_data_html, 10)
length(rank_data_html)

# Converting the ranking data from HTML to text
rank_data <- html_text(rank_data_html)

# Let's have a look at the rankings data
head(rank_data, 10)

library(swirl)
install_course_zip("D:/Data Science/swirl_courses-master.zip", multi = TRUE, which_course = "Open Intro")
swirl()

install.packages("pwr")

library(pwr)
power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.5), sig.level = 0.05, power = 0.8, alternative = "greater")
plot(power_changes)

power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.5), sig.level = 0.01, power = 0.95, alternative = "greater")
plot(power_changes)

power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.5), sig.level = 0.01, power = 0.95)
plot(power_changes)

power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.5), sig.level = 0.01, n = 40, alternative = "greater")
power_changes
plot(power_changes)

power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.5), sig.level = 0.01, n = 40)
power_changes
plot(power_changes)

power_changes <- pwr.p.test(h = ES.h(p1 = 0.65, p2 = 0.5), sig.level = 0.05, power=0.8)
power_changes
plot(power_changes)

#To get the effect size and to use it to test the data
effect_size <- cohen.ES(test = c("r"), size = c("medium"))
pwr.r.test(r = effect_size$effect.size, power = 0.8, sig.level = 0.05)

effect_size<-c(0.2,0.5,0.8)
power_changes <- pwr.p.test(h = effect_size, sig.level = 0.05, n = 20)
power_changes

power_changes <- pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.5), sig.level = 0.05, power = .8)
plot(power_changes)

power_changes <- pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.5), sig.level = 0.05, power = .95)
power_changes
plot(power_changes)

swirl::install_course()
library(swirl)


data(diamonds, package = "ggplot2")
head(diamonds, 4)
dim(head(diamonds, 4))

library(magrittr)
diamonds %>% head(4) %>% dim

x <- c(0.109, .359, .63, .996, .515, .142, .017, .829, .907)
round(exp(diff(log(x))), 1)

x %>% log %>% diff %>% exp %>% round(1)

install.packages("dplyr")
library(dplyr)
diamonds %>% head(5)

head(diamonds)

slice(diamonds, 1:20)
slice(diamonds, c(1:5, 8, 15:20))

set <- select(diamonds, carat, price)
mutate(set, ratio = price / carat)
mutate(set, ratio = price / carat, double = ratio * 2)

diamonds %>% select(carat, price) %>% mutate(ratio = price / carat)
diamonds %>% select(carat, price) %>% mutate(ratio = price / carat, Double = ratio * 2)

summarise(diamonds, AvgPrice = mean(price),
                    MedianPrice = median(price),
                    AvgCarat = mean(carat))

#group by example
data_grouped <- group_by(diamonds, cut)
data_summary <- summarise(data_grouped, AvgPrice = mean(price), SumCarat = sum(carat))
arrange(data_summary, AvgPrice)

#Load the lotto data
csv_file_list <- list.files(path = "D:/Data Science/Lab/Lotto", pattern = "*.csv")
my_lotto_data <- NULL
# Examine the vector
csv_file_list


# Function that reads all csv files into one data frame and returns the result.
combine_results <- function(file_list) {
    # Initialise lotto_data variable
    # Note: it hasn't been assigned a specific variable type eg string 
    all_lotto_data <- NULL

    for (csv_file in file_list) {
        # Read each of the csv files in turn and skip the first line of data as it
        # contains headings within the csv file
        lotto_file <- read.csv(header = TRUE, paste("D:/Data Science/Lab/Lotto", csv_file, sep = ""), stringsAsFactors = FALSE)
        # Only select attributes we're interested in
        # We don't need the first attribute
        data_of_interest <- lotto_file[1:8]
        # append vertically to the all_lotto_data data frame
        all_lotto_data <- rbind(all_lotto_data, data_of_interest)
    }
    # Return the concatenated result
    return(all_lotto_data)
}

# Call the function and return the result to a data frame
my_lotto_data <- combine_results(csv_file_list)
# show the contents of my_lotto_data
my_lotto_data

#Save the contents of my_lotto_data to a csv file called "ld.csv"
write.csv(my_lotto_data, file = "ld.csv", quote = FALSE, na = "", row.names = FALSE)

install.packages("hflights")
library(hflights)
library(dplyr)

head(hflights)
str(hflights)

hflights_df <- tbl_df(hflights)
str(hflights_df)

#To filter the data
f_df <- filter(hflights_df, Month == "1", UniqueCarrier == "AA" | UniqueCarrier == "UA")
f_df

#To arrange in descending order
f_df %>% arrange(desc(Month, DayofMonth, AirTime))

#To select attributes
f_df %>% select(Year:DayOfWeek, TailNum, ActualElapsedTime)

#To add 2 attributes
f_df %>% mutate(Gain = ArrDelay - DepDelay,Gain_per_hour = Gain/(AirTime/60))

#To summarise the function
f_df %>% na.omit(ArrDelay) %>% summarise(Delay = mean(ArrDelay))

Dosage <- c(20, 30, 40, 45, 60)
Drug_A <- c(16, 20, 27, 40, 60)
Drug_B <- c(15, 18, 25, 31, 40)

ResponsetodrugA <- Drug_A
ResponsetodrugB <- Drug_B

drugs <- data.frame(Dosage, ResponsetodrugA, ResponsetodrugB)
drugs
plot(drugs)

plot(Dosage, type = "o", col = "blue")

plot(Dosage, Drug_A, type = "b")

#To get two charts on same window
par(new=TRUE)
plot(Dosage, Drug_B, type = "b")
plot(Dosage, Drug_A, type = "b")

opar <- par(no.readonly = TRUE)
opar <- par(lty = 2, pch = 17)
plot(Dosage, Drug_A, type = "b")
par(opar)

plot(Dosage, Drug_A, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2)
title(main = "Drug Dosage", col.main = "blue", font.main = 4)

plot(Dosage, Drug_A, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2, ylim = c(0, 100))
title(main = "Drug Dosage", col.main = "blue", font.main = 4)
lines(Dosage, Drug_B, type = "o", pch = 22, lty = 2, col = "red")

graph_range <- range(0, Drug_A, Drug_B)
graph_range

plot(Drug_A, ylim = graph_range, axes = FALSE, type = "b", lty = 3, pch = 15, cex = 2, xlab = "millilitres")
lines(Drug_B, type = "o", pch = 22, lty = 2, col = "red")

axis(1, at = 1:5, lab = c("20ml", "40ml", "60ml", "80ml", "100ml"))

axis(2, las = 1, at = 5 * 0:graph_range[2])

box(which = "plot", lty = "solid")

AIC(linearMod)
BIC(linearMod)


# predict the models 
# to get random sample
no_of_records <- sample(1:nrow(cars), 0.8 * nrow(cars))

#model training data
training_data <- cars[no_of_records,]

#test data
testing_data <- cars[-no_of_records,]

#Build the model
lr_model <- lm(dist ~ speed, data = training_data)

#Predict the distance from testing data
dist_predicted <- predict(lr_model, testing_data)

#Summary
summary(lr_model)

#make actual_predicteds data frame
actual_preds <- data.frame(cbind(actuals = testing_data$dist, predicted = dist_predicted))
head(actual_preds)

#check the correlation accuracy
correlation_accuracy <- cor(actual_preds)
correlation_accuracy

#Min-max accuracy
min_max_accuracy <- mean(apply(actual_preds, 1, min) / apply(actual_preds, 1, max))
min_max_accuracy

#MAPE
mape <- mean(abs((actual_preds$predicted - actual_preds$actuals)) / actual_preds$actuals)
mape

install.packages("DAAG")
library(DAAG)

cvResults <- suppressWarnings(CVlm(data = cars, form.lm = dist ~ speed, m = 5, dots = FALSE,
seed = 29, legend.pos = "topleft", printit = FALSE, main = "Small symbols are predicted values while bigger ones are actuals."));

#Closing market price
ts_data <- EuStockMarkets[, 1]
opar <- par()
par(mfrow = c(1, 2))

#Use additive components
decomposed_result <- decompose(ts_data, type = "mult")
plot(decomposed_result)

decomposed_result <- decompose(ts_data, type = "additive")
plot(decomposed_result)

seasonal_trend_error <- stl(ts_data, s.window = "periodic")
par <- opar

seasonal_trend_error$time.series

lagged_ts <- lag(ts_data, 3)

install.packages("DataCombine")
library(DataCombine)

my_dataframe <- as.data.frame(ts_data)

my_dataframe <- slide(my_dataframe, "x", NewVar = "xLag1", slideBy = -1)

my_dataframe <- slide(my_dataframe, "x", NewVar = "xLead1", slideBy = -1)
head(my_dataframe)
tail(my_dataframe)

acf_res <- acf(AirPassengers)

pacf_res <- pacf(AirPassengers)

plot(JohnsonJohnson)
trained_model <- lm(JohnsonJohnson ~ c(1:length(JohnsonJohnson)))

plot(resid(trained_model), type = "l")

install.packages("forecast")
library(forecast)

ts_decompose <- stl(AirPassengers, "periodic")

ts_seasonal_adjust <- seasadj(ts_decompose)

plot(AirPasssengers, type = "l")

plot(ts_seasonal_adjust, type = "l")

seasonplot(ts_seasonal_adjust, 12, col = rainbow(12), year.labels = TRUE, main = "Seasonal plot: AirPassengers")

library(tseries)

adf.test(ts_data)

kpss.test(ts_data)

nsdiffs(AirPassengers)

AirPassengers_seasdiff <- diff(AirPassengers, lag = frequency(AirPassengers), differences = 1)

plot(AirPassengers_seasdiff, type = "l", main = "Seasonally differenced")


plot(Nile)

ndiffs(Nile)

d_nile <- diff(Nile)
plot(d_nile)

ndiffs(d_nile)

adf.test(d_nile)

Acf(d_nile)
Pacf(d_nile)

fit <- Arima(Nile, order = c(0, 1, 1))
fit

accuracy(fit)

qqnorm(fit$residuals)
qqline(fit$residuals)

Box.test(fit$residuals, type = "Ljung-Box")

series_forecast <- forecast(fit, 3)
plot(series_forecast)

fit <- auto.arima(Nile)
fit

accuracy(fit)