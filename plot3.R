## To read this file download data here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Set working directory in R to wherever you saved the household_power_consumption file

## Read and tidy up data
Prj1 <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings= "?")

## subset to 2/1 & 2/2 from 2007
subData <- subset(Prj1, (Prj1$Date == "1/2/2007" | Prj1$Date == "2/2/2007"))
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

## Combine Date and time
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time))

png("plot3.png", width = 480, height = 480)
plot(subData$DateTime, subData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subData$DateTime, subData$Sub_metering_2, type="l", col="red")
lines(subData$DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
