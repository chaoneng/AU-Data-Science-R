#install.packages("data.table")
library(data.table)
flights <- fread("C:/Users/cnwang/Desktop/flights14.csv")
flights
flights<-data.table(flights)

class(flights)

#Æ[¹î­È¿z
flights[grepl('6',month)]

#i,jÆ[¹î­È¿z
flights[grepl('JFK',origin)&dest=="LAX"]
