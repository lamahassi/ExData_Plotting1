setwd("~/Desktop/Coursera/Exploratory Data Analysis/Project 1")

#Read file, subset, create datetime category
power <- read.table("household_power_consumption.txt", skip=1, sep=";", na.strings="?")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Plot 2: 
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
with(power, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(power, plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
with(power, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(datetime, power$Sub_metering_2, col="red")
lines(datetime, power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")
with(power, plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()
