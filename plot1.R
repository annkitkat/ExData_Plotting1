setwd("C:/Users/Annika/Projekte/ExData_Plotting1")

data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

convertedData <- data
convertedData$Time <- strptime(data$Time, format="%H:%M:%S")
convertedData$Date <- as.Date(data$Date)
convertedData$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]

subset <- convertedData[!is.na(convertedData$Global_active_power),]

png(filename="plot1.png")
hist(subset$Global_active_power, breaks=seq(from=0, to=12, by=0.5), freq=TRUE, col="red", border="black", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", plot=TRUE, xlim=c(0,6.2))
dev.off()