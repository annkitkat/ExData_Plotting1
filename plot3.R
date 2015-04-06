data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

convertedData <- data[,c(-1,-2)]
convertedData$DateTime <- strptime(paste(data$Date, data$Time), , format="%d/%m/%Y %H:%M:%S")
convertedData$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
convertedData$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
convertedData$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]

# Please note (!): since the systems language is german the labels for the x axis are Do, Fr and Sa instead of Thu, Fri and Sat. 
png(filename="plot3.png")
plot(convertedData$DateTime, convertedData$Sub_metering_1, type="l", ylim=range(c(0,38)), main="", xlab="", ylab="Energy sub metering")
lines(x=convertedData$DateTime, y=convertedData$Sub_metering_2, col="red")
lines(x=convertedData$DateTime, y=convertedData$Sub_metering_3, col="blue")
legend(as.POSIXct("2007-02-02 7:15:0"), 39.5, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bg="white", col = c("black", "red", "blue"),
       text.col = "black", lty = c(1,1,1))
dev.off()


