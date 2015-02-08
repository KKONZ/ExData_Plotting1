## Read and tidy up data
Prj1 <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings= "?")

## subset to 2/1 & 2/2 from 2007
subData <- subset(Prj1, (Prj1$Date == "1/2/2007" | Prj1$Date == "2/2/2007"))
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

## Combine Date and time
subData$Date_Time <- as.POSIXct(paste(subData$Date, subData$Time))

png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

hist(subData$Global_active_power, type="l", main="Global Active Power",col='red', ylab= "Frequency", xlab="Global Active Power(kilowatts)")
subData$Date_Time <- as.POSIXct(paste(subData$Date, subData$Time))
plot(subData$DateTime, subData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subData$DateTime, subData$Sub_metering_2, type="l", col="red")
lines(subData$DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(subData$DateTime,subData$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subData$DateTime,subData$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()