data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

data[, 1] <- as.Date(data[, 1], '%d/%m/%Y')

data.subset <- data[as.Date('2007-02-01') <= data$Date & 
                  data$Date <= as.Date('2007-02-02'), ]

date.full <- paste(data.subset$Time, data.subset$Date, sep=" ")

date.full <- strptime(date.full, format="%H:%M:%S %Y-%m-%d")

png(file = "plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(date.full, data.subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
plot(date.full, data.subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date.full, data.subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
lines(date.full, data.subset$Sub_metering_2, type="l", col="red")
lines(date.full, data.subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(date.full, data.subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
