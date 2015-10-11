
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

data[, 1] <- as.Date(data[, 1], '%d/%m/%Y')

data.subset <- data[as.Date('2007-02-01') <= data$Date & 
                  data$Date <= as.Date('2007-02-02'), ]

png(file = "plot1.png", width=480, height=480)

hist(data.subset$Global_active_power, col='red', main='Global Active Power', 
    xlab='Global Active Power (kilowatts)')

dev.off()
