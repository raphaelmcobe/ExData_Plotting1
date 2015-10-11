data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

data[, 1] <- as.Date(data[, 1], '%d/%m/%Y')

data.subset <- data[as.Date('2007-02-01') <= data$Date & 
                  data$Date <= as.Date('2007-02-02'), ]

date.full <- paste(data.subset$Time, data.subset$Date, sep=" ")

date.full <- strptime(date.full, format="%H:%M:%S %Y-%m-%d")


png(file = "plot2.png", width=480, height=480)

plot(date.full, data.subset$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()