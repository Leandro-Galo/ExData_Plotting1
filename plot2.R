
DataTest <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = " ", quote ='\"')

SubData <- subset(DataTest, Date %in% c("1/2/2007","2/2/2007"))

SubData$Date <- as.Date(SubData$Date, format = "%d/%m/%Y")

dateTime<- paste(as.Date(SubData$Date), SubData$Time)

SubData$Datetime <- as.POSIXct(dateTime)

with(SubData, plot(Global_active_power~Datetime, type ="l", xlab = " ", 
                   ylab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()
