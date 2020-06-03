library(dplyr)

data <- read.csv("./household_power_consumption.txt", sep=";")

data$dateTime <- paste(data$Date, data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data.upperLimit <- as.Date("2007-02-02", format="%Y-%m-%d")
data.lowerLimit <- as.Date("2007-02-01", format="%Y-%m-%d")

data <- filter(data, (data$Date <= data.upperLimit) )
data <- filter(data,  (data$Date >= data.lowerLimit) )

time <- strptime(data$dateTime, format = "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png(file=".\\plot3.png",
    width=480, height=480)

plot(time, data$Sub_metering_1, "l", col="black", xlab="", 
     ylab="Energy sub metering")

lines(time, data$Sub_metering_2, "l", col="red")
lines(time, data$Sub_metering_3, "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

dev.off()