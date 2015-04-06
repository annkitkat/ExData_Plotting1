data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

convertedData <- data[,c(-1,-2)]
convertedData$DateTime <- strptime(paste(data$Date, data$Time), , format="%d/%m/%Y %H:%M:%S")
convertedData$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]

# Please note (!): since the systems language is german the labels for the x axis are Do, Fr and Sa instead of Thu, Fri and Sat. 
png(filename="plot2.png")
plot(x=convertedData$DateTime, y=convertedData$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



