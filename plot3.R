DataTest <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = " ", quote ='\"')

SubData <- subset(DataTest, Date %in% c("1/2/2007","2/2/2007"))

SubData$Date <- as.Date(SubData$Date, format = "%d/%m/%Y")

dateTime<- paste(as.Date(SubData$Date), SubData$Time)

SubData$Datetime <- as.POSIXct(dateTime)


with(SubData,{ plot(Sub_metering_1~Datetime, type = "l",  xlab = " ", 
       ylab = "Global Active Power (kilowatts)",)
lines(Sub_metering_2~Datetime,col = "Red")
lines(Sub_metering_3~Datetime,col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()
