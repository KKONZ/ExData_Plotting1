## To read this file download data here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Set working directory in R to wherever you saved the household_power_consumption file

## Read and tidy up data
Prj1 <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings= "?")

## subset to 2/1 & 2/2 from 2007
subData <- subset(Prj1, (Prj1$Date == "1/2/2007" | Prj1$Date == "2/2/2007"))
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

## Combine Date and time
subData$Date_Time <- as.POSIXct(paste(subData$Date, subData$Time))

## Create 2nd plot and save as png graphics device
plot(subData$Date_Time,subData$Global_active_power,ylab="global active power",xlab="",type="l")
dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
