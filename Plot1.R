setwd("~/Desktop/Coursera/Exploratory Data Analysis/Project 1")

#Read file, subset
power <- read.table("household_power_consumption.txt", skip=1, sep=";", na.strings="?")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


#Plot 1: Histogram Global Active Power
class(power$Global_active_power)
png("plot1.png", width=480, height=480)
hist(power$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
