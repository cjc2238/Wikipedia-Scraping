x <- c("plyr", "dplyr", "stringr", "lubridate", "jsonlite", "httr", "xml2", "rvest", "devtools", "ggmap", "networkD3", "RSelenium", "pageviews", "aRxiv", "twitteR", "streamR", "scales", "gridExtra","tm","wordcloud","RCurl","ROAuth","SnowballC")
lapply(x, require, ch = T)

trump_views <- article_pageviews(project = "en.wikipedia", article = "Donald Trump", user_type = "user", start = "2016010100", end = "2016111000")

penn_views <- article_pageviews(project = "en.wikipedia", article = "University of Pennsylvania", user_type = "user", start = "2016010100", end = "2016111000")

trump_views$Page = "Donald Trump"
penn_views$Page = "U-Penn"

df = rbind(trump_views, penn_views)
df$timestamp = as.numeric(gsub("-","",as.character(df$date)))

ggplot(data = df, aes(date, views, color=Page)) + geom_line() + geom_point(size=.8) + scale_y_log10() + labs(list(title = "Page Views on Wikipedia in 2016 (Log 10 Scale)", x = "Date", y = "Number of Views (Daily)"))

                                                                                                             