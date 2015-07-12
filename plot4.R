source("readData.R")

electric <- parseFile()

png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

# 1
plot(electric$DateTime,
     electric$Global_active_power,
     type = "l",
     pch = NA,
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# 2
plot(electric$DateTime, electric$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(electric$DateTime, electric$Voltage)

# 3
plot(electric$DateTime,
     electric$Sub_metering_1,
     type = "l",
     pch=NA,
     xlab="",
     ylab="Energy sub metering")
lines(electric$DateTime, electric$Sub_metering_2, col="red")
lines(electric$DateTime, electric$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       bty = "n")

# 4
plot(electric$DateTime,
     electric$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
