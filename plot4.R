DataTest <- read.csv("household_power_consumption.txt", header=T, 
                     sep=';', na.strings="?", nrows=2075259, 
                     check.names=F, stringsAsFactors=F, comment.char="", 
                     quote='\"')

SubData<- subset(DataTest, Date %in% c("1/2/2007","2/2/2007"))

SubData$Date <- as.Date(SubData$Date, format="%d/%m/%Y")

dateTime<- paste(as.Date(SubData$Date), SubData$Time)

SubData$Datetime <- as.POSIXct(dateTime)



par(mfrow=c(2,2), mar=c(2,4,2,1), oma=c(0,0,2,0))

with(SubData, { plot(Global_active_power ~ Datetime, type ="l", xlab = " ", 
       ylab = "Global Active Power (kilowatts)")
  plot(Voltage ~ Datetime, type = "l", xlab = "datetime",
       ylab = "Voltage (volt)")
  plot(Sub_metering_1 ~ Datetime, type ="l", xlab = " ",
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime, col = "Red")
  lines(Sub_metering_3~Datetime, col = "Blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l" , xlab = "datetime", 
       ylab = "Global Rective Power (kilowatts)")
  })

dev.copy(png, file = "plot4.png")
dev.off()
