data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

data[, 1] <- as.Date(data[, 1], '%d/%m/%Y')

data.subset <- data[as.Date('2007-02-01') <= data$Date & 
                  data$Date <= as.Date('2007-02-02'), ]

date.full <- paste(data.subset$Time, data.subset$Date, sep=" ")

date.full <- strptime(date.full, format="%H:%M:%S %Y-%m-%d")

png(file = "plot3.png", width=480, height=480)

plot(date.full, data.subset$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(date.full, data.subset$Sub_metering_2, col="red")
lines(date.full, data.subset$Sub_metering_3, col="blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(2.5, 2.5, 2.5))


dev.off()