source("readData.R")

electric <- parseFile()

png("plot3.png", height=480, width=480)

plot(electric$DateTime, 
     electric$Sub_metering_1,
     type = "l",
     pch=NA,
     xlab="",
     ylab="Energy sub metering")
lines(electric$DateTime, electric$Sub_metering_2, col='red')
lines(electric$DateTime, electric$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

dev.off()
