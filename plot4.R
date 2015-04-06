data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

convertedData <- data[,c(-1,-2)]
convertedData$DateTime <- strptime(paste(data$Date, data$Time), , format="%d/%m/%Y %H:%M:%S")

convertedData$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
convertedData$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
convertedData$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]

convertedData$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
convertedData$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
convertedData$Voltage <- as.numeric(levels(data$Voltage))[data$Voltage]

png(filename="plot4.png")
par(mfrow=c(2,2))
plot(x=convertedData$DateTime, y=convertedData$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")
plot(x=convertedData$DateTime, y=convertedData$Voltage, type="l", main="", xlab="datetime", ylab="Voltage")

plot(convertedData$DateTime, convertedData$Sub_metering_1, type="l", ylim=range(c(0,38)), main="", xlab="", ylab="Energy sub metering")
lines(x=convertedData$DateTime, y=convertedData$Sub_metering_2, col="red")
lines(x=convertedData$DateTime, y=convertedData$Sub_metering_3, col="blue")
legend(as.POSIXct("2007-02-01 12:30:0"), 39.5, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),
       text.col = "black", lty = c(1,1,1))

plot(x=convertedData$DateTime, y=convertedData$Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power")
dev.off()

