library(dplyr)

data <- read.csv("./household_power_consumption.txt", sep=";")

data$dateTime <- paste(data$Date, data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data.upperLimit <- as.Date("2007-02-02", format="%Y-%m-%d")
data.lowerLimit <- as.Date("2007-02-01", format="%Y-%m-%d")

data <- filter(data, (data$Date <= data.upperLimit) )
data <- filter(data,  (data$Date >= data.lowerLimit) )

time <- strptime(data$dateTime, format = "%d/%m/%Y %H:%M:%S")


png(file=".\\plot2.png",
    width=480, height=480)
plot(time, data$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()