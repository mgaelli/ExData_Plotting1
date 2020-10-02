makeplot3 <- function() {
  library(dplyr)
  setwd("~/R/Projects/Coursera Class/ExData_Plotting1")
  if(!file.exists("PowerConsumptionData.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL,"PowerConsumptionData.zip",method="curl")
  }
  data <- read.table(unzip("PowerConsumptionData.zip"),sep=";",header = TRUE, na.strings = "?")
  mydata <- subset(data,Date=="1/2/2007" | Date == "2/2/2007")
  mydata <- mydata %>% mutate(datetime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))
  png("plot3.png")
  with(mydata,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
  with(mydata,lines(datetime,Sub_metering_1))
  with(mydata,lines(datetime,Sub_metering_2,col="red"))
  with(mydata,lines(datetime,Sub_metering_3,col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  dev.off()
}