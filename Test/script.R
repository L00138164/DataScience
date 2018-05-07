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