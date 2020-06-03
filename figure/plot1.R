library(dplyr)

data <- read.csv("./household_power_consumption.txt", sep=";")

data$dateTime <- paste(data$Date, data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data.upperLimit <- as.Date("2007-02-02", format="%Y-%m-%d")
data.lowerLimit <- as.Date("2007-02-01", format="%Y-%m-%d")

data <- filter(data, (data$Date <= data.upperLimit) )
data <- filter(data,  (data$Date >= data.lowerLimit) )

data$Global_active_power <- as.numeric(data$Global_active_power)


png(file=".\\plot1.png",
    width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global active power (kilowatts)", main="Global Active Power") 
dev.off()