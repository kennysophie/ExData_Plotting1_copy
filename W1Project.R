##
library(data.table)
library(dplyr)

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = 'data.zip')
unzip("data.zip")
rawdata<-read.csv2(file = 'household_power_consumption.txt', sep = ";", na.strings = "?")
data<-as.data.table(rawdata)
data$Date<- as.Date(data$Date, "%d/%m/%Y")
data<-filter(data, Date ==  as.Date("01/02/2007","%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))



data$Time<-as.character(data$Time)
data<-as.data.table(
  append(data,
         strptime(data$Time, "%H:%M:%S"))
)

numdata<- data%>% select(Global_active_power:Sub_metering_3)
numdata<- lapply(numdata, as.numeric)
data<-data%>%select(-(Global_active_power:Sub_metering_3))
data<- as.data.table(append(data, numdata))
tVector<-
  with(data,{
    tChar<-paste(format(Date, "%d %M %Y"),
                 hour,
                 min,
                 sec)
    strptime(tChar, "%d %M %Y %H %M %S")      
  })

save(data, tVector, file = "W1Data")




