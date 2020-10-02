makeplot1 <- function(){
  library(dplyr)
  setwd("~/R/Projects/Coursera Class/ExData_Plotting1")
  if(!file.exists("PowerConsumptionData.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL,"PowerConsumptionData.zip",method="curl")
  }
  data <- read.table(unzip("PowerConsumptionData.zip"),sep=";",header = TRUE, na.strings = "?")
  mydata <- subset(data,Date=="1/2/2007" | Date == "2/2/2007")
  mydata <- mydata %>% mutate(datetime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))
  png("plot1.png")
  with(mydata,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
  dev.off()
}
