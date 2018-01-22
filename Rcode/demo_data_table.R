#install.packages("data.table")
library(data.table)
flights <- fread("C:/Users/cnwang/Desktop/flights14.csv")
flights
flights<-data.table(flights)

class(flights)

#觀察值篩
flights[grepl('6',month)]

#i,j觀察值篩
flights[grepl('JFK',origin)&dest=="LAX"]
