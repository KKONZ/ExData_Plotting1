## To read this file download data here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Set working directory in R to wherever you saved the household_power_consumption file

## Read and tidy up data
Prj1 <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings= "?")

## subset to 2/1 & 2/2 from 2007
subData <- subset(Prj1, (Prj1$Date == "1/2/2007" | Prj1$Date == "2/2/2007"))
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

## Create Hist and save as png graphics device
png("plot1.png", width = 480, height = 480)
hist(subData$Global_active_power, main="Global Active Power",col='red', ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
