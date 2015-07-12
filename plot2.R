source("readData.R")

electric <- parseFile()

png("plot2.png", height=480, width=480)

plot(electric$DateTime,
     electric$Global_active_power,
     type = "l",
     pch = NA,
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

