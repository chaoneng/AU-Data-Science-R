#install.packages("data.table")
library(data.table)
flights <- fread("C:/Users/cnwang/Desktop/flights14.csv")
flights
flights<-data.table(flights)

class(flights)

#�[��ȿz
flights[grepl('6',month)]

#i,j�[��ȿz
flights[grepl('JFK',origin)&dest=="LAX"]