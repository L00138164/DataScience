
library(XML)
library(rvest)

#Get the Crime fiction book display it and show the structure
crimebooks_data_table <- scrap_crimebook_data()
head(crimebooks_data_table, 800)
str(crimebooks_data_table)

#To write the data into a csv file
crimebook_data <- write.csv(crimebooks_data_table, file = "C:/Users/raghunath/Source/Repos/DataScience/Lab4_WebScrapping/crimebook_data/crimebooksdata.csv", row.names = FALSE)

#Function to read the html page and append the book name, author's name and ratings
scrap_crimebook_data <- function() {

    total_page_num <- 8
    base_page_url <- 'https://www.goodreads.com/list/show/3919.Best_Modern_Mystery_Crime_fiction?page='
    lst_topics <- c()
    lst_authors <- c()
    lst_ratings <- c()

    for (init_page_num in 1:total_page_num) {
        
        actual_url = paste(base_page_url, as.character(init_page_num), sep = "")
      
        # Reading the HTML code from the website
        web_page <- read_html(actual_url,)

        tbls <- html_nodes(web_page, "table")

        topic_name <- get_topic_name(actual_url)
        author_name <- get_author_name(actual_url)
        book_rating <- get_book_rating(actual_url)
       
        lst_topics <- c(lst_topics, topic_name)
        lst_authors <- c(lst_authors, author_name)
        lst_ratings <- c(lst_ratings, book_rating)        

    }   
    crime_book_data <- data.frame(BookTitle = lst_topics, AuthorName = lst_authors, BookRating = lst_ratings)
    return(crime_book_data)
}

#Funtion to get the topic name
get_topic_name<- function(arg_page_url)
{  
    topicname <- html_text(html_nodes(get_table(arg_page_url), '.bookTitle'), trim = TRUE)
    return(topicname)
}

#Function to get the author name
get_author_name <- function(arg_page_url) {
    
    authorname <- html_text(html_nodes(get_table(arg_page_url), 'a.authorName'), trim = TRUE)
    return(authorname)
}

#Function to get the book rating
get_book_rating <- function(arg_page_url) {
  
    score <- html_text(html_nodes(get_table(arg_page_url), 'span.minirating'), trim = FALSE)
    rating <- trimws(substr(score, 0, 5))
    return(rating)
}

#Function to read the html page and get the information
get_table <- function(arg_page_url) {

    f_web_page <- read_html(arg_page_url,)
    page_tbls <- html_nodes(f_web_page, "table")
    return(page_tbls)
}







